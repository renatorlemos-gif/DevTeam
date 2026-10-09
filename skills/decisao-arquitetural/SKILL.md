---
name: decisao-arquitetural
description: Skill do Agente Tech Lead / Architect. Registra Decisões de Arquitetura de Software (ADR) avaliando alternativas, prós, contras e trade-offs técnicos, como parte da fase Solution Definition.
---

# Habilidade: Registro de Decisão Arquitetural (ADR)

Esta habilidade é utilizada pelo **Tech Lead / Architect** para documentar escolhas técnicas de alto impacto (adoção de novos bancos, frameworks, padrões de design ou mudanças em contratos de dados), prevenindo decisões não registradas no projeto.

> **Pré-requisito:** Esta skill é acionada na **Triagem Macro (PRD Draft)** ou na **Triagem Granular (Micro-Triage de Feature)** (acionada OBRIGATORIAMENTE se o checkbox literal `[x] Requer Decisão Técnica Pontual` estiver marcado na Feature).
> **🛑 REGRA ANTI-BATCHING:** Na etapa de Triagem Granular, você deve atuar EXCLUSIVAMENTE sobre a ÚNICA Feature selecionada na etapa de priorização, criando contratos de API e modelos de dados apenas para o escopo estrito desta Feature específica. É proibido detalhar múltiplas Features em lote.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia a governança do projeto alvo acessando o arquivo `AGENTS.md` (ou `AI_GOVERNANCE.md`) na raiz do repositório.
2. Localize no manifesto do projeto onde está o template de ADR (Decisão Arquitetural) e o diretório de destino.
3. Leia o template designado com `view_file` antes de gerar qualquer artefato.

---

## 2. Quando Disparar Esta Habilidade
- Escolha entre duas ou mais bibliotecas / frameworks (ex: FastAPI vs Django, Pydantic vs Marshmallow).
- Escolha de motor de persistência / storage (ex: PostgreSQL vs MongoDB, Redis vs Memcached).
- Mudanças estruturais na organização de pastas ou comunicação entre serviços.
- Definição de estratégias de autenticação, migração ou particionamento.

---

## 3. Procedimento de Registro
1. Leia o PRD `Draft` para compreender os requisitos técnicos e restrições.
2. Localize os ADRs existentes no diretório alvo para identificar o próximo número sequencial (ex: `001`, `002`).
3. Preencha detalhadamente:
   - **Contexto & Problema**: A dor ou necessidade técnica que motivou a decisão.
   - **Decisão**: A solução escolhida de forma explícita.
   - **Matriz de Alternativas**: Tabela comparativa avaliando ao menos 2 opções com Prós, Contras e Motivo do Descarte da opção não selecionada.
   - **Consequências & Impactos**: Trade-offs aceitos e impacto em schemas/tabelas/APIs.
4. Salve o documento no diretório designado pelo manifesto do projeto.
5. Apresente a decisão ao usuário para homologação (`status: Accepted`).
