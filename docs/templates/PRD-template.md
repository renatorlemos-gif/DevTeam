---
id: "prd-[slug-da-feature]"
title: "PRD: [Nome da Funcionalidade / Épico]"
version: "0.1.0"
status: "Draft" # Draft | In Review | Approved
last_updated: "YYYY-MM-DD"
owner: "Analista de Requisitos (DevTeam)"
tags:
  - "prd"
  - "docs-as-code"
  - "[modulo-ou-dominio]"
---

# PRD: [Nome da Funcionalidade / Épico]

## 1. Histórico de Versões

| Versão | Data | Autor | Resumo das Alterações |
| :--- | :--- | :--- | :--- |
| 0.1.0 | YYYY-MM-DD | Analista de Requisitos | Rascunho inicial derivado da primeira rodada de entrevistas investigativas. |
| 0.2.0 | YYYY-MM-DD | Analista de Requisitos | Refinamento de regras de negócio, limites e exceções após feedback. |
| 1.0.0 | YYYY-MM-DD | Analista de Requisitos | Versão final homologada e aprovada para repasse ao Product Owner. |

---

## 2. Visão Geral & Problema

- **Qual é o problema ou necessidade real?**  
  [Descreva detalhadamente a dor do usuário, o contexto e o cenário atual]
- **Qual é a proposta de solução?**  
  [Explicação de alto nível do que será construído e o valor entregue]
- **Público-Alvo / Stakeholders:**  
  [Usuário final, time de operações, squad parceira, etc.]

---

## 3. Objetivos & Não-Objetivos

### 3.1. Objetivos (In-Scope)
- **G1:** [Objetivo mensurável 1]
- **G2:** [Objetivo mensurável 2]

### 3.2. Não-Objetivos (Out-of-Scope)
- ❌ [Item 1 que NÃO será desenvolvido agora para preservar o MVP]
- ❌ [Item 2 que fica explicitamente postergado para versões futuras]

---

## 4. Personas e Fluxo Principal (Caminho Feliz)

* **Persona Principal:** [Ex: Operador Interno, Cliente Final, Administrador]
  - *Contexto:* [Como e onde a persona interage com a solução]

* **Jornada do Usuário:**
  1. O usuário acessa...
  2. O sistema valida e solicita...
  3. O usuário confirma a ação...
  4. O sistema processa atomicamente e exibe confirmação.

---

## 5. Requisitos Funcionais (RF)

| ID | Requisito | Descrição Detalhada & Validações | Prioridade |
| :--- | :--- | :--- | :--- |
| **RF-01** | [Título do RF] | [Regras de negócio, entradas, validações e saídas esperadas] | Alta (Must) |
| **RF-02** | [Título do RF] | [Regras de negócio, entradas, validações e saídas esperadas] | Média (Should) |

---

## 6. Requisitos Não-Funcionais (RNF)

- **RNF-01 (Desempenho):** [Ex: Latência p95 inferior a 300ms, processamento em lote sob 10s]
- **RNF-02 (Segurança & Privacidade):** [Ex: Sanitização de dados sensíveis, autenticação JWT, RBAC]
- **RNF-03 (Compatibilidade / Stack):** [Ex: Python 3.11+, compatibilidade com banco MySQL 8/Postgres 16]

---

## 7. Fluxos de Exceção e Casos de Borda

- **Falha de Integração / Timeout:** [Como o sistema deve se comportar e qual fallback adotar]
- **Dados Inválidos / Duplicados:** [Como alertar o usuário sem quebra de integridade]
- **Interrupção no Meio do Processo:** [Reversão transacional / Rollback completo]

---

## 8. Critérios de Aceite Globais do PRD

- [ ] O usuário consegue concluir o fluxo principal sem inconsistências.
- [ ] Todos os fluxos de exceção mapeados retornam mensagens estruturadas e controladas.
- [ ] O PRD foi formalmente aprovado pelo patrocinador da demanda (Usuário) atingindo a versão `1.0.0` com status `Approved`.
