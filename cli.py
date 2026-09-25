#!/usr/bin/env python3
"""
DevTeam CLI - Utilitário de Suporte para Gestão de Demanda, Engenharia e Repositórios
Permite inspecionar artefatos Docs-as-Code, criar PRDs, USs, Bugs, ADRs e Protótipos React, e inicializar repositórios com AGENTS.md.
"""

import sys
import os
import re
import json
import shutil
from pathlib import Path
from datetime import date

BASE_DIR = Path(__file__).resolve().parent

def show_help():
    print("""
============================================================
              DevTeam - Multi-Agent Engineering CLI
============================================================
Uso:
  python cli.py status                  Inspeciona PRDs, USs, Bugs, ADRs e Protótipos
  python cli.py new-prd <slug>          Cria rascunho de PRD em docs/product/
  python cli.py new-us <slug>           Cria especificação de US em docs/specs/
  python cli.py new-bug <slug>          Cria especificação de Bug em docs/specs/
  python cli.py new-adr <slug>          Cria registro de ADR em docs/architecture/
  python cli.py new-proto <slug>        Cria protótipo React interativo em docs/prototypes/
  python cli.py init-repo [caminho]     Inicializa docs e AGENTS.md em um repositório alvo
  python cli.py models                  Exibe a matriz de LLMs e custo-benefício
  python cli.py help                    Exibe esta ajuda
============================================================
""")

def status_command():
    docs_dir = Path.cwd() / "docs"
    if not docs_dir.exists():
        docs_dir = BASE_DIR / "docs"
    
    product_dir = docs_dir / "product" if (docs_dir / "product").exists() else docs_dir / "prds"
    specs_dir = docs_dir / "specs" if (docs_dir / "specs").exists() else docs_dir / "stories"
    arch_dir = docs_dir / "architecture"
    proto_dir = docs_dir / "prototypes"

    print("\n--- Status dos Artefatos do DevTeam (Docs-as-Code) ---")
    print(f"Diretório base: {docs_dir}\n")

    print("[PRDs de Produto (docs/product)]:")
    prds = [p for p in product_dir.glob("*.md") if not p.name.startswith(".")] if product_dir.exists() else []
    if prds:
        for p in sorted(prds):
            print(f"  * {p.name}")
    else:
        print("  (Nenhum PRD encontrado)")

    print("\n[Especificações de Tarefas & BDD (docs/specs)]:")
    specs = [s for s in specs_dir.glob("*.md") if not s.name.startswith(".")] if specs_dir.exists() else []
    if specs:
        for s in sorted(specs):
            prefix = "[BUG]" if s.name.startswith("bug-") else "[US]"
            print(f"  * {prefix} {s.name}")
    else:
        print("  (Nenhuma especificação encontrada)")

    print("\n[Decisões de Arquitetura (docs/architecture)]:")
    adrs = [a for a in arch_dir.glob("*.md") if not a.name.startswith(".")] if arch_dir.exists() else []
    if adrs:
        for a in sorted(adrs):
            print(f"  * {a.name}")
    else:
        print("  (Nenhum ADR encontrado)")

    print("\n[Protótipos de Interface (docs/prototypes)]:")
    protos = [p for p in proto_dir.iterdir() if p.is_dir() and not p.name.startswith(".")] if proto_dir.exists() else []
    if protos:
        for p in sorted(protos):
            print(f"  * [UI React] {p.name}")
    else:
        print("  (Nenhum protótipo encontrado)")
    print("")

def new_prd_command(slug: str):
    if not slug:
        print("Erro: Informe o slug da funcionalidade (ex: python cli.py new-prd autenticacao-otp)")
        sys.exit(1)
    
    template_path = BASE_DIR / "docs" / "templates" / "PRD-template.md"
    if not template_path.exists():
        print(f"Erro: Template {template_path} não encontrado.")
        sys.exit(1)

    target_dir = Path.cwd() / "docs" / "product"
    target_dir.mkdir(parents=True, exist_ok=True)
    target_file = target_dir / f"prd-{slug}.md"

    if target_file.exists():
        print(f"Aviso: O arquivo {target_file} já existe. Nenhuma alteração feita.")
        return

    today_str = date.today().isoformat()
    content = template_path.read_text(encoding="utf-8")
    content = content.replace("[slug-da-feature]", slug)
    content = content.replace("[Nome da Funcionalidade / Épico]", slug.replace("-", " ").title())
    content = content.replace("YYYY-MM-DD", today_str)

    target_file.write_text(content, encoding="utf-8")
    print(f"Sucesso! PRD criado em: {target_file}")
    print("Invoque o Analista de Requisitos para iniciar as rodadas investigativas.")

