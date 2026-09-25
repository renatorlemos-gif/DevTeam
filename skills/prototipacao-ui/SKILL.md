---
name: prototipacao-ui
description: Constrói protótipos visuais interativos em React e Tailwind dentro de docs/prototypes/<slug>/, servindo como especificação executável (living spec) para validação com o usuário e handoff para outros times.
---

# Habilidade: Prototipação Rápida de Interface (React UI)

Esta habilidade é utilizada para converter especificações funcionais e critérios de aceitação em **protótipos de interface funcionais e clicáveis**, eliminando qualquer ambiguidade de layout, estados de componentes ou fluxos de UX antes do desenvolvimento final.

---

## 1. Quando Acionar Esta Habilidade
- A História de Usuário (`docs/specs/us-*.md`) envolver telas, formulários, tabelas, modais ou navegação web/mobile.
- O projeto estiver no modo **Docs-as-Code Exclusivo** e precisar fornecer especificações visuais inequívocas para outro time agêntico ou humano.
- O usuário solicitar uma validação visual rápida de um fluxo antes de aprovar os requisitos.

---

## 2. Estrutura do Protótipo em `docs/prototypes/`

Para cada funcionalidade prototipada, crie uma pasta dedicada:

```text
docs/prototypes/[slug-da-feature]/
├── README.md               # Guia de visualização, componentes e estados mapeados
├── index.html              # Protótipo standalone executável no navegador (React + Tailwind CDN)
└── App.jsx                 # Código-fonte React limpo e modular para referência do time dev
```

---

## 3. Padrão de Construção do Protótipo

### A. Zero Setup (Execução Imediata)
Prefira gerar o protótipo como um arquivo **`index.html` standalone** utilizando React 18 e Tailwind CSS via CDN:
* Não exige `npm install`, nem bundler, nem servidor rodando no repositório.
* O usuário ou o outro time agêntico só precisa abrir o arquivo diretamente no navegador para testar interações reais (cliques, tabs, validações de formulário, abertura de modais).

### B. Cobertura Obrigatória de Estados de Tela
Todo protótipo de tela deve demonstrar de forma interativa ou via alternador:
1. **Estado Padrão / Vazio:** A tela inicial antes da entrada de dados (com empty state/placeholder visual).
2. **Estado Carregando (Loading):** Skeletons, spinners ou desabilitação de botões de submit.
3. **Estado de Validação / Erro:** Destaque de inputs com erro e alertas visuais de falha.
4. **Estado de Sucesso:** Mensagem de confirmação ou transição para a próxima etapa.

---

## 4. Finalização e Vínculo com a Especificação

1. Salve os arquivos em `./docs/prototypes/<slug-da-feature>/`.
2. Abra a história em `./docs/specs/us-<slug-da-feature>.md` e preencha a seção **3.1. Protótipo Interativo & Telas** com o caminho relativo.
3. Apresente o protótipo ao usuário com o link direto para visualização.
