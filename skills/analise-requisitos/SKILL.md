---
name: analise-requisitos
description: Skill do Agente Analista de Requisitos. Conduz a elicitação profunda com perguntas investigativas exaustivas e gera o PRD com Triagem de Impacto preenchida, em status Draft.
---

# Habilidade: Análise de Requisitos e Redação de PRD

Esta habilidade é utilizada para extrair, esclarecer e documentar detalhadamente uma nova demanda do usuário, garantindo que nenhuma ambiguidade chegue às etapas seguintes.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia a governança do projeto alvo acessando o arquivo `AGENTS.md` (ou `AI_GOVERNANCE.md`) na raiz do repositório.
2. Localize no manifesto do projeto qual é o template correspondente a Requisitos (ex: PRD) e o seu diretório de destino.
3. Leia o template designado pelo projeto antes de iniciar a redação.

---

## 2. Guia de Investigação Exaustiva

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

## 3. Geração do PRD com Macro-Triagem

1. Preencha o documento de requisitos seguindo rigorosamente a estrutura do template fornecido pelo projeto.
2. **OBRIGATÓRIO — Triagem de Impacto Macro (Macro-Triage):** Ao final do documento, preencha a avaliação de impacto macro (ou adicione-a se o template não a tiver, se adaptando ao formato). Estes indicam se a demanda como um todo requer:
   - **Impacto em UX** (Jornada Macro).
   - **Impacto em Arquitetura** (ADR sistêmico).
3. Salve o arquivo no caminho ditado pelo manifesto do projeto, usando a convenção de nomenclatura estipulada lá.
4. Aplique o status inicial de revisão (ex: `Draft`) conforme estipulado nas regras daquele manifesto.
5. Caso o usuário solicite alterações durante a revisão, atualize o documento de acordo com a política de versionamento do projeto.

---

## 4. Promoção do Documento de Requisitos

> **ATENÇÃO:** O AR **NÃO** encerra o processo de requisitos diretamente. O fluxo é:
> - O AR submete o documento inicial com a Macro-Triage preenchida.
> - O Orquestrador lê a Macro-Triage e aciona os agentes de Solution Definition (UX Designer e/ou Tech Lead) se necessário.
> - Somente após a aprovação humana no **Gate 0.5 (Solution Definition Approval)**, o documento de Requisitos avança de estágio.

Quando o usuário declarar estar 100% satisfeito com o conteúdo textual:
1. Notifique que a especificação base está pronta para a fase de Solution Definition e aprovação no Gate 0.5.