def new_us_command(slug: str):
    if not slug:
        print("Erro: Informe o slug da história (ex: python cli.py new-us login-google)")
        sys.exit(1)
    
    template_path = BASE_DIR / "docs" / "templates" / "STORY-template.md"
    if not template_path.exists():
        print(f"Erro: Template {template_path} não encontrado.")
        sys.exit(1)

    target_dir = Path.cwd() / "docs" / "specs"
    target_dir.mkdir(parents=True, exist_ok=True)
    target_file = target_dir / f"us-{slug}.md"

    if target_file.exists():
        print(f"Aviso: O arquivo {target_file} já existe. Nenhuma alteração feita.")
        return

    today_str = date.today().isoformat()
    content = template_path.read_text(encoding="utf-8")
    content = content.replace("[slug-da-funcionalidade]", slug)
    content = content.replace("[Título da Funcionalidade / Épico]", slug.replace("-", " ").title())
    content = content.replace("YYYY-MM-DD", today_str)

    target_file.write_text(content, encoding="utf-8")
    print(f"Sucesso! Especificação de US criada em: {target_file}")
    print("Invoque o Product Owner para refinar os critérios BDD e contratos.")

def new_bug_command(slug: str):
    if not slug:
        print("Erro: Informe o slug do bug (ex: python cli.py new-bug erro-500-token-expirado)")
        sys.exit(1)
    
    template_path = BASE_DIR / "docs" / "templates" / "BUG-template.md"
    if not template_path.exists():
        print(f"Erro: Template {template_path} não encontrado.")
        sys.exit(1)

    target_dir = Path.cwd() / "docs" / "specs"
    target_dir.mkdir(parents=True, exist_ok=True)
    target_file = target_dir / f"bug-{slug}.md"

    if target_file.exists():
        print(f"Aviso: O arquivo {target_file} já existe. Nenhuma alteração feita.")
        return

    today_str = date.today().isoformat()
    content = template_path.read_text(encoding="utf-8")
    content = content.replace("[slug-do-problema]", slug)
    content = content.replace("[Resumo Claro do Erro]", slug.replace("-", " ").title())
    content = content.replace("YYYY-MM-DD", today_str)

    target_file.write_text(content, encoding="utf-8")
    print(f"Sucesso! Especificação de Bug criada em: {target_file}")
    print("Invoque a skill de diagnóstico ou o Developer para o ciclo TDD Red/Green.")

def new_adr_command(slug: str):
    if not slug:
        print("Erro: Informe o slug da decisão (ex: python cli.py new-adr adocao-fastapi)")
        sys.exit(1)
    
    template_path = BASE_DIR / "docs" / "templates" / "ADR-template.md"
    if not template_path.exists():
        print(f"Erro: Template {template_path} não encontrado.")
        sys.exit(1)

    target_dir = Path.cwd() / "docs" / "architecture"
    target_dir.mkdir(parents=True, exist_ok=True)

    existing = list(target_dir.glob("adr-*.md"))
    nums = []
    for f in existing:
        m = re.match(r"adr-(\d+)-", f.name)
        if m:
            nums.append(int(m.group(1)))
    next_num = max(nums) + 1 if nums else 1
    num_str = f"{next_num:03d}"

    target_file = target_dir / f"adr-{num_str}-{slug}.md"
    if target_file.exists():
        print(f"Aviso: O arquivo {target_file} já existe. Nenhuma alteração feita.")
        return

    today_str = date.today().isoformat()
    content = template_path.read_text(encoding="utf-8")
    content = content.replace("[001]", num_str)
    content = content.replace("[slug-da-decisao]", slug)
    content = content.replace("[Título da Decisão Técnica]", slug.replace("-", " ").title())
    content = content.replace("YYYY-MM-DD", today_str)

    target_file.write_text(content, encoding="utf-8")
    print(f"Sucesso! Registro de Decisão Arquitetural (ADR) criado em: {target_file}")
    print("Preencha a matriz de alternativas com prós/contras e valide com o time.")

