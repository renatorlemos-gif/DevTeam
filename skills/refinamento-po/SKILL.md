---
name: refinamento-po
description: Skill do Agente Product Owner. Transforma o PRD Approved + artefatos de Solution Definition em Feature Definitions e, subsequentemente, em Histórias de Usuário ágeis com critérios BDD/Gherkin, contratos, restrições e diretrizes de teste.
---

# Habilidade: Refinamento de Histórias e Critérios BDD

Esta habilidade é utilizada pelo **Product Owner** para decompor a especificação funcional do PRD em incrementos entregáveis de valor (Histórias de Usuário), blindando o time de desenvolvimento contra ambiguidades.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia o arquivo `.cache\standards\AGENT_BOOTSTRAP.md` com a ferramenta `view_file`.
2. Localize no mapa de recursos o template `USER-STORY.md` e `ACCEPTANCE-CRITERIA.md` (em `templates/product/`) e o diretório de destino.
3. Leia os templates com `view_file` antes de iniciar a redação.

---

## 2. Verificação de Entrada
1. Localize o PRD da funcionalidade. Se o status não for `Approved`, **interrompa e solicite que o Orquestrador conclua a fase de Solution Definition primeiro**.
2. **Leitura Obrigatória de Artefatos de Solution Definition:** O PRD Aprovado E os artefatos macro gerados na etapa de Solution Definition (ADRs sistêmicos e User Journeys gerais) são insumos obrigatórios para a etapa de Feature Definition. O PO e os agentes devem consumi-los antes de definir as Features:
   - **ADR(s)** gerados pelo Tech Lead (se a Triagem indicou impacto em Arquitetura) — para incorporar restrições técnicas e contratos de API/dados.
   - **Protótipos e Jornada UX** gerados pelo UX Designer (se a Triagem indicou impacto em UX) — para referenciar telas, estados e fluxos nas histórias.

---

## 3. Elaboração de Features e Histórias de Usuário

O Product Owner NÃO deve ir direto para a criação de US. Ele deve:
1. **Consumir** o PRD e os artefatos macro (Solution Definition).
2. **Redigir as Feature Definitions** (FEAT-XXX), declarando escopo, prioridade e listando as US previstas.
3. **Submeter cada Feature à triagem granular** (Micro-Triage) do Tech Lead (para contratos de API específicos) e UX Designer (para protótipos de tela específicos daquela Feature).
4. **Somente após a Feature ser aprovada**, ele deve desdobrar as User Stories e os Critérios de Aceitação BDD, garantindo rastreabilidade com a Feature.

Para cada história desdobrada da Feature aprovada, formule obrigatoriamente:
   - **Narrativa Ágil**: Como [persona] / Quero [ação] / Para que [benefício].
   - **Regras de Negócio**: Validações, tratamentos nulos e integridade.
   - **Contratos & Schemas JSON**: Exemplos de payload de requisição/resposta ou schemas de dados envolvidos (quando aplicável — extrair do ADR do Tech Lead).
   - **Referências Visuais**: Se existirem protótipos do UX Designer, referenciar os caminhos dos arquivos de protótipo e listar os estados de tela que o Developer deve implementar.
   - **Critérios de Aceitação BDD (Gherkin)**: Cenários de sucesso (`Dado / Quando / Então`), validação de dados inválidos e exceções/resiliência.
   - **Diretrizes de Testes Automatizados**: Apontar o arquivo de teste alvo e comando de execução.
   - **Restrições Claras ("O que NÃO fazer")**: Proibições técnicas explícitas (ex: proibir mocks em prod, proibir hardcoding, exigir transação atômica).
5. Salve o documento no diretório designado pelo standard.

---

## 4. Portão de Aprovação
Apresente a lista de histórias, contratos e restrições ao usuário no chat e aguarde a confirmação explícita:
> *"Histórias de Usuário geradas e salvas. Você aprova este escopo para implementação pelo Developer?"*
