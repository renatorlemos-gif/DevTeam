---
name: design-api-contratos
description: Elabora o design técnico e especificações formais de APIs (OpenAPI/Swagger) e esquemas de dados de acordo com os padrões organizacionais.
---

# Habilidade: Design de API e Contratos de Dados

Esta habilidade é utilizada para converter especificações funcionais e narrativas ágeis em **contratos técnicos estritos**, servindo de fundação para o desenvolvimento backend, front-end e integrações.

---

## 1. Quando Acionar Esta Habilidade
- Uma História de Usuário (User Story) detalhar a necessidade de criar ou modificar um endpoint, serviço ou estrutura de banco de dados.
- O projeto precisar de documentação técnica formal de contratos (ex: OpenAPI 3.0, GraphQL schema, DDL SQL).
- Ocorrer uma validação de viabilidade técnica no modo "Docs-as-Code Exclusivo" antes da etapa de codificação.

---

## 2. Preparação e Leitura de Padrões

1. **Obrigatório**: Antes de desenhar qualquer contrato, utilize a ferramenta `view_file` para consultar e ler os padrões organizacionais locais aplicáveis no repositório `.cache/standards`. 
   - Busque por padrões nas pastas de arquitetura, como `.cache/standards/architecture/api/` (Regras de nomenclatura, verbos HTTP, versionamento, paginação, códigos de erro) e `.cache/standards/architecture/data/` (Padrões de modelagem, nomenclatura, chaves).
2. Consulte também o repositório de standards para identificar o diretório canônico onde as especificações de API e Modelagem de Dados devem ser salvas no projeto final.

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
2. Formato de saída (ex: script DDL `.sql`, sintaxe DBML, ou diagramas de entidade-relacionamento) estritamente conforme ditado pelo `.cache/standards`.

---

## 4. Finalização e Vínculo

1. Salve os arquivos de contrato nos caminhos designados pelo `.cache/standards`.
2. Abra a História de Usuário (User Story) correspondente e atualize-a preenchendo a seção de contratos/interfaces com as referências (caminhos relativos) aos contratos técnicos recém-gerados.
3. Solicite aprovação técnica e submeta os artefatos para validação (Quality Gate).