def new_proto_command(slug: str):
    if not slug:
        print("Erro: Informe o slug do protótipo (ex: python cli.py new-proto checkout-fluxo)")
        sys.exit(1)
    
    target_dir = Path.cwd() / "docs" / "prototypes" / slug
    target_dir.mkdir(parents=True, exist_ok=True)

    title = slug.replace("-", " ").title()
    today_str = date.today().isoformat()

    # README do protótipo
    readme_content = f"""# Protótipo Interativo: {title}

Especificação executável de interface construída pelo DevTeam em React + Tailwind CSS.

- **Data de Criação:** {today_str}
- **Como Visualizar:** Abra o arquivo `index.html` em qualquer navegador web moderno.
- **Finalidade:** Servir como referência de layout, fluxos de interação e estados visuais para o time de desenvolvimento.

## Estados Demonstrados no Protótipo:
1. **Padrão / Inicial:** Estado da tela com dados mockados.
2. **Carregando (Loading):** Feedback visual assíncrono.
3. **Erro de Validação:** Alertas visuais e campos destacados.
4. **Sucesso:** Conclusão da ação.
"""
    (target_dir / "README.md").write_text(readme_content, encoding="utf-8")

    # index.html standalone executável
    html_content = f"""<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Protótipo: {title}</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- React 18 e ReactDOM CDN -->
  <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
  <!-- Babel Standalone para JSX -->
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-slate-50 text-slate-800 antialiased min-h-screen">
  <div id="root"></div>

  <script type="text/babel">
    const {{ useState }} = React;

    function App() {{
      const [viewState, setViewState] = useState('default'); // 'default' | 'loading' | 'error' | 'success'

      return (
        <div className="max-w-2xl mx-auto py-10 px-4">
          <header className="mb-8 border-b pb-4 flex justify-between items-center">
            <div>
              <span className="text-xs uppercase tracking-wider font-semibold text-blue-600 bg-blue-50 px-2 py-1 rounded">DevTeam Protótipo UI</span>
              <h1 className="text-2xl font-bold mt-2 text-slate-900">{title}</h1>
            </div>
            
            {/* Seletor de Estados Visuais */}
            <div className="flex gap-1 bg-slate-200 p-1 rounded-lg text-xs font-medium">
              <button 
                onClick={{() => setViewState('default')}}
                className={{`px-2.5 py-1 rounded ${{viewState === 'default' ? 'bg-white shadow text-slate-900' : 'text-slate-600'}}`}}>
                Padrão
              </button>
              <button 
                onClick={{() => setViewState('loading')}}
                className={{`px-2.5 py-1 rounded ${{viewState === 'loading' ? 'bg-white shadow text-slate-900' : 'text-slate-600'}}`}}>
                Carregando
              </button>
              <button 
                onClick={{() => setViewState('error')}}
                className={{`px-2.5 py-1 rounded ${{viewState === 'error' ? 'bg-white shadow text-red-600' : 'text-slate-600'}}`}}>
                Erro
              </button>
              <button 
                onClick={{() => setViewState('success')}}
                className={{`px-2.5 py-1 rounded ${{viewState === 'success' ? 'bg-white shadow text-emerald-600' : 'text-slate-600'}}`}}>
                Sucesso
              </button>
            </div>
          </header>

          <main className="bg-white p-6 rounded-xl shadow-sm border border-slate-200">
            {{viewState === 'loading' && (
              <div className="space-y-4 animate-pulse">
                <div className="h-6 bg-slate-200 rounded w-1/3"></div>
                <div className="h-10 bg-slate-100 rounded w-full"></div>
                <div className="h-10 bg-slate-100 rounded w-full"></div>
                <div className="h-10 bg-blue-200 rounded w-1/4"></div>
              </div>
            )}}

            {{viewState === 'error' && (
              <div className="space-y-4">
                <div className="p-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700">
                  ⚠️ Erro de validação: Verifique os campos destacados abaixo.
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">Campo Exemplo</label>
                  <input type="text" defaultValue="valor_invalido" className="w-full border border-red-500 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-red-500 bg-red-50/30" />
                  <span className="text-xs text-red-600 mt-1 block">O formato informado não é aceito.</span>
                </div>
              </div>
            )}}

            {{viewState === 'success' && (
              <div className="text-center py-8">
                <div className="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-3 text-xl font-bold">✓</div>
                <h2 className="text-lg font-bold text-slate-900">Operação Concluída com Sucesso!</h2>
                <p className="text-sm text-slate-600 mt-1">O fluxo foi executado e os dados foram processados atomicamente.</p>
                <button onClick={{() => setViewState('default')}} className="mt-4 px-4 py-2 bg-slate-800 text-white text-sm font-medium rounded-lg hover:bg-slate-900">Reiniciar Demonstração</button>
              </div>
            )}}

            {{viewState === 'default' && (
              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">Entrada de Dados (Mock)</label>
                  <input type="text" placeholder="Digite uma informação..." className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>
                <button onClick={{() => setViewState('success')}} className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">
                  Confirmar Ação
                </button>
              </div>
            )}}
          </main>
        </div>
      );
    }}

    ReactDOM.createRoot(document.getElementById('root')).render(<App />);
  </script>
</body>
</html>
"""
    (target_dir / "index.html").write_text(html_content, encoding="utf-8")

    print(f"Sucesso! Protótipo interativo React criado em: {target_dir}")
    print(f"  + {target_dir / 'index.html'} (Abra no navegador)")
    print(f"  + {target_dir / 'README.md'}")

