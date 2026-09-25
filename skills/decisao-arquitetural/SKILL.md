---
name: decisao-arquitetural
description: Registra Decisões de Arquitetura de Software (ADR) avaliando alternativas, prós, contras e trade-offs técnicos.
---

# Habilidade: Registro de Decisão Arquitetural (ADR)

Esta habilidade é utilizada para documentar escolhas técnicas de alto impacto (adoção de novos bancos, frameworks, padrões de design ou mudanças em contratos de dados), prevenindo decisões não registradas no projeto.

---

## 1. Quando Disparar Esta Habilidade
- Escolha entre duas ou mais bibliotecas / frameworks (ex: FastAPI vs Django, Pydantic vs Marshmallow).
- Escolha de motor de persistência / storage (ex: PostgreSQL vs MongoDB, Redis vs Memcached).
- Mudanças estruturais na organização de pastas ou comunicação entre serviços.
- Definição de estratégias de autenticação, migração ou particionamento.

---

## 2. Procedimento de Registro

1. Localize os ADRs existentes em `./docs/architecture/` para identificar o próximo número sequencial (ex: `001`, `002`).
2. Utilize o template mestre em `./docs/templates/ADR-template.md`.
3. Preencha detalhadamente:
   - **Contexto & Problema**: A dor ou necessidade técnica que motivou a decisão.
   - **Decisão**: A solução escolhida de forma explícita.
   - **Matriz de Alternativas**: Tabela comparativa avaliando ao menos 2 opções com Prós, Contras e Motivo do Descarte da opção não selecionada.
   - **Consequências & Impactos**: Trade-offs aceitos e impacto em schemas/tabelas/APIs.
4. Salve o documento em `./docs/architecture/adr-[num3d]-[slug-da-decisao].md`.
5. Apresente a decisão ao usuário para homologação (`status: Accepted`).
