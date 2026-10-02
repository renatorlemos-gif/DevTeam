---
name: analise-requisitos
description: Skill do Agente Analista de Requisitos. Conduz a elicitação profunda com perguntas investigativas exaustivas e gera o PRD com Triagem de Impacto preenchida, em status Draft.
---

# Habilidade: Análise de Requisitos e Redação de PRD

Esta habilidade é utilizada para extrair, esclarecer e documentar detalhadamente uma nova demanda do usuário, garantindo que nenhuma ambiguidade chegue às etapas seguintes.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia o arquivo `.cache\standards\AGENT_BOOTSTRAP.md` com a ferramenta `view_file`.
2. Localize no mapa de recursos o template `PRD.md` (em `templates/product/`) e o diretório de destino.
3. Leia o template com `view_file` antes de iniciar a redação.

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

1. Preencha o PRD seguindo rigorosamente a estrutura do template lido no Bootstrap.
2. **OBRIGATÓRIO — Triagem de Impacto Macro (Macro-Triage):** Ao final do PRD, preencha os checkboxes de avaliação de impacto macro. Estes checkboxes determinam se a demanda como um todo requer:
   - **Impacto em UX** (Jornada Macro).
   - **Impacto em Arquitetura** (ADR sistêmico).
3. Salve o arquivo no caminho ditado pelo standard, usando estritamente kebab-case sem sufixos de versão no nome.
4. No cabeçalho Frontmatter YAML, defina `version: "0.1.0"` e `status: "Draft"`.
5. Caso o usuário solicite alterações durante a revisão, atualize o histórico de versões e incremente a versão no frontmatter (`0.2.0`, `0.3.0`).

---

## 4. Promoção do PRD

> **ATENÇÃO:** O AR **NÃO** promove o PRD para `Approved` diretamente. O fluxo agora é:
> - O AR salva como `Draft` com a Macro-Triage preenchida.
> - O Orquestrador lê a Macro-Triage e aciona os agentes de Solution Definition (UX Designer e/ou Tech Lead) se necessário.
> - Somente após a aprovação humana no **Gate 0.5 (Solution Definition Approval)**, o PRD é promovido para `Approved`.

Quando o usuário declarar estar 100% satisfeito com o conteúdo textual do PRD:
1. Mantenha o status como `Draft`.
2. Atualize `version: "1.0.0"` e a data de `last_updated`.
3. Notifique que o PRD está pronto para a fase de Solution Definition e aprovação no Gate 0.5.
