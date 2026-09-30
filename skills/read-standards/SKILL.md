---
name: read-standards
description: Use this skill to read and search the software delivery standards markdown files located in the project's .cache/standards directory.
---
# Read Software Delivery Standards

The project's software delivery standards, architecture decisions, and rules are located in the `.cache\standards` directory. 
Whenever you need to verify if an architectural decision, code style, or process complies with the team's standards, use this skill.

## How to use
1. Inicie a consulta LENDO OBRIGATORIAMENTE o arquivo `.cache\standards\AGENT_BOOTSTRAP.md` com a ferramenta `view_file`.
2. O arquivo Bootstrap listará os caminhos exatos para os templates de produto e regras de governança.
3. Use a ferramenta `view_file` novamente para ler o template específico exigido pelo Bootstrap ANTES de gerar o seu artefato (ex: PRDs, User Stories).
4. Se precisar buscar um tópico genérico, você ainda pode usar o `run_command` com `Select-String` do PowerShell apontando para `.cache\standards\*.md`.