def init_repo_command(target_path_str: str = "."):
    target_path = Path(target_path_str).resolve()
    print(f"Inicializando governança Docs-as-Code do DevTeam em: {target_path}")

    # Cria pastas canônicas limpas (zero templates mortos)
    (target_path / "docs" / "product").mkdir(parents=True, exist_ok=True)
    (target_path / "docs" / "specs").mkdir(parents=True, exist_ok=True)
    (target_path / "docs" / "architecture").mkdir(parents=True, exist_ok=True)
    (target_path / "docs" / "prototypes").mkdir(parents=True, exist_ok=True)

    # Cria AGENTS.md na raiz se não existir
    agents_file = target_path / "AGENTS.md"
    if not agents_file.exists():
        blueprint_agents = BASE_DIR / "templates" / "repo-blueprint" / "AGENTS.md"
        if blueprint_agents.exists():
            shutil.copy2(blueprint_agents, agents_file)
        else:
            agents_file.write_text("""# AGENTS.md - Novo Projeto
Guia de contexto e comandos para agentes de IA atuando neste repositório.
""", encoding="utf-8")
        print(f"  + Criado {agents_file} (Guia Mestre de IA)")
    else:
        print(f"  (AGENTS.md já existe em {target_path})")

    print("\nRepositório pronto para ser utilizado pelo time DevTeam!")
    print("Pastas criadas: docs/product, docs/specs, docs/architecture, docs/prototypes")

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
    elif cmd in ("new-us", "new-story"):
        slug = sys.argv[2] if len(sys.argv) > 2 else ""
        new_us_command(slug)
    elif cmd == "new-bug":
        slug = sys.argv[2] if len(sys.argv) > 2 else ""
        new_bug_command(slug)
    elif cmd == "new-adr":
        slug = sys.argv[2] if len(sys.argv) > 2 else ""
        new_adr_command(slug)
    elif cmd in ("new-proto", "new-prototype"):
        slug = sys.argv[2] if len(sys.argv) > 2 else ""
        new_proto_command(slug)
    elif cmd == "init-repo":
        target = sys.argv[2] if len(sys.argv) > 2 else "."
        init_repo_command(target)
    elif cmd == "models":
        models_command()
    else:
        show_help()

if __name__ == "__main__":
    main()
