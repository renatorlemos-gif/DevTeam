# Blueprint de Repositório de Projeto (DevTeam)

Este modelo contém as instruções para configurar repositórios filhos que serão atendidos pelo DevTeam.

---

## 1. O que um novo projeto precisa ter?

Para manter os projetos leves e desacoplados do motor do DevTeam, um novo repositório só precisa conter:

1. **`GEMINI.md` local minimalista**:
   Contendo apenas a stack técnica daquele projeto. Exemplo:
   ```markdown
   # Diretrizes Técnicas do Projeto
   - Stack: Python 3.12, FastAPI, PostgreSQL e SQLAlchemy.
   - Padrão de Testes: pytest com fixtures e cobertura mínima de 85%.
   - Linting: ruff e mypy em modo estrito.
   ```

2. **Pasta de Documentação local (`docs/`)**:
   Onde os PRDs e Histórias serão salvos para versionamento no Git do projeto:
   ```text
   docs/
   ├── prds/
   └── stories/
   ```

---

## 2. Como inicializar um novo projeto com o DevTeam

No terminal da pasta do seu novo projeto (`C:\Dev\Projetos\<NovoProjeto>`), você pode rodar o comando utilitário:
```powershell
python C:\Dev\Projetos\DevTeam\cli.py init-repo
```
Isso criará a pasta `docs/` e o `GEMINI.md` técnico básico automaticamente.
