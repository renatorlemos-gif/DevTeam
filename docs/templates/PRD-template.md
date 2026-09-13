# PRD: [Nome da Funcionalidade / Épico]

---
**Status**: [Rascunho | Em Revisão | Aprovado]  
**Versão**: [v0.1 | v0.2 | v1.0]  
**Autor**: Analista de Requisitos (DevTeam)  
**Data**: [AAAA-MM-DD]  
**Projeto Alvo**: [Nome do Repositório / Aplicação]  
---

## 1. Histórico de Versões

| Versão | Data | Autor | Resumo das Alterações |
| :--- | :--- | :--- | :--- |
| v0.1 | AAAA-MM-DD | Analista de Requisitos | Rascunho inicial gerado a partir da primeira rodada de entrevistas. |
| v0.2 | AAAA-MM-DD | Analista de Requisitos | Ajuste de regras de exceção e escopo conforme feedback do usuário. |
| v1.0 | AAAA-MM-DD | Analista de Requisitos | Versão final homologada e aprovada para repasse ao Product Owner. |

---

## 2. Visão Geral & Problema
* **Qual é o problema ou necessidade real?**
  [Descreva detalhadamente a dor do usuário, o contexto e o cenário atual]
* **Qual é a proposta de solução?**
  [Explicação de alto nível do que será construído]

---

## 3. Objetivos & Não-Objetivos

### 3.1. Objetivos (O que ESTÁ dentro do escopo)
* [Objetivo Mensurável 1]
* [Objetivo Mensurável 2]

### 3.2. Não-Objetivos (O que está ESTRITAMENTE fora do escopo neste momento)
* [Item 1 que NÃO será desenvolvido agora]
* [Item 2 que fica para versões futuras]

---

## 4. Personas e Casos de Uso
* **Persona Principal**: [Ex: Administrador do Sistema, Cliente Final, Operador]
  - *Contexto*: [Como e onde a persona interage com a solução]
* **Fluxo Principal (Caminho Feliz)**:
  1. O usuário acessa...
  2. O sistema solicita...
  3. O usuário confirma...
  4. O sistema processa e exibe...

---

## 5. Requisitos Funcionais (RF)

| ID | Nome do Requisito | Descrição Detalhada | Prioridade |
| :--- | :--- | :--- | :--- |
| **RF-01** | [Título do RF] | [Regras de negócio, entradas, validações e saídas esperadas] | Alta (Must) |
| **RF-02** | [Título do RF] | [Regras de negócio, entradas, validações e saídas esperadas] | Média (Should) |

---

## 6. Requisitos Não-Funcionais (RNF)

* **RNF-01 (Desempenho)**: [Ex: O tempo de resposta deve ser inferior a 200ms]
* **RNF-02 (Segurança)**: [Ex: Senhas e tokens devem ser criptografados com algoritmo seguro]
* **RNF-03 (Compatibilidade)**: [Ex: Compatível com Python 3.11+, Node 20+, etc.]

---

## 7. Fluxos de Exceção e Casos de Borda
* **Falha de Conectividade / Timeout**: [O que o sistema faz?]
* **Dados Inválidos ou Duplicados**: [Qual mensagem é exibida?]
* **Cancelamento no Meio da Ação**: [Como o estado é revertido?]

---

## 8. Critérios de Aceite de Alto Nível
- [ ] O usuário consegue concluir o fluxo principal sem erros.
- [ ] Todos os casos de exceção mapeados retornam feedback claro.
- [ ] O PRD foi formalmente aprovado pelo patrocinador da demanda (Usuário).
