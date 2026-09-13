---
name: analise-requisitos
description: Conduz o processo de elicitação profunda de requisitos com perguntas investigativas exaustivas e gera o PRD versionado de acordo com os padrões da equipe.
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
3. **Fronteiras de Escopo**: Quais recursos são essenciais para o MVP e quais podem ser postergados para versões futuras?

### Rodada 2: Regras e Limites Técnicos
Após as primeiras respostas do usuário, explore:
1. **Fluxos de Erro**: O que deve acontecer quando um dado for incorreto, uma API falhar ou a conexão cair?
2. **Volumetria e Desempenho**: Quantos registros são esperados? Há requisitos estritos de tempo de resposta?
3. **Casos de Borda**: O que ocorre com dados duplicados, cancelamentos no meio do fluxo ou concorrência?

---

## 2. Geração e Promoção do PRD

1. Crie o arquivo utilizando a base em `./docs/templates/PRD-template.md`.
2. Salve como `./docs/prds/PRD-v0.1-<nome-da-feature>.md`.
3. Caso o usuário solicite alterações durante a revisão, atualize o histórico de versões e salve como `v0.2`, `v0.3`, etc.
4. Quando o usuário declarar estar 100% satisfeito com o documento, gere a versão final:
   - Caminho: `./docs/prds/PRD-v1.0-<nome-da-feature>.md`
   - Status no cabeçalho: `Aprovado`
5. Notifique que a fase de requisitos foi concluída com sucesso e que a demanda está pronta para o Product Owner.
