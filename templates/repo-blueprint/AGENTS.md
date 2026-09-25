# AGENTS.md - [Nome do Projeto / Serviço]

Guia mestre de instruções operacionais, arquitetura, padrões de código, governança de documentação e fluxos de trabalho para agentes de IA atuando neste repositório.

---

## 1. Visão Geral & Contexto do Projeto

- **Nome do Projeto/Serviço:** [Nome do Projeto / Serviço]
- **Propósito:** [Resumo em 1-2 frases do objetivo principal do sistema e o valor entregue]
- **Modo de Atuação do DevTeam:** [Docs-as-Code Exclusivo (Apenas ./docs/) | Ciclo Completo (docs/ + src/ + tests/)]
- **Rastreabilidade de Demandas:**
  - **Issue Tracker:** [Jira / GitHub Issues / Linear - Projeto / Prefixo de Chave]
  - **Documentação de Negócio:** [Confluence / Notion / Wiki - URL ou Espaço]
- **Pontos Focais / Responsáveis:**
  - **Product Owner:** [Nome do PO / PM]
  - **Tech Lead / Engenharia:** [Nome do Tech Lead]
  - **QA / Qualidade:** [Nome do QA / Dev]

---

## 2. Estrutura Docs-as-Code & Roteamento de Conhecimento

Antes de planejar, codificar ou criar arquivos, consulte a documentação modular na pasta `docs/`:

- **Visão de Produto & PRDs:** Salve e consulte especificações em `docs/product/prd-[feature].md`.
- **Histórias de Usuário & Especificações de Bugs:** Salve e leia em `docs/specs/us-[slug].md` ou `docs/specs/bug-[slug].md`.
- **Decisões Arquiteturais (ADRs):** Consulte e registre escolhas técnicas em `docs/architecture/adr-[num]-[slug].md`.
- **Protótipos Interativos & UI (React):** Salve e inspecione protótipos visuais de interface em `docs/prototypes/[feature]/`.
- **Convenções de Nomenclatura:** Todos os arquivos em `docs/` devem usar `kebab-case` estrito, sem sufixos de versão no nome do arquivo (versões são controladas via Git e Frontmatter YAML).

---

## 3. Tech Stack & Ferramental

- **Linguagem Principal:** [ex: Python 3.11+, TypeScript, Go]
- **Frameworks Principais:** [ex: FastAPI, Pydantic, React, Next.js]
- **Bancos de Dados & Storage:** [ex: PostgreSQL 16, MySQL 8, Redis, SQLite]
- **Linters, Formatters & Tipagem:** [ex: ruff check, black, mypy, eslint]
- **Testes Automatizados:** [ex: pytest, jest]
- **Gerenciador de Pacotes:** [ex: uv, poetry, pnpm, npm]

---

## 4. Comandos Essenciais de Desenvolvimento

Todos os comandos abaixo devem ser executados e validados pelo agente antes de submeter alterações:

```bash
# Sincronização do ambiente e dependências
[comando, ex: uv sync | poetry install | npm install]

# Linting e Formatação
[comando, ex: ruff check . --fix && black . | npm run lint]

# Checagem Estática de Tipos
[comando, ex: mypy src/ | npm run type-check]

# Execução da Suíte de Testes
[comando, ex: pytest -v | npm test]
[comando, ex: pytest --cov=src/ tests/ | npm run test:coverage]
```

---

## 5. Diretrizes Inegociáveis para Agentes

1. **Blindagem de Escopo (Modo Docs-as-Code Exclusivo):** Se o repositório estiver configurado no modo *Docs-as-Code Exclusivo*, o agente está terminantemente **PROIBIDO de criar ou alterar qualquer arquivo fora de `./docs/`**.
2. **Desenvolvimento Orientado a Especificação (Modo Ciclo Completo):** Nunca inicie código de produção sem antes validar os critérios de aceitação em `docs/specs/`.
3. **Ciclo TDD:** Para novas funcionalidades e resolução de bugs, assegure que testes automatizados reflitam fielmente os cenários de sucesso e exceção.
4. **Respeito a Contratos e Restrições:** Respeite rigorosamente a seção "O que NÃO fazer" contida nas especificações de tarefa.
