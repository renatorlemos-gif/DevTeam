---
name: desenvolvimento
description: Implementa o código de produção e testes automatizados no Modo Ciclo Completo, ou constrói protótipos em React e ADRs em docs/ quando no Modo Docs-as-Code Exclusivo.
---

# Habilidade: Implementação Técnica, Prototipação & Qualidade

Esta habilidade é utilizada pelo **Developer** para converter critérios de aceitação e especificações técnicas em artefatos executáveis (protótipos interativos ou código final de produção).

---

## 1. Verificação de Entrada & Modo de Operação

1. Abra e leia `./docs/specs/us-<nome-da-feature>.md` (ou `./docs/specs/bug-<slug>.md`).
2. Identifique o **Modo de Atuação do DevTeam** (no `AGENTS.md` ou alinhado no Gate 0):

### 🅰️ Se Modo "Docs-as-Code Exclusivo":
- **PROIBIÇÃO RIGOROSA:** Não toque em arquivos fora de `./docs/` (em `src/`, `tests/` ou configurações de projeto).
- **Prototipação Visual em React (Se houver UI):**
  - Crie a pasta `./docs/prototypes/<slug-da-feature>/`.
  - Construa o protótipo funcional em React + Tailwind (preferencialmente standalone `index.html` ou componentes limpos) cobrindo estados: inicial, carregando, erro e sucesso.
  - Crie o `README.md` explicativo e vincule o caminho na seção 3.1 da história em `docs/specs/`.
- **Decisões Técnicas (ADR):** Se houver escolhas arquiteturais, registre em `./docs/architecture/adr-*.md`.
- Conclua a entrega apresentando os links dos protótipos e especificações para o usuário.

### 🅱️ Se Modo "Ciclo Completo" (End-to-End):
- Siga para o ciclo de codificação em `src/` e testes automatizados em `tests/` conforme abaixo.

---

## 2. Ciclo de Implementação em Produção (Apenas Modo Ciclo Completo)

1. **Planejamento de Arquitetura & ADR**:
   - Defina os módulos, classes ou endpoints necessários em `src/`.
   - Caso precise introduzir uma nova biblioteca ou padrão estrutural, crie um registro em `./docs/architecture/adr-<num>-<slug>.md`.
2. **Ciclo TDD & Escrita de Testes**:
   - Crie/atualize o arquivo de testes indicado na especificação (ex: `tests/test_[modulo]_[slug].py`).
   - Garanta a cobertura de 100% dos cenários Gherkin (caminho feliz, validação de regras e tratamento de erros).
   - Para correção de bugs: escreva primeiro o teste reproduzindo a falha (Red) antes de alterar o código de produção.
3. **Escrita do Código de Produção**:
   - Implemente a lógica em `src/` necessária para cumprir cada critério das histórias.
   - Aplique validações, tratamento de exceções e boas práticas de segurança.
   - **Respeito Estrito às Restrições**: Siga à risca a seção "O que NÃO fazer" da especificação.
4. **Validação & Execução**:
   - Execute o comando de teste indicado na especificação (ex: `pytest tests/test_...py -v`).
   - Garanta que todos os testes passem (`100% green`).

---

## 3. Entrega e Fechamento
1. Exiba um resumo dos arquivos criados/alterados.
2. Apresente o resultado dos testes comprovando que todos os critérios foram atendidos (Definition of Done).
