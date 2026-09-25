---
name: refinamento-po
description: Transforma o PRD v1.0 aprovado em Histórias de Usuário ágeis com critérios de aceitação BDD/Gherkin e solicita a aprovação do usuário.
---

# Habilidade: Refinamento de Histórias e Critérios BDD

Esta habilidade é utilizada pelo **Product Owner** para decompor a especificação funcional do PRD em incrementos entregáveis de valor (Histórias de Usuário).

---

## 1. Verificação de Entrada
1. Localize o PRD da funcionalidade em `./docs/prds/PRD-v1.0-<nome-da-feature>.md`.
2. Se o arquivo não existir ou se a versão for inferior a `v1.0`, interrompa e solicite a conclusão da fase de análise.

---

## 2. Elaboração das Histórias de Usuário

1. Utilize o template em `./docs/templates/STORY-template.md`.
2. Decomponha cada Requisito Funcional (RF) do PRD em uma ou mais Histórias de Usuário (`US-01`, `US-02`, etc.).
3. Formule a narrativa ágil:
   - **Como** [persona do PRD],
   - **Quero** [ação que a persona deseja realizar],
   - **Para que** [benefício mensurável].
4. Para cada história, escreva critérios de aceitação inequívocos no formato Gherkin:
   ```gherkin
   Cenário: [Comportamento esperado em caso de sucesso]
   Dado que [estado inicial conhecido]
   Quando [evento ou comando é disparado]
   Então [resultado verificável deve ocorrer]

   Cenário: [Comportamento esperado em caso de validação/erro]
   Dado que [estado inicial com dados inválidos]
   Quando [o usuário tenta submeter os dados]
   Então [o sistema deve bloquear e exibir mensagem específica]
   ```
5. Priorize as histórias utilizando o método MoSCoW (Must have, Should have, Could have, Won't have).
6. Salve o resultado em `./docs/stories/STORY-<nome-da-feature>.md`.

---

## 3. Portão de Aprovação
Apresente a lista de histórias e critérios ao usuário no chat e aguarde a resposta:
> *"Histórias de Usuário geradas em `./docs/stories/STORY-<nome-da-feature>.md`. Você aprova este escopo para implementação pelo Developer?"*
