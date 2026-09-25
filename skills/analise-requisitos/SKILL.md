---
name: analise-requisitos
description: Conduz o processo de elicitação profunda de requisitos com perguntas investigativas exaustivas e gera o PRD estruturado com Frontmatter YAML e regras de negócio.
---

# Habilidade: Análise de Requisitos e Redação de PRD

Esta habilidade é utilizada para extrair, esclarecer e documentar detalhadamente uma nova demanda do usuário, garantindo que nenhuma ambiguidade chegue às etapas seguintes.

---

## 1. Guia de Investigação Exaustiva

Ao ser invocado com uma nova solicitação:

### Rodada 1: Dúvidas Estruturais (Obrigatória)
Faça perguntas sobre:
1. **Problema e Impacto**: Qual é a dor ou gargalo atual? Como o usuário resolve isso hoje?
2. **Personas e Atores**: Quem utilizará a funcionalidade (administrador, cliente anônimo, operador interno)?
3. **Fronteiras de Escopo**: Quais recursos são essenciais para o MVP (In-Scope) e quais ficam explicitamente de fora (Não-Objetivos)?

### Rodada 2: Regras e Limites Técnicos
Após as primeiras respostas do usuário, explore:
1. **Fluxos de Erro**: O que deve acontecer quando um dado for incorreto, uma API falhar ou a conexão cair?
2. **Volumetria e Desempenho**: Quantos registros são esperados? Há requisitos estritos de tempo de resposta?
3. **Casos de Borda**: O que ocorre com dados duplicados, cancelamentos no meio do fluxo ou concorrência?

---

## 2. Geração e Promoção do PRD

1. Crie o arquivo utilizando a base em `./docs/templates/PRD-template.md`.
2. Salve em `./docs/product/prd-<nome-da-feature>.md` (ou `./docs/prds/PRD-v0.1-<nome-da-feature>.md` para compatibilidade).
3. No cabeçalho Frontmatter YAML, defina `version: "0.1.0"` e `status: "Draft"`.
4. Caso o usuário solicite alterações durante a revisão, atualize o histórico de versões e incremente a versão no frontmatter (`0.2.0`, `0.3.0`).
5. Quando o usuário declarar estar 100% satisfeito com o documento:
   - Altere o Frontmatter para `version: "1.0.0"` e `status: "Approved"`.
   - Atualize a data de `last_updated`.
6. Notifique que a fase de requisitos foi concluída com sucesso e que a demanda está pronta para o Product Owner.
