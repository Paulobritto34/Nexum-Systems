<div align="center">

<img src="site/logos/nexum-systems-claro.svg" alt="NEXUM Systems" height="72">

### Sistemas de gestão para transporte coletivo, frotas e oficinas
**Rotas, passageiros, rastreamento, checklist com prova em foto, ordens de serviço e medição de contrato.** Tudo no mesmo registro, funcionando até sem sinal.

</div>

---

## Sobre este repositório

Este é o site institucional e comercial da **NEXUM Systems**. Ele apresenta os produtos da empresa, mostra como funcionam e reúne os canais para pedir uma apresentação.

A página é estática: um único `index.html` (HTML, CSS e JavaScript), sem build e sem dependências externas. Fontes, logotipos e ícones ficam na pasta `site/`, então nada é carregado de terceiros.

## Os produtos

### NEXUM Fleet
Frota, telemetria e gestão de passageiros do transporte coletivo, vendido em módulos.

- **Gestão de passageiros:** rotas no mapa, pontos de embarque, otimização por base com aprovação do gestor, cota por turma com overbooking, cadastro público e portal do passageiro.
- **Frota e operação:** computador de bordo Android com checklist, parte diária e embarque por crachá, funcionando offline; medição do contrato por rota e dia; visão própria para a contratante.
- **Rastreamento:** mapa online com satélite, trajeto, paradas, excesso de velocidade, cercas e central de relatórios com exportação em Excel.

### NEXUM Inspect
Checklist de inspeção, ordens de serviço e manutenção de frota, com oficina e contratante no mesmo registro.

- Checklist de entrada, saída e inspeção, com parecer Apto, Ressalvas ou Inapto
- Foto com carimbo de hora, GPS e placa, com alerta de foto repetida
- Orçamento aprovado item a item e catálogo padronizado de peças e mão de obra
- Estoque, nota fiscal por XML, fatura mensal e histórico de cada veículo

### Projetos sob medida
Dashboards em Power BI, integrações com rastreadores e automações para o setor do cliente.

## Estrutura

| Caminho | O que é |
|---|---|
| [`index.html`](index.html) | A página inteira: estilos, conteúdo e scripts |
| [`site/logos/`](site/logos) | Logotipos NEXUM Systems, Fleet e Inspect, em versão clara e escura |
| [`site/fontes/`](site/fontes) | Manrope e Inter, hospedadas localmente |
| [`site/nexum-icone.svg`](site/nexum-icone.svg) e [`site/nexum-simbolo.svg`](site/nexum-simbolo.svg) | Ícone da aba e símbolo da marca |
| [`NEXUM_GitHub.bat`](NEXUM_GitHub.bat) | Atalho para Windows que envia as alterações ao GitHub |

## Ver a página no computador

Abra o `index.html` direto no navegador. Para testar como um servidor, qualquer servidor estático serve, por exemplo:

```bash
python -m http.server 8080
```

e acesse `http://localhost:8080`.

## Configurar os canais de contato

No fim do `index.html`, no bloco `<script>`, ficam as duas variáveis de contato:

```js
var CONTATO_EMAIL = "contato@nexumsystems.com.br";  // e-mail que recebe os pedidos
var CONTATO_WHATSAPP = "5594999999999";             // somente números, com DDI e DDD (vazio oculta o botão)
```

O formulário abre o aplicativo de e-mail do visitante com a mensagem pronta (assunto, nome, empresa, telefone, interesse, tamanho da frota e cenário). Para receber os contatos direto no site, é preciso ligar o formulário a um serviço de formulários ou a um backend.

> Este repositório é público. Não coloque aqui senhas, chaves de API, dados de clientes nem documentos internos.

## Publicar

A página funciona em qualquer hospedagem estática. Para publicar pelo **GitHub Pages**:

1. Envie o conteúdo deste repositório para a branch `main` (o `NEXUM_GitHub.bat` faz isso).
2. No GitHub, abra **Settings, Pages**.
3. Em **Build and deployment**, escolha **Deploy from a branch**, branch `main`, pasta `/ (root)`.
4. Aguarde alguns minutos: o endereço aparece no topo da página de configuração.

Para usar um domínio próprio, preencha o campo **Custom domain** na mesma tela e aponte o DNS conforme a orientação do GitHub.

Em outra hospedagem, suba o `index.html` e a pasta `site/` juntos.

## Atualizar a página

1. Edite o `index.html`.
2. Confira no navegador, em tela larga e no celular.
3. Rode o `NEXUM_GitHub.bat` e escolha **1** para enviar. Se o GitHub Pages estiver ativo, a versão nova entra no ar sozinha.

## Design

A página segue o **NEXUM Design System**: tipografia Manrope e Inter, ícones em SVG (sem emojis), contraste adequado, foco visível e botões grandes. Os estados são comunicados por cor, ícone e texto, nunca só por cor, e as animações respeitam a preferência de movimento reduzido do sistema.

| Cor | Hex | Uso |
|---|---|---|
| Azul-marinho | `#142B45` | Base da marca |
| Verde-petróleo | `#147D92` | Ações |
| Turquesa | `#35B7A4` | Somente sobre fundo escuro |
| Azul-profundo | `#203056` | Apoio |
| Cinza-claro | `#F3F8F8` | Fundos |

## Convenções

- Mensagens de commit em português, no formato `tipo: descrição` (por exemplo, `feat:`, `fix:`, `docs:`)
- Interface sem emojis: ícones sempre em SVG
- Acessibilidade: contraste, foco visível, rótulos nos campos e navegação por teclado

## Direitos

© NEXUM Systems. Todos os direitos reservados. O nome, os logotipos e o conteúdo desta página são da NEXUM Systems e não podem ser reutilizados sem autorização.

---

<div align="center">

**NEXUM Systems** · Feito com o NEXUM Design System

</div>
