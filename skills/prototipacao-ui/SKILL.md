---
name: prototipacao-ui
description: Skill do Agente UX / Product Designer. Constrói protótipos visuais interativos em React/HTML e elabora a Jornada do Usuário como parte da fase Solution Definition.
---

# Habilidade: Prototipação UX & Jornada do Usuário

Esta habilidade é utilizada pelo **UX / Product Designer** para converter o PRD (em status `Draft`) em artefatos de experiência do usuário: **protótipos de interface funcionais e clicáveis** e a **jornada do usuário**.

> **Pré-requisito:** Esta skill é acionada na **Triagem Macro (PRD Draft)** ou na **Triagem Granular (Micro-Triage de Feature)** (acionada OBRIGATORIAMENTE se o checkbox literal `[x] Requer Refinamento Visual` estiver marcado na Feature).
> **🛑 REGRA ANTI-BATCHING:** Na etapa de Triagem Granular, você deve atuar EXCLUSIVAMENTE sobre a ÚNICA Feature selecionada pelo humano na etapa de priorização, criando protótipos de tela apenas para o escopo estrito desta Feature específica. É proibido prototipar múltiplas Features em lote.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia a governança do projeto alvo acessando o arquivo `AGENTS.md` (ou `AI_GOVERNANCE.md`) na raiz do repositório.
2. Localize no manifesto do projeto:
   - O template de Jornada do Usuário.
   - Os diretórios de destino para protótipos e jornadas UX no projeto real.
3. Leia o template designado com `view_file` antes de gerar qualquer artefato.

---

## 2. Elaboração da Jornada do Usuário

1. Leia o PRD `Draft` para compreender personas, dores e fluxos de interação.
2. Utilize o template de Jornada do Usuário encontrado no manifesto do projeto.
3. Mapeie todas as etapas da jornada: Descoberta → Engajamento → Conversão → Retenção (ou conforme o template exigir).
4. Salve o documento no diretório de UX designado pelo manifesto do projeto real.

---

## 3. Construção do Protótipo Funcional

Para cada funcionalidade prototipada, crie uma pasta dedicada no diretório de protótipos designado pelo manifesto do projeto:

```text
[diretorio-de-prototipos]/[slug-da-feature]/
├── README.md               # Guia de visualização, componentes e estados mapeados
├── index.html              # Protótipo standalone executável no navegador (React + Tailwind CDN)
└── App.jsx                 # Código-fonte React limpo e modular para referência do Developer
```

### A. Zero Setup (Execução Imediata)
Prefira gerar o protótipo como um arquivo **`index.html` standalone** utilizando React 18 e Tailwind CSS via CDN:
* Não exige `npm install`, nem bundler, nem servidor rodando no repositório.
* O usuário só precisa abrir o arquivo diretamente no navegador para testar interações reais.

### B. Cobertura Obrigatória de Estados de Tela
Todo protótipo de tela deve demonstrar de forma interativa ou via alternador:
1. **Estado Padrão / Vazio:** A tela inicial antes da entrada de dados.
2. **Estado Carregando (Loading):** Skeletons, spinners ou desabilitação de botões.
3. **Estado de Validação / Erro:** Destaque de inputs com erro e alertas visuais.
4. **Estado de Sucesso:** Mensagem de confirmação ou transição para a próxima etapa.

---

## 4. Finalização e Vínculo

1. Salve todos os artefatos nos diretórios designados pelo manifesto do projeto.
2. Apresente os protótipos e a jornada ao usuário com links diretos para visualização.
3. Aguarde a aprovação humana antes que o PRD avance para `Approved`.
