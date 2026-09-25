---
name: refinamento-po
description: Transforma o PRD v1.0 aprovado em Histórias de Usuário ágeis com critérios BDD/Gherkin, contratos opcionais, restrições e diretrizes de teste, solicitando a aprovação do usuário.
---

# Habilidade: Refinamento de Histórias e Critérios BDD

Esta habilidade é utilizada pelo **Product Owner** para decompor a especificação funcional do PRD em incrementos entregáveis de valor (Histórias de Usuário), blindando o time de desenvolvimento contra ambiguidades.

---

## 1. Verificação de Entrada
1. Localize o PRD da funcionalidade em `./docs/product/prd-<nome-da-feature>.md` (ou `./docs/prds/PRD-v1.0-<nome-da-feature>.md`).
2. Se o arquivo não existir ou se o status no cabeçalho não for `Approved` (ou versão menor que `1.0.0`), interrompa e solicite a conclusão da fase de análise.

---

## 2. Elaboração das Histórias de Usuário

1. Utilize o template mestre em `./docs/templates/STORY-template.md`.
2. Decomponha cada Requisito Funcional (RF) do PRD em Histórias de Usuário (`US-01`, `US-02`).
3. Para cada história, formule obrigatoriamente:
   - **Narrativa Ágil**: Como [persona] / Quero [ação] / Para que [benefício].
   - **Regras de Negócio**: Validações, tratamentos nulos e integridade.
   - **Contratos & Schemas JSON**: Exemplos de payload de requisição/resposta ou schemas de dados envolvidos (quando aplicável).
   - **Critérios de Aceitação BDD (Gherkin)**: Cenários de sucesso (`Dado / Quando / Então`), validação de dados inválidos e exceções/resiliência.
   - **Diretrizes de Testes Automatizados**: Apontar o arquivo de teste alvo (`tests/test_...py`) e comando de execução (`pytest ... -v`).
   - **Restrições Claras ("O que NÃO fazer")**: Proibições técnicas explícitas (ex: proibir mocks em prod, proibir hardcoding, exigir transação atômica).
4. Salve o documento em `./docs/specs/us-<nome-da-feature>.md` (ou `./docs/stories/STORY-<nome-da-feature>.md`).

---

## 3. Portão de Aprovação
Apresente a lista de histórias, contratos e restrições ao usuário no chat e aguarde a confirmação explícita:
> *"Histórias de Usuário geradas em `./docs/specs/us-<nome-da-feature>.md`. Você aprova este escopo para implementação pelo Developer?"*
