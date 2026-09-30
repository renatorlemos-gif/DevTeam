---
name: refinamento-po
description: Transforma o PRD v1.0 aprovado em Histórias de Usuário ágeis com critérios BDD/Gherkin, contratos opcionais, restrições e diretrizes de teste, solicitando a aprovação do usuário.
---

# Habilidade: Refinamento de Histórias e Critérios BDD

Esta habilidade é utilizada pelo **Product Owner** para decompor a especificação funcional do PRD em incrementos entregáveis de valor (Histórias de Usuário), blindando o time de desenvolvimento contra ambiguidades.

---

## 1. Verificação de Entrada
1. Consulte o repositório de standards (`.cache/standards`) para identificar a pasta canônica onde os PRDs ficam armazenados.
2. Localize o PRD da funcionalidade. Se o arquivo não existir ou se o status no cabeçalho não for `Approved` (ou versão menor que `1.0.0`), interrompa e solicite a conclusão da fase de análise.

---

## 2. Elaboração das Histórias de Usuário

1. Consulte o repositório de standards (`.cache/standards`) para identificar o template canônico de User Story e o diretório de destino exigido.
2. Utilize a ferramenta `view_file` para ler o template correspondente antes da escrita.
3. Decomponha cada Requisito Funcional (RF) do PRD em Histórias de Usuário (`US-01`, `US-02`).
4. Para cada história, formule obrigatoriamente:
   - **Narrativa Ágil**: Como [persona] / Quero [ação] / Para que [benefício].
   - **Regras de Negócio**: Validações, tratamentos nulos e integridade.
   - **Contratos & Schemas JSON**: Exemplos de payload de requisição/resposta ou schemas de dados envolvidos (quando aplicável).
   - **Critérios de Aceitação BDD (Gherkin)**: Cenários de sucesso (`Dado / Quando / Então`), validação de dados inválidos e exceções/resiliência.
   - **Diretrizes de Testes Automatizados**: Apontar o arquivo de teste alvo (`tests/test_...py`) e comando de execução (`pytest ... -v`).
   - **Restrições Claras ("O que NÃO fazer")**: Proibições técnicas explícitas (ex: proibir mocks em prod, proibir hardcoding, exigir transação atômica).
5. Salve o documento no diretório designado pelo standard. Use estritamente kebab-case sem sufixos de versão no nome.

---

## 3. Portão de Aprovação
Apresente a lista de histórias, contratos e restrições ao usuário no chat e aguarde a confirmação explícita:
> *"Histórias de Usuário geradas e salvas. Você aprova este escopo para implementação pelo Developer?"*
