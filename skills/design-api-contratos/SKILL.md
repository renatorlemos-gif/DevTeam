---
name: design-api-contratos
description: Skill do Agente Tech Lead / Architect. Elabora o design técnico e especificações formais de APIs (OpenAPI/Swagger) e esquemas de dados de acordo com os padrões organizacionais.
---

# Habilidade: Design de API e Contratos de Dados

Esta habilidade é utilizada pelo **Tech Lead / Architect** para converter especificações funcionais em **contratos técnicos estritos**, servindo de fundação para o desenvolvimento backend, front-end e integrações.

---

## 1. Bootstrap Obrigatório (Primeiro Passo)
1. Leia o arquivo `.cache\standards\AGENT_BOOTSTRAP.md` com a ferramenta `view_file`.
2. Consulte os padrões em `.cache/standards/architecture/api/` e `.cache/standards/architecture/data/` para regras de nomenclatura, verbos HTTP, versionamento, paginação e códigos de erro.
3. Identifique o diretório canônico onde as especificações de API e Modelagem de Dados devem ser salvas.

---

## 2. Quando Acionar Esta Habilidade
- O PRD ou ADR indicar a necessidade de criar ou modificar um endpoint, serviço ou estrutura de banco de dados.
- O projeto precisar de documentação técnica formal de contratos (ex: OpenAPI 3.0, GraphQL schema, DDL SQL).
- Ocorrer uma validação de viabilidade técnica durante a fase Solution Definition (Triagem Macro).
- Ocorrer um refinamento durante a Micro-Triage de uma Feature.
> **🛑 REGRA ANTI-BATCHING (Gate 1 e 2):** Na etapa de Triagem Granular (Micro-Triage), você deve atuar EXCLUSIVAMENTE sobre a ÚNICA Feature selecionada pelo humano (Gate 1), criando contratos de API e modelos de dados apenas para o escopo estrito desta Feature específica. É proibido detalhar múltiplas Features em lote.

---

## 3. Elaboração do Contrato Técnico

### A. Design de API (REST / GraphQL / RPC)
1. Elabore a especificação estrutural cobrindo:
   - Rotas, Verbos, Path Parameters e Query Strings.
   - Schemas rigorosos de Request e Response (payloads JSON detalhados com tipagem).
   - Tratamento mapeado de Erros (HTTP 4xx, 5xx) alinhado com o standard corporativo.
   - Restrições de segurança (Autenticação/Autorização requerida).
2. O formato de saída preferencial é o padrão de mercado (OpenAPI/Swagger em formato YAML/JSON, ou esquemas .graphql), a menos que os standards da organização exijam documentação em Markdown.

### B. Design de Banco de Dados / Persistência
1. Elabore o esquema lógico/físico:
   - Definição de tabelas, entidades ou coleções.
   - Tipagem rigorosa, Constraints (NOT NULL, UNIQUE), Chaves Primárias/Estrangeiras e Índices de performance.
2. Formato de saída estritamente conforme ditado pelo `.cache/standards`.

---

## 4. Finalização e Vínculo

1. Salve os arquivos de contrato nos caminhos designados pelo `.cache/standards`.
2. Vincule as referências (caminhos relativos) no ADR ou no PRD correspondente.
3. Solicite aprovação técnica e submeta os artefatos para validação (Quality Gate).
