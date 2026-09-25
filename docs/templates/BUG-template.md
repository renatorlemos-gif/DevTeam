---
id: "bug-[slug-do-problema]"
title: "BUG: [Resumo Claro do Erro]"
status: "Open" # Open | In Progress | In Review | Resolved
severity: "Medium" # Low | Medium | High | Critical
last_updated: "YYYY-MM-DD"
owner: "[Developer / QA (DevTeam)]"
tags:
  - "bug"
  - "tdd"
  - "docs-as-code"
---

# BUG: [Resumo Claro do Erro]

## 1. Descrição do Problema

- **Comportamento Atual:** [O que está acontecendo de errado, mensagem de erro ou código HTTP]
- **Comportamento Esperado:** [O que deveria acontecer no fluxo correto]
- **Impacto:** [Qual funcionalidade, integridade de dados ou persona está sendo afetada]

---

## 2. Passos para Reprodução & Dados de Entrada

1. Disparar a ação com os parâmetros abaixo.
2. Executar a chamada ao serviço.
3. Observar a falha ou exceção gerada.

### Payload / Entrada que Causa o Erro:
```json
{
  "campo_exemplo": "valor_que_causa_o_erro"
}
```

---

## 3. Causa Raiz Provável & Arquivos Envolvidos

- **Arquivo / Módulo:** `src/[caminho/do/modulo].py`
- **Função / Método:** `nome_da_funcao()`
- **Hipótese Diagnóstica:** [Ex: Falta de validação contra valores None ou erro de tipagem no casting]

---

## 4. Critérios de Aceite da Correção

- [ ] **Correção Efetiva:**
  - **Dado que** a mesma condição causadora do erro seja disparada;
  - **Quando** a operação for executada;
  - **Então** o comportamento esperado deve ser atendido com sucesso ou erro tratado adequadamente.

- [ ] **Garantia de Não-Regressão:**
  - **Dado que** os fluxos adjacentes continuem em execução;
  - **Quando** a suíte de testes for executada;
  - **Então** nenhum teste pré-existente deve quebrar.

---

## 5. Diretrizes de Teste de Regressão (TDD Red/Green)

- **Arquivo de Teste:** `tests/test_[modulo]_[slug].py`
- **Protocolo Obrigatório:**
  1. **Red:** Escrever o teste reproduzindo a falha exata (o teste DEVE falhar antes do código ser tocado).
  2. **Green:** Modificar o código de produção estritamente necessário para fazer o teste passar.
- **Comando:** `pytest tests/test_[modulo]_[slug].py -v`

---

## 6. Restrições

- ❌ Não mascarar erros com blocos genéricos de `try/except: pass`.
- ❌ Não alterar contratos públicos de API sem compatibilidade reversa.
