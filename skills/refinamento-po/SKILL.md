---
name: refinamento-po
description: Skill do Agente Product Owner. Transforma o PRD Approved + artefatos de Solution Definition em Feature Definitions e, subsequentemente, em Histórias de Usuário ágeis com critérios BDD/Gherkin, contratos, restrições e diretrizes de teste.
---

# Habilidade: Refinamento de Histórias e Critérios BDD

Esta habilidade é utilizada pelo **Product Owner** para decompor a especificação funcional do PRD em incrementos entregáveis de valor (Histórias de Usuário), blindando o time de desenvolvimento contra ambiguidades.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia a governança do projeto alvo acessando o arquivo `AGENTS.md` (ou `AI_GOVERNANCE.md`) na raiz do repositório.
2. Localize no manifesto do projeto onde estão os templates de Funcionalidades (Features) e Histórias de Usuário, bem como seus diretórios de destino.
3. Leia os templates designados com `view_file` antes de iniciar a redação.

---

## 2. Verificação de Entrada
1. Localize o PRD da funcionalidade. Se o status não for `Approved`, **interrompa e solicite que o Orquestrador conclua a fase de Solution Definition primeiro**.
2. **Leitura Obrigatória de Artefatos de Solution Definition:** O PRD Aprovado E os artefatos macro gerados na etapa de Solution Definition (ADRs sistêmicos e User Journeys gerais) são insumos obrigatórios para a etapa de Feature Definition. O PO e os agentes devem consumi-los antes de definir as Features:
   - **ADR(s)** gerados pelo Tech Lead (se a Triagem indicou impacto em Arquitetura) — para incorporar restrições técnicas e contratos de API/dados.
   - **Protótipos e Jornada UX** gerados pelo UX Designer (se a Triagem indicou impacto em UX) — para referenciar telas, estados e fluxos nas histórias.

---

## 3. Elaboração de Features e Histórias de Usuário (Cadência com STOPS)

O Product Owner NÃO deve ir direto para a criação de US nem atuar em lote. Ele deve:
1. **Consumir** o PRD e os artefatos macro (Solution Definition).
2. **Analisar as Funcionalidades (Features)**: Apresente o escopo macro das Features de forma interativa no chat para o usuário, permitindo a priorização humana. Gere arquivos físicos SOMENTE se o manifesto do projeto exigir explicitamente o registro prévio da Feature.
   * **Avaliação de Impacto:** Ao apresentar o escopo (ou no arquivo, se exigido), o PO DEVE preencher a seção de "Micro-Triagem" indicando explicitamente se haverá necessidade de refinamento de UX (telas) ou Arquitetura (contratos). O Orquestrador precisa dessas marcações como gatilhos!
   * **🛑 PARADA (Gate 1 - Prioritization)**: O Orquestrador pedirá ao humano para escolher **APENAS UMA Feature**.
3. **Aguardar a Triagem Granular e Aprovação**: O PO aguarda enquanto UX e Arquitetura refinam a Feature Única escolhida e o Orquestrador coleta o "OK" humano.
   * **🛑 PARADA (Gate 2 - Feature Approval)**: O Orquestrador pede aprovação humana da Feature.
4. **Desdobrar as User Stories**: SOMENTE após aprovação no Gate 2, o PO desdobra as User Stories (US) e Critérios de Aceitação BDD **exclusivamente daquela Feature**.
   * **🛑 PARADA (Gate 3 - US Approval)**: O Orquestrador pede aprovação humana das User Stories criadas. Somente após isso o Developer será acionado.

Para cada história desdobrada da Feature aprovada, formule obrigatoriamente:
   - **Narrativa Ágil**: Como [persona] / Quero [ação] / Para que [benefício].
   - **Regras de Negócio**: Validações, tratamentos nulos e integridade.
   - **Contratos & Schemas JSON**: Exemplos de payload de requisição/resposta ou schemas de dados envolvidos (quando aplicável — extrair do ADR do Tech Lead).
   - **Referências Visuais**: Se existirem protótipos do UX Designer, referenciar os caminhos dos arquivos de protótipo e listar os estados de tela que o Developer deve implementar.
   - **Critérios de Aceitação BDD (Gherkin)**: Cenários de sucesso (`Dado / Quando / Então`), validação de dados inválidos e exceções/resiliência.
   - **Diretrizes de Testes Automatizados**: Apontar o arquivo de teste alvo e comando de execução.
   - **Restrições Claras ("O que NÃO fazer")**: Proibições técnicas explícitas (ex: proibir mocks em prod, proibir hardcoding, exigir transação atômica).
5. Salve o documento no diretório designado pelo manifesto do projeto.

---

## 4. Portão de Aprovação
Apresente a lista de histórias, contratos e restrições ao usuário no chat e aguarde a confirmação explícita:
> *"Histórias de Usuário geradas e salvas. Você aprova este escopo para implementação pelo Developer?"*
