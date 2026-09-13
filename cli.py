#!/usr/bin/env python3
"""
DevTeam CLI - Utilitário de Suporte para Gestão de Demanda e Repositórios
Permite inspecionar artefatos, inicializar repositórios e verificar a matriz de modelos LLM.
"""

import sys
import os
import json
import shutil
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

def show_help():
    print("""
============================================================
              DevTeam - Multi-Agent Engineering CLI
============================================================
Uso:
  python cli.py status                  Inspeciona PRDs e Histórias ativas
  python cli.py new-prd <feature_name>  Cria um rascunho PRD v0.1 a partir do template
  python cli.py init-repo [caminho]     Inicializa a estrutura de docs em um repositório alvo
  python cli.py models                  Exibe a matriz de LLMs e custo-benefício
  python cli.py help                    Exibe esta ajuda
============================================================
""")

def status_command():
    docs_dir = Path.cwd() / "docs"
    if not docs_dir.exists():
        docs_dir = BASE_DIR / "docs"
    
    prds_dir = docs_dir / "prds"
    stories_dir = docs_dir / "stories"

    print("\n--- Status dos Artefatos do DevTeam ---")
    print(f"Diretório base: {docs_dir}\n")

    print("[PRDs de Requisitos]:")
    prds = [p for p in prds_dir.glob("*.md") if not p.name.startswith(".")] if prds_dir.exists() else []
    if prds:
        for p in sorted(prds):
            print(f"  * {p.name}")
    else:
        print("  (Nenhum PRD encontrado)")

    print("\n[Histórias de Usuário / BDD]:")
    stories = [s for s in stories_dir.glob("*.md") if not s.name.startswith(".")] if stories_dir.exists() else []
    if stories:
        for s in sorted(stories):
            print(f"  * {s.name}")
    else:
        print("  (Nenhuma história encontrada)")
    print("")

def new_prd_command(feature_name: str):
    if not feature_name:
        print("Erro: Informe o nome da funcionalidade (ex: python cli.py new-prd autenticacao-otp)")
        sys.exit(1)
    
    template_path = BASE_DIR / "docs" / "templates" / "PRD-template.md"
    if not template_path.exists():
        print(f"Erro: Template {template_path} não encontrado.")
        sys.exit(1)

    target_dir = Path.cwd() / "docs" / "prds"
    target_dir.mkdir(parents=True, exist_ok=True)
    target_file = target_dir / f"PRD-v0.1-{feature_name}.md"

    if target_file.exists():
        print(f"Aviso: O arquivo {target_file} já existe. Nenhuma alteração feita.")
        return

    content = template_path.read_text(encoding="utf-8")
    content = content.replace("[Nome da Funcionalidade / Épico]", feature_name)
    content = content.replace("[v0.1 | v0.2 | v1.0]", "v0.1")
    content = content.replace("[Rascunho | Em Revisão | Aprovado]", "Rascunho")

    target_file.write_text(content, encoding="utf-8")
    print(f"Sucesso! PRD v0.1 criado em: {target_file}")
    print("Agora convoque o Analista de Requisitos para iniciar as rodadas de perguntas.")

def init_repo_command(target_path_str: str = "."):
    target_path = Path(target_path_str).resolve()
    print(f"Inicializando governança leve do DevTeam em: {target_path}")

    # Cria pastas docs
    (target_path / "docs" / "prds").mkdir(parents=True, exist_ok=True)
    (target_path / "docs" / "stories").mkdir(parents=True, exist_ok=True)

    # Cria GEMINI.md técnico de exemplo se não existir
    gemini_file = target_path / "GEMINI.md"
    if not gemini_file.exists():
        gemini_content = """# Regras Técnicas do Projeto

Este repositório é desenvolvido com o suporte do time multi-agente **DevTeam**.

## Diretrizes de Engenharia Locais
- **Linguagem / Stack**: [Defina a linguagem e versão, ex: Python 3.12, Node.js 20, Go 1.22]
- **Frameworks**: [Ex: FastAPI, React, Next.js, Django]
- **Banco de Dados**: [Ex: PostgreSQL, SQLite, MongoDB]
- **Padrão de Testes**: [Ex: pytest com cobertura mínima de 80%]
- **Documentação de Negócio**: Salva em `./docs/prds/` e `./docs/stories/`.
"""
        gemini_file.write_text(gemini_content, encoding="utf-8")
        print(f"  + Criado {gemini_file}")

    print("Repositório pronto para ser utilizado pelo time DevTeam!")

def models_command():
    config_file = BASE_DIR / "config" / "model_router.json"
    if not config_file.exists():
        print("Erro: Arquivo config/model_router.json não encontrado.")
        return
    
    data = json.loads(config_file.read_text(encoding="utf-8"))
    print("\n--- Matriz de Modelos LLM (Custo-Benefício & Roteamento) ---")
    for role_key, role_info in data.get("roles", {}).items():
        print(f"\n[Papel: {role_info.get('name')}]")
        print(f"  * Modelo Padrão: {role_info.get('default_model')}")
        print(f"  * Justificativa: {role_info.get('rationale')}")
        if "dynamic_escalation" in role_info:
            esc = role_info["dynamic_escalation"]
            print(f"  * Escalação Dinâmica: {esc.get('escalated_model')} quando {esc.get('condition')}")
    print("\n")

def main():
    if len(sys.argv) < 2:
        show_help()
        return

    cmd = sys.argv[1].lower()
    if cmd == "status":
        status_command()
    elif cmd == "new-prd":
        feature = sys.argv[2] if len(sys.argv) > 2 else ""
        new_prd_command(feature)
    elif cmd == "init-repo":
        target = sys.argv[2] if len(sys.argv) > 2 else "."
        init_repo_command(target)
    elif cmd == "models":
        models_command()
    else:
        show_help()

if __name__ == "__main__":
    main()
