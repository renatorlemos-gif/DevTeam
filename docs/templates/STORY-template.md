# Histórias de Usuário: [Nome da Funcionalidade / Épico]

---
**Referência PRD**: `./docs/prds/PRD-v1.0-[nome-da-feature].md`  
**Autor**: Product Owner (DevTeam)  
**Status**: [Em Elaboração | Aprovado pelo Usuário | Em Desenvolvimento | Concluído]  
**Data**: [AAAA-MM-DD]  
---

## 1. Visão do Épico
[Breve resumo do que este conjunto de histórias entrega de valor de negócio, derivado do PRD v1.0]

---

## 2. Histórias de Usuário e Critérios de Aceitação (BDD / Gherkin)

### US-01: [Título Conciso da História]
* **Como** [persona do PRD],
* **Eu quero** [ação ou funcionalidade],
* **Para que** [benefício e valor gerado].

#### Critérios de Aceitação:

```gherkin
Cenário 01: [Sucesso / Caminho Feliz]
Dado que [estado inicial do sistema]
Quando [o usuário executa a ação principal com dados válidos]
Então [o sistema processa com sucesso]
E [o resultado visível esperado é exibido]

Cenário 02: [Validação / Regra de Negócio Violada]
Dado que [estado inicial com dados inválidos ou incompletos]
Quando [o usuário tenta submeter a ação]
Então [o sistema bloqueia a execução]
E [exibe a mensagem de validação correspondente]

Cenário 03: [Tratamento de Exceção ou Falha Externa]
Dado que [o serviço de dependência externa falha ou dá timeout]
Quando [a requisição é processada]
Então [o sistema deve retornar erro controlado de forma graciosa]
E [registrar o log do evento sem expor detalhes sensíveis]
```

---

### US-02: [Título da Próxima História]
* **Como** [persona],
* **Eu quero** [ação],
* **Para que** [valor].

#### Critérios de Aceitação:
```gherkin
Cenário 01: [Descrição]
Dado que ...
Quando ...
Então ...
```

---

## 3. Matriz de Priorização (MoSCoW)

| História | Título | Prioridade | Esforço Estimado |
| :--- | :--- | :--- | :--- |
| **US-01** | [Título] | Must Have | Médio |
| **US-02** | [Título] | Should Have | Baixo |

---

## 4. Definition of Ready (DoR) Checklist
- [x] PRD v1.0 validado e linkado.
- [x] Histórias no padrão clássico com persona, ação e valor.
- [x] Cenários de teste Gherkin definidos para todas as histórias.
- [ ] **Aprovação formal do Usuário registrada no chat**.

---

## 5. Definition of Done (DoD) Checklist
- [ ] Código implementado de acordo com as diretrizes do projeto.
- [ ] 100% dos cenários Gherkin automatizados em testes de unidade/integração.
- [ ] Todos os testes executados e passando sem falhas.
