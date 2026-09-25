---
id: "us-[slug-da-funcionalidade]"
title: "US: [Título da Funcionalidade / Épico]"
status: "Draft" # Draft | Ready for Dev | In Progress | Done
prd_ref: "docs/product/prd-[feature].md"
last_updated: "YYYY-MM-DD"
owner: "Product Owner (DevTeam)"
tags:
  - "us"
  - "bdd"
  - "docs-as-code"
---

# US: [Título da Funcionalidade / Épico]

## 1. Visão do Épico & Narrativa do Usuário

- **Como** [persona do PRD]
- **Quero** [ação principal a ser executada]
- **Para que** [benefício de negócio gerado e valor mensurável]

---

## 2. Regras de Negócio & Contexto

- **Regra 1:** [Regra principal de validação, formato ou cálculo]
- **Regra 2:** [Comportamento em caso de valor nulo, ausente ou fallback]
- **Regra 3:** [Políticas de unicidade, autorização ou consistência]

---

## 3. Contratos & Schemas (Opcional)
<!-- Preencher se a história criar ou modificar schemas, tabelas, eventos ou APIs -->

```json
{
  "campo_exemplo": "string",
  "status": "ativo",
  "quantidade": 10
}
```

---

## 3.1. Protótipo Interativo & Telas (Opcional)
<!-- Preencher se a história envolver interface de usuário (UI/UX) -->
- **Caminho do Protótipo:** `docs/prototypes/[slug-da-feature]/`
- **Telas / Componentes Mapeados:** [Ex: Formulário de Login, Modal de Recuperação de Senha]
- **Estados Visuais Mockados:** [Vazio, Carregando (Skeleton), Erro de Validação, Sucesso]

---

## 4. Critérios de Aceitação (BDD / Gherkin)

### Cenário 01: [Sucesso / Caminho Feliz]
- **Dado que** [estado inicial conhecido com dados válidos]
- **Quando** [a ação principal for disparada]
- **Então** [o sistema processa com sucesso e confirma a persistência]
- **E** [o resultado visível esperado é retornado]

### Cenário 02: [Validação / Regra Violada]
- **Dado que** [estado inicial com dado ausente ou inválido]
- **Quando** [o usuário tenta submeter a operação]
- **Então** [o sistema bloqueia a execução com erro estruturado]
- **E** [nenhum dado parcial é gravado no banco]

### Cenário 03: [Falha Externa / Resiliência]
- **Dado que** [o serviço dependente retorna erro ou timeout]
- **Quando** [a operação for executada]
- **Então** [o sistema trata graciosamente e registra o log sem vazar dados sensíveis]

---

## 5. Diretrizes de Testes Automatizados (TDD)

- **Arquivo Alvo de Teste:** `tests/test_[modulo]_[slug].py`
- **Cenários Mínimos Obrigatórios:** Validação de schema/modelo, caminho feliz e casos de borda/erro.
- **Comando de Execução:** `pytest tests/test_[modulo]_[slug].py -v`

---

## 6. Restrições & Anti-Alucinação (O que NÃO fazer)

- ❌ Não utilizar dados hardcoded no código de produção (usar constantes ou variáveis de ambiente).
- ❌ Não realizar commits ou persistências parciais no banco (usar transações atômicas com rollback em falha).
- ❌ Não expor stacktraces ou detalhes internos de infraestrutura nas respostas de erro.

---

## 7. Definition of Ready (DoR) & Definition of Done (DoD)

### Definition of Ready (DoR) - Para Iniciar o Dev:
- [x] PRD homologado em `1.0.0 (Approved)` e linkado no cabeçalho.
- [x] Narrativa ágil, cenários Gherkin e contratos mapeados.
- [x] Diretrizes de teste e restrições técnicas definidas.
- [ ] **Aprovação explícita do Usuário concedida no chat**.

### Definition of Done (DoD) - Para Concluir o Dev:
- [ ] Código-fonte implementado conforme as regras e restrições.
- [ ] 100% dos cenários Gherkin cobertos por testes automatizados em `tests/`.
- [ ] Suíte de testes local executada com todos os testes verdes (`passed`).
