---
name: diagnostico-bug
description: Conduz o diagnóstico estruturado de erros e bugs, gerando a especificação do bug com payload, causa raiz e roteiro TDD Red/Green para o Developer.
---

# Habilidade: Diagnóstico Estruturado de Bugs

Esta habilidade é utilizada quando uma falha, exceção ou comportamento anômalo é relatado, garantindo que o time não tente correções às cegas sem teste de regressão.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia a governança do projeto alvo acessando o arquivo `AGENTS.md` (ou `AI_GOVERNANCE.md`) na raiz do repositório.
2. Localize no manifesto do projeto o template e o diretório de destino de especificações de bug.

---

## 2. Coleta e Triagem do Erro
Ao receber um relato de erro:
1. Obtenha do usuário ou dos logs:
   - Comportamento atual observado vs Comportamento esperado.
   - Stacktrace, logs de erro ou código HTTP retornado.
   - Dados de entrada exatos (payload JSON, query params ou parâmetros) que causam a falha.
2. Identifique a severidade (Low, Medium, High, Critical).

---

## 3. Geração da Especificação do Bug
1. Consulte a governança do projeto para identificar o template canônico de especificação de erro/bug e o diretório de destino.
2. Utilize a ferramenta `view_file` para ler o template correspondente antes da escrita.
3. Mapeie:
   - Os passos de reprodução passo a passo.
   - O payload JSON isolado causador do erro.
   - O módulo e função provável da causa raiz em `src/`.
   - As diretrizes de teste de regressão.
   - As restrições da correção (proibição de `try/except: pass` silencioso ou quebra de contratos públicos).
4. Salve o arquivo no diretório designado pelo manifesto do projeto, usando `bug-<slug-do-problema>.md` ou a convenção imposta pelo projeto.

---

## 4. Repasse ao Developer (TDD Red/Green)
1. Notifique o Orquestrador para acionar o Developer com a referência do arquivo gerado:
   > *"Especificação de bug gerada e estruturada. Developer, consulte a especificação e execute o ciclo Red/Green: crie o teste de falha primeiro e aplique a correção mínima necessária."*
