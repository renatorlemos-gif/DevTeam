---
name: diagnostico-bug
description: Conduz o diagnóstico estruturado de erros e bugs, gerando a especificação do bug com payload, causa raiz e roteiro TDD Red/Green para o Developer.
---

# Habilidade: Diagnóstico Estruturado de Bugs

Esta habilidade é utilizada quando uma falha, exceção ou comportamento anômalo é relatado, garantindo que o time não tente correções às cegas sem teste de regressão.

---

## 1. Coleta e Triagem do Erro
Ao receber um relato de erro:
1. Obtenha do usuário ou dos logs:
   - Comportamento atual observado vs Comportamento esperado.
   - Stacktrace, logs de erro ou código HTTP retornado.
   - Dados de entrada exatos (payload JSON, query params ou parâmetros) que causam a falha.
2. Identifique a severidade (Low, Medium, High, Critical).

---

## 2. Geração da Especificação do Bug
1. Utilize o template mestre em `./docs/templates/BUG-template.md`.
2. Mapeie:
   - Os passos de reprodução passo a passo.
   - O payload JSON isolado causador do erro.
   - O módulo e função provável da causa raiz em `src/`.
   - As diretrizes de teste de regressão em `tests/test_[modulo]_[slug].py`.
   - As restrições da correção (proibição de `try/except: pass` silencioso ou quebra de contratos públicos).
3. Salve o arquivo em `./docs/specs/bug-<slug-do-problema>.md`.

---

## 3. Repasse ao Developer (TDD Red/Green)
1. Notifique o Orquestrador para acionar o Developer com a referência do arquivo gerado:
   > *"Especificação de bug gerada em `./docs/specs/bug-<slug>.md`. Developer, execute o ciclo Red/Green: crie o teste de falha primeiro e aplique a correção mínima necessária."*
