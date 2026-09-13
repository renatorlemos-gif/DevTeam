# Repositório de Documentação do DevTeam

Esta pasta armazena temporariamente os artefatos de negócio e especificações gerados pela equipe multi-agente durante o ciclo de entrega.

---

## 1. Estrutura de Pastas

```text
docs/
├── prds/          # PRDs versionados (gerados pelo Analista de Requisitos)
├── stories/       # Histórias de Usuário e Critérios BDD (gerados pelo Product Owner)
└── templates/     # Modelos padronizados utilizados pelos agentes
    ├── PRD-template.md
    └── STORY-template.md
```

---

## 2. Como Mover a Documentação Posteriormente

Conforme planejado, você pode realocar esta documentação para qualquer outro destino:

### Opção A: Mover para dentro de cada repositório construído
Para que o repositório do projeto guarde seu próprio histórico, copie a pasta `docs/` para a raiz do repositório da aplicação:
```powershell
Copy-Item -Recurse C:\Dev\Projetos\DevTeam\docs C:\Dev\Projetos\<MeuProjeto>\docs
```
Como os agentes utilizam caminhos relativos (`./docs/prds/`, `./docs/stories/`), eles continuarão funcionando perfeitamente dentro do repositório do projeto.

### Opção B: Centralizar por Subpastas de Projeto
Se preferir manter a documentação centralizada no DevTeam organizada por projeto, basta criar pastas dentro de `prds/` e `stories/`:
```text
docs/
├── prds/
│   ├── ProjetoAlpha/
│   └── ProjetoBeta/
└── stories/
    ├── ProjetoAlpha/
    └── ProjetoBeta/
```
