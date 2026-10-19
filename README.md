<div align="center">

<img src="Nexum Design System/assets/logos/nexum-systems-claro.svg" alt="NEXUM Systems" height="72">

### Sistemas de gestão para oficinas, frotas e transporte
**Checklist com prova em foto, ordens de serviço, estoque, financeiro, rastreamento e passageiros.** Tudo no mesmo registro, funcionando até sem sinal.

</div>

---

## Visão geral

Este é o repositório raiz da **NEXUM Systems**. Ele reúne os produtos, o Design System que padroniza todos eles e a página comercial da empresa.

| Pasta / arquivo | O que é |
|---|---|
| [`index.html`](index.html) | Página comercial da NEXUM Systems (produtos, entregas, como funciona, FAQ e contato) |
| [`site/`](site) | Logos, símbolo e fontes usados pela página comercial |
| [`Nexum Inspect/`](Nexum%20Inspect) | Sistema de checklist, ordens de serviço e manutenção |
| [`Nexum Fleet/`](Nexum%20Fleet) | Sistema de frota, telemetria e gestão de passageiros |
| [`Nexum Design System/`](Nexum%20Design%20System) | Marca, cores, tipografia, componentes, ícones e regras de conteúdo |

## Produtos

### NEXUM Inspect
Checklist de inspeção, ordens de serviço e manutenção de frota. Oficina e contratante trabalham no mesmo registro, do checklist offline à fatura paga.

- Checklist de entrada, saída e inspeção, com parecer Apto, Ressalvas ou Inapto
- Foto com carimbo de hora, data, GPS e placa, com detecção de foto repetida
- Orçamento aprovado item a item e catálogo padronizado de peças e mão de obra
- Estoque visual, leitura de NF-e por XML, fatura mensal e histórico de cada veículo
- Portais para oficinas, locadoras e frotas, com views prontas para Power BI

Documentação completa em [`Nexum Inspect/README.md`](Nexum%20Inspect/README.md).

### NEXUM Fleet
Frota, telemetria e gestão de passageiros do transporte coletivo, vendido em módulos.

- Frota ao vivo, trajeto por dia, paradas, excesso de velocidade e cercas
- Rotas, horários, embarque por crachá e computador de bordo Android
- Portal do passageiro (PWA) e visão própria para a contratante
- Multi-cliente, com cada empresa enxergando apenas os próprios dados

Documentação completa em [`Nexum Fleet/transporte-sistema/README.md`](Nexum%20Fleet/transporte-sistema/README.md).

## Design System

Todos os sistemas seguem o **NEXUM Design System** (`v1.0.0`): cores, tipografia (Manrope e Inter), ícones Lucide, componentes `nx-*` e regras de acessibilidade. Abra [`Nexum Design System/index.html`](Nexum%20Design%20System/index.html) para ver a vitrine e leia o [README do Design System](Nexum%20Design%20System/README.md).

| Cor | Hex | Uso |
|---|---|---|
| Azul-marinho | `#142B45` | Base da marca |
| Verde-petróleo | `#147D92` | Ações |
| Turquesa | `#35B7A4` | Somente sobre fundo escuro |
| Azul-profundo | `#203056` | Apoio |
| Cinza-claro | `#F3F8F8` | Fundos |

## Página comercial

A página `index.html` é estática: HTML, CSS e JavaScript em um único arquivo, sem build e sem dependências externas. Basta abrir no navegador.

**Antes de publicar, configure os canais de contato.** No fim do `index.html`, no bloco `<script>`, edite:

```js
var CONTATO_EMAIL = "contato@nexumsystems.com.br";  // troque pelo e-mail real
var CONTATO_WHATSAPP = "";                          // ex.: 5594999999999 (vazio oculta o botão)
```

O formulário abre o aplicativo de e-mail do visitante com a mensagem pronta. Para receber os contatos direto no site, é preciso ligá-lo a um backend ou a um serviço de formulário.

Para publicar, suba `index.html` e a pasta `site/` juntas em qualquer hospedagem estática.

## Tecnologias

| | Inspect | Fleet |
|---|---|---|
| Backend | Node 22, TypeScript, Fastify, PostgreSQL 16 | Node 22, TypeScript, Fastify, PostgreSQL 16 |
| Web | React 19, Vite, PWA offline-first | React, PWA |
| Mobile | Android via Capacitor 8 | Android via Capacitor 8 (computador de bordo) |
| Deploy | Docker e GitHub Actions | Docker e GitHub Actions |

## Convenções do projeto

- Mensagens de commit em português, no formato `tipo: descrição` (por exemplo, `feat:`, `fix:`, `docs:`)
- Interface sem emojis: ícones sempre em SVG (Lucide), conforme o Design System
- Estados da interface comunicados por cor, ícone e palavra, nunca só por cor

---

<div align="center">

**NEXUM Systems** · Feito com o NEXUM Design System

</div>
