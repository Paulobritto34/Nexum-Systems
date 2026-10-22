@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
title NEXUM Systems - Pagina da Empresa - GitHub
cd /d "%~dp0"
rem Sem paginador: o git nao abre o "(END)" que prende a tela esperando a tecla q
set "GIT_PAGER=cat"
set "GIT_TERMINAL_PROMPT=1"

where git >nul 2>nul
if errorlevel 1 (
  echo [ERRO] Git nao encontrado. Instale em https://git-scm.com/download/win e rode de novo.
  pause & exit /b 1
)

:MENU
cls
echo ==============================================
echo   NEXUM Systems - enviar a pagina da empresa ao GitHub
echo ==============================================
echo.
echo   1  Enviar alteracoes ^(commit + push^)
echo   2  Configurar ou trocar o repositorio do GitHub
echo   3  Ver o que mudou
echo   4  Sair
echo   5  Reparar: ligar esta pasta ao historico que ja esta no GitHub
echo.
set /p OP="Escolha uma opcao: "
if "%OP%"=="1" goto ENVIAR
if "%OP%"=="2" goto CONFIG
if "%OP%"=="3" ( git status --short & pause & goto MENU )
if "%OP%"=="4" exit /b 0
if "%OP%"=="5" goto REPARAR
goto MENU

:INICIAR
if exist ".git" goto IDENTIDADE
echo Criando o repositorio local...
git init -b main >nul 2>nul || ( git init >nul & git checkout -b main >nul 2>nul )
:IDENTIDADE
git config user.name >nul 2>nul
if errorlevel 1 (
  set /p GN="Seu nome para os commits: "
  git config user.name "!GN!"
)
git config user.email >nul 2>nul
if errorlevel 1 (
  set /p GE="Seu e-mail do GitHub: "
  git config user.email "!GE!"
)
exit /b 0

:SEGREDOS
rem Seguranca: nenhum arquivo de segredo pode entrar no commit (.env, chaves, certificados). Retorna erro 1 se houver.
git ls-files --cached | findstr /i /r "\.env$ \.env\.local \.env\.production$ \.jks$ \.keystore$ \.pem$" | findstr /v /i "example" >nul
if errorlevel 1 exit /b 0
echo.
echo [BLOQUEADO] Ha arquivo de segredo na lista do commit:
git ls-files --cached | findstr /i /r "\.env$ \.env\.local \.env\.production$ \.jks$ \.keystore$ \.pem$" | findstr /v /i "example"
echo Remova-o do Git e tente de novo:  git rm --cached ^<arquivo^>
exit /b 1

:REPARAR
call :INICIAR
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  echo Configure o repositorio primeiro ^(opcao 2^).
  pause & goto MENU
)
echo Baixando o historico que ja esta no GitHub...
git fetch origin
if errorlevel 1 (
  echo [ERRO] Nao foi possivel baixar do GitHub. Confira o endereco ^(opcao 2^) e se voce esta conectado.
  pause & goto MENU
)
git rev-parse --verify origin/main >nul 2>nul
if errorlevel 1 (
  echo O GitHub ainda nao tem a branch main: nada a reparar. Use a opcao 1.
  pause & goto MENU
)
rem Move so o "ponteiro" para o historico do GitHub; os arquivos desta pasta ficam exatamente como estao.
git reset --soft origin/main
if errorlevel 1 ( echo [ERRO] Nao foi possivel ligar ao historico. & pause & goto MENU )
echo.
echo Pronto. Os seus arquivos NAO foram alterados; o que mudou desde a ultima versao do GitHub aparece como alteracao.
echo Use a opcao 1 para enviar.
pause
goto MENU

:CONFIG
call :INICIAR
echo.
echo Crie antes um repositorio VAZIO e PRIVADO em https://github.com/new
echo ^(sem README, sem .gitignore^) e cole aqui o endereco dele, por exemplo:
echo   https://github.com/Paulobritto34/Sistema-Nexum-Systems-Site.git
echo.
set /p URL="Endereco do repositorio: "
if "%URL%"=="" goto MENU
git remote remove origin >nul 2>nul
git remote add origin "%URL%"
echo Repositorio configurado: %URL%
pause
goto MENU

:ENVIAR
call :INICIAR
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  echo Ainda nao ha repositorio configurado. Vamos configurar agora.
  pause
  goto CONFIG
)
git add -A
call :SEGREDOS
if errorlevel 1 ( pause & goto MENU )
git diff --cached --quiet
if not errorlevel 1 (
  echo Nada novo para enviar.
  git push -u origin main
  if errorlevel 1 (
    echo.
    echo [ERRO] O envio falhou ^(veja a mensagem acima^). Se falou "rejected" ou "fetch first", use a opcao 5.
  )
  pause & goto MENU
)
echo.
echo Arquivos que serao enviados:
git diff --cached --stat
echo.
set "MSG="
set /p MSG="Descreva a alteracao (Enter = atualizacao): "
if not defined MSG set "MSG=atualizacao"
rem Aspas na descricao quebravam o script (e fechavam a janela): troca por apostrofo e envia sem reinterpretar o texto.
set "MSG=!MSG:"='!"
git commit -m "!MSG!"
if errorlevel 1 ( echo [ERRO] Nao foi possivel criar o commit. & pause & goto MENU )
git push -u origin main
if errorlevel 1 (
  echo.
  echo [ERRO] O envio falhou. Causas comuns:
  echo   - voce ainda nao entrou no GitHub: uma janela do navegador deve abrir para entrar;
  echo   - o endereco do repositorio esta errado ^(use a opcao 2^);
  echo   - mensagem "rejected" ou "fetch first": esta pasta perdeu o historico do GitHub ^(use a opcao 5^);
  echo   - o repositorio nao esta vazio e nao e o da pagina ^(crie um novo, sem README^).
  pause & goto MENU
)
echo.
echo Pronto. Pagina enviada ao GitHub.
echo Para publicar no ar, ative o GitHub Pages: Settings - Pages - Branch main - pasta root.
pause
goto MENU
