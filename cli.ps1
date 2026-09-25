<#
.SYNOPSIS
    DevTeam CLI - Utilitário PowerShell para Gestão de Demanda, Engenharia e Repositórios
.DESCRIPTION
    Permite inspecionar artefatos Docs-as-Code, criar PRDs, USs, Bugs, ADRs e Protótipos React, e inicializar repositórios com AGENTS.md.
#>

param (
    [Parameter(Position=0)]
    [string]$Command = "help",

    [Parameter(Position=1)]
    [string]$Arg1 = ""
)

$BaseDir = $PSScriptRoot

function Show-Help {
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host "              DevTeam - Multi-Agent Engineering CLI        " -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host "Uso:"
    Write-Host "  .\cli.ps1 status                  Inspeciona PRDs, USs, Bugs, ADRs e Protótipos"
    Write-Host "  .\cli.ps1 new-prd <slug>          Cria rascunho de PRD em docs/product/"
    Write-Host "  .\cli.ps1 new-us <slug>           Cria especificação de US em docs/specs/"
    Write-Host "  .\cli.ps1 new-bug <slug>          Cria especificação de Bug em docs/specs/"
    Write-Host "  .\cli.ps1 new-adr <slug>          Cria registro de ADR em docs/architecture/"
    Write-Host "  .\cli.ps1 new-proto <slug>        Cria protótipo React interativo em docs/prototypes/"
    Write-Host "  .\cli.ps1 init-repo [caminho]     Inicializa docs e AGENTS.md em um repositório alvo"
    Write-Host "  .\cli.ps1 models                  Exibe a matriz de LLMs e custo-benefício"
    Write-Host "  .\cli.ps1 help                    Exibe esta ajuda"
    Write-Host "============================================================" -ForegroundColor Cyan
}

function Show-Status {
    $docsDir = Join-Path (Get-Location) "docs"
    if (-not (Test-Path $docsDir)) {
        $docsDir = Join-Path $BaseDir "docs"
    }

    $productDir = Join-Path $docsDir "product"
    if (-not (Test-Path $productDir)) { $productDir = Join-Path $docsDir "prds" }

    $specsDir = Join-Path $docsDir "specs"
    if (-not (Test-Path $specsDir)) { $specsDir = Join-Path $docsDir "stories" }

    $archDir = Join-Path $docsDir "architecture"
    $protoDir = Join-Path $docsDir "prototypes"

    Write-Host "`n--- Status dos Artefatos do DevTeam (Docs-as-Code) ---" -ForegroundColor Yellow
    Write-Host "Diretório base: $docsDir`n"

    Write-Host "[PRDs de Produto (docs/product)]:" -ForegroundColor Green
    if (Test-Path $productDir) {
        $prds = Get-ChildItem -Path $productDir -Filter "*.md" | Where-Object { $_.Name -notlike ".*" }
        if ($prds) {
            foreach ($p in $prds) {
                Write-Host "  * $($p.Name)"
            }
        } else {
            Write-Host "  (Nenhum PRD encontrado)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (Pasta product/prds não encontrada)" -ForegroundColor Gray
    }

    Write-Host "`n[Especificações de Tarefas & BDD (docs/specs)]:" -ForegroundColor Green
    if (Test-Path $specsDir) {
        $specs = Get-ChildItem -Path $specsDir -Filter "*.md" | Where-Object { $_.Name -notlike ".*" }
        if ($specs) {
            foreach ($s in $specs) {
                $prefix = if ($s.Name.StartsWith("bug-")) { "[BUG]" } else { "[US]" }
                Write-Host "  * $prefix $($s.Name)"
            }
        } else {
            Write-Host "  (Nenhuma especificação encontrada)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (Pasta specs/stories não encontrada)" -ForegroundColor Gray
    }

    Write-Host "`n[Decisões de Arquitetura (docs/architecture)]:" -ForegroundColor Green
    if (Test-Path $archDir) {
        $adrs = Get-ChildItem -Path $archDir -Filter "*.md" | Where-Object { $_.Name -notlike ".*" }
        if ($adrs) {
            foreach ($a in $adrs) {
                Write-Host "  * $($a.Name)"
            }
        } else {
            Write-Host "  (Nenhum ADR encontrado)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (Pasta architecture não encontrada)" -ForegroundColor Gray
    }

    Write-Host "`n[Protótipos de Interface (docs/prototypes)]:" -ForegroundColor Green
    if (Test-Path $protoDir) {
        $protos = Get-ChildItem -Path $protoDir -Directory | Where-Object { $_.Name -notlike ".*" }
        if ($protos) {
            foreach ($pr in $protos) {
                Write-Host "  * [UI React] $($pr.Name)"
            }
        } else {
            Write-Host "  (Nenhum protótipo encontrado)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (Pasta prototypes não encontrada)" -ForegroundColor Gray
    }
    Write-Host ""
}

function New-PRD {
    param([string]$Slug)

    if ([string]::IsNullOrWhiteSpace($Slug)) {
        Write-Host "Erro: Informe o slug da funcionalidade. Ex: .\cli.ps1 new-prd auth-jwt" -ForegroundColor Red
        return
    }

    $templatePath = Join-Path $BaseDir "docs\templates\PRD-template.md"
    if (-not (Test-Path $templatePath)) {
        Write-Host "Erro: Template $templatePath não encontrado." -ForegroundColor Red
        return
    }

    $targetDir = Join-Path (Get-Location) "docs\product"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    $targetFile = Join-Path $targetDir "prd-$Slug.md"
    if (Test-Path $targetFile) {
        Write-Host "Aviso: O arquivo $targetFile já existe." -ForegroundColor Yellow
        return
    }

    $today = (Get-Date).ToString("yyyy-MM-dd")
    $title = (Get-Culture).TextInfo.ToTitleCase($Slug.Replace("-", " "))
    $content = Get-Content -Path $templatePath -Raw -Encoding UTF8
    $content = $content.Replace("[slug-da-feature]", $Slug)
    $content = $content.Replace("[Nome da Funcionalidade / Épico]", $title)
    $content = $content.Replace("YYYY-MM-DD", $today)

    Set-Content -Path $targetFile -Value $content -Encoding UTF8
    Write-Host "Sucesso! PRD criado em: $targetFile" -ForegroundColor Green
    Write-Host "Invoque o Analista de Requisitos para iniciar as perguntas investigativas." -ForegroundColor Cyan
}

function New-US {
    param([string]$Slug)

    if ([string]::IsNullOrWhiteSpace($Slug)) {
        Write-Host "Erro: Informe o slug da história. Ex: .\cli.ps1 new-us login-google" -ForegroundColor Red
        return
    }

    $templatePath = Join-Path $BaseDir "docs\templates\STORY-template.md"
    if (-not (Test-Path $templatePath)) {
        Write-Host "Erro: Template $templatePath não encontrado." -ForegroundColor Red
        return
    }

    $targetDir = Join-Path (Get-Location) "docs\specs"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    $targetFile = Join-Path $targetDir "us-$Slug.md"
    if (Test-Path $targetFile) {
        Write-Host "Aviso: O arquivo $targetFile já existe." -ForegroundColor Yellow
        return
    }

    $today = (Get-Date).ToString("yyyy-MM-dd")
    $title = (Get-Culture).TextInfo.ToTitleCase($Slug.Replace("-", " "))
    $content = Get-Content -Path $templatePath -Raw -Encoding UTF8
    $content = $content.Replace("[slug-da-funcionalidade]", $Slug)
    $content = $content.Replace("[Título da Funcionalidade / Épico]", $title)
    $content = $content.Replace("YYYY-MM-DD", $today)

    Set-Content -Path $targetFile -Value $content -Encoding UTF8
    Write-Host "Sucesso! Especificação de US criada em: $targetFile" -ForegroundColor Green
    Write-Host "Invoque o Product Owner para refinar os critérios BDD e contratos." -ForegroundColor Cyan
}

function New-Bug {
    param([string]$Slug)

    if ([string]::IsNullOrWhiteSpace($Slug)) {
        Write-Host "Erro: Informe o slug do bug. Ex: .\cli.ps1 new-bug erro-500-token" -ForegroundColor Red
        return
    }

    $templatePath = Join-Path $BaseDir "docs\templates\BUG-template.md"
    if (-not (Test-Path $templatePath)) {
        Write-Host "Erro: Template $templatePath não encontrado." -ForegroundColor Red
        return
    }

    $targetDir = Join-Path (Get-Location) "docs\specs"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    $targetFile = Join-Path $targetDir "bug-$Slug.md"
    if (Test-Path $targetFile) {
        Write-Host "Aviso: O arquivo $targetFile já existe." -ForegroundColor Yellow
        return
    }

    $today = (Get-Date).ToString("yyyy-MM-dd")
    $title = (Get-Culture).TextInfo.ToTitleCase($Slug.Replace("-", " "))
    $content = Get-Content -Path $templatePath -Raw -Encoding UTF8
    $content = $content.Replace("[slug-do-problema]", $Slug)
    $content = $content.Replace("[Resumo Claro do Erro]", $title)
    $content = $content.Replace("YYYY-MM-DD", $today)

    Set-Content -Path $targetFile -Value $content -Encoding UTF8
    Write-Host "Sucesso! Especificação de Bug criada em: $targetFile" -ForegroundColor Green
    Write-Host "Invoque a skill de diagnóstico ou o Developer para o ciclo TDD Red/Green." -ForegroundColor Cyan
}

function New-ADR {
    param([string]$Slug)

    if ([string]::IsNullOrWhiteSpace($Slug)) {
        Write-Host "Erro: Informe o slug da decisão. Ex: .\cli.ps1 new-adr adocao-fastapi" -ForegroundColor Red
        return
    }

    $templatePath = Join-Path $BaseDir "docs\templates\ADR-template.md"
    if (-not (Test-Path $templatePath)) {
        Write-Host "Erro: Template $templatePath não encontrado." -ForegroundColor Red
        return
    }

    $targetDir = Join-Path (Get-Location) "docs\architecture"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    $existing = Get-ChildItem -Path $targetDir -Filter "adr-*.md"
    $nums = @()
    foreach ($f in $existing) {
        if ($f.Name -match "^adr-(\d+)-") {
            $nums += [int]$matches[1]
        }
    }
    $nextNum = if ($nums.Count -gt 0) { ($nums | Measure-Object -Maximum).Maximum + 1 } else { 1 }
    $numStr = "{0:D3}" -f $nextNum

    $targetFile = Join-Path $targetDir "adr-$numStr-$Slug.md"
    if (Test-Path $targetFile) {
        Write-Host "Aviso: O arquivo $targetFile já existe." -ForegroundColor Yellow
        return
    }

    $today = (Get-Date).ToString("yyyy-MM-dd")
    $title = (Get-Culture).TextInfo.ToTitleCase($Slug.Replace("-", " "))
    $content = Get-Content -Path $templatePath -Raw -Encoding UTF8
    $content = $content.Replace("[001]", $numStr)
    $content = $content.Replace("[slug-da-decisao]", $Slug)
    $content = $content.Replace("[Título da Decisão Técnica]", $title)
    $content = $content.Replace("YYYY-MM-DD", $today)

    Set-Content -Path $targetFile -Value $content -Encoding UTF8
    Write-Host "Sucesso! Registro de ADR criado em: $targetFile" -ForegroundColor Green
    Write-Host "Preencha a matriz de alternativas com prós/contras e valide com o time." -ForegroundColor Cyan
}

function New-Proto {
    param([string]$Slug)

    if ([string]::IsNullOrWhiteSpace($Slug)) {
        Write-Host "Erro: Informe o slug do protótipo. Ex: .\cli.ps1 new-proto checkout-fluxo" -ForegroundColor Red
        return
    }

    $targetDir = Join-Path (Get-Location) "docs\prototypes\$Slug"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    $title = (Get-Culture).TextInfo.ToTitleCase($Slug.Replace("-", " "))
    $today = (Get-Date).ToString("yyyy-MM-dd")

    $readmeContent = @"
# Protótipo Interativo: $title

Especificação executável de interface construída pelo DevTeam em React + Tailwind CSS.

- **Data de Criação:** $today
- **Como Visualizar:** Abra o arquivo `index.html` em qualquer navegador web moderno.
- **Finalidade:** Servir como referência de layout, fluxos de interação e estados visuais para o time de desenvolvimento.

## Estados Demonstrados no Protótipo:
1. **Padrão / Inicial:** Estado da tela com dados mockados.
2. **Carregando (Loading):** Feedback visual assíncrono.
3. **Erro de Validação:** Alertas visuais e campos destacados.
4. **Sucesso:** Conclusão da ação.
"@
    Set-Content -Path (Join-Path $targetDir "README.md") -Value $readmeContent -Encoding UTF8

    $htmlContent = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Protótipo: $title</title>
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
    const { useState } = React;

    function App() {
      const [viewState, setViewState] = useState('default');

      return (
        <div className="max-w-2xl mx-auto py-10 px-4">
          <header className="mb-8 border-b pb-4 flex justify-between items-center">
            <div>
              <span className="text-xs uppercase tracking-wider font-semibold text-blue-600 bg-blue-50 px-2 py-1 rounded">DevTeam Protótipo UI</span>
              <h1 className="text-2xl font-bold mt-2 text-slate-900">$title</h1>
            </div>
            
            <div className="flex gap-1 bg-slate-200 p-1 rounded-lg text-xs font-medium">
              <button 
                onClick={() => setViewState('default')}
                className={``px-2.5 py-1 rounded `${viewState === 'default' ? 'bg-white shadow text-slate-900' : 'text-slate-600'}``}>
                Padrão
              </button>
              <button 
                onClick={() => setViewState('loading')}
                className={``px-2.5 py-1 rounded `${viewState === 'loading' ? 'bg-white shadow text-slate-900' : 'text-slate-600'}``}>
                Carregando
              </button>
              <button 
                onClick={() => setViewState('error')}
                className={``px-2.5 py-1 rounded `${viewState === 'error' ? 'bg-white shadow text-red-600' : 'text-slate-600'}``}>
                Erro
              </button>
              <button 
                onClick={() => setViewState('success')}
                className={``px-2.5 py-1 rounded `${viewState === 'success' ? 'bg-white shadow text-emerald-600' : 'text-slate-600'}``}>
                Sucesso
              </button>
            </div>
          </header>

          <main className="bg-white p-6 rounded-xl shadow-sm border border-slate-200">
            {viewState === 'loading' && (
              <div className="space-y-4 animate-pulse">
                <div className="h-6 bg-slate-200 rounded w-1/3"></div>
                <div className="h-10 bg-slate-100 rounded w-full"></div>
                <div className="h-10 bg-slate-100 rounded w-full"></div>
                <div className="h-10 bg-blue-200 rounded w-1/4"></div>
              </div>
            )}

            {viewState === 'error' && (
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
            )}

            {viewState === 'success' && (
              <div className="text-center py-8">
                <div className="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-3 text-xl font-bold">✓</div>
                <h2 className="text-lg font-bold text-slate-900">Operação Concluída com Sucesso!</h2>
                <p className="text-sm text-slate-600 mt-1">O fluxo foi executado e os dados foram processados atomicamente.</p>
                <button onClick={() => setViewState('default')} className="mt-4 px-4 py-2 bg-slate-800 text-white text-sm font-medium rounded-lg hover:bg-slate-900">Reiniciar Demonstração</button>
              </div>
            )}

            {viewState === 'default' && (
              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">Entrada de Dados (Mock)</label>
                  <input type="text" placeholder="Digite uma informação..." className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>
                <button onClick={() => setViewState('success')} className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">
                  Confirmar Ação
                </button>
              </div>
            )}
          </main>
        </div>
      );
    }

    ReactDOM.createRoot(document.getElementById('root')).render(<App />);
  </script>
</body>
</html>
"@
    Set-Content -Path (Join-Path $targetDir "index.html") -Value $htmlContent -Encoding UTF8

    Write-Host "Sucesso! Protótipo interativo React criado em: $targetDir" -ForegroundColor Green
    Write-Host "  + index.html (Abra no navegador para testar)" -ForegroundColor Cyan
    Write-Host "  + README.md" -ForegroundColor Cyan
}

function Init-Repo {
    param([string]$TargetPathStr)

    if ([string]::IsNullOrWhiteSpace($TargetPathStr)) {
        $targetPath = (Get-Location).Path
    } else {
        if (-not (Test-Path $TargetPathStr)) {
            New-Item -ItemType Directory -Path $TargetPathStr -Force | Out-Null
        }
        $targetPath = (Resolve-Path $TargetPathStr).Path
    }
    Write-Host "Inicializando governança Docs-as-Code do DevTeam em: $targetPath" -ForegroundColor Cyan

    New-Item -ItemType Directory -Path (Join-Path $targetPath "docs\product") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $targetPath "docs\specs") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $targetPath "docs\architecture") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $targetPath "docs\prototypes") -Force | Out-Null

    $agentsFile = Join-Path $targetPath "AGENTS.md"
    if (-not (Test-Path $agentsFile)) {
        $blueprintAgents = Join-Path $BaseDir "templates\repo-blueprint\AGENTS.md"
        if (Test-Path $blueprintAgents) {
            Copy-Item -Path $blueprintAgents -Destination $agentsFile
        } else {
            Set-Content -Path $agentsFile -Value "# AGENTS.md`nGuia de contexto e comandos para agentes de IA.`n" -Encoding UTF8
        }
        Write-Host "  + Criado $agentsFile (Guia Mestre de IA)" -ForegroundColor Green
    } else {
        Write-Host "  (AGENTS.md já existe em $targetPath)" -ForegroundColor Gray
    }

    Write-Host "`nRepositório pronto para ser atendido pelo DevTeam!" -ForegroundColor Green
    Write-Host "Pastas criadas: docs/product, docs/specs, docs/architecture, docs/prototypes" -ForegroundColor Cyan
}

function Show-Models {
    $configFile = Join-Path $BaseDir "config\model_router.json"
    if (-not (Test-Path $configFile)) {
        Write-Host "Erro: Arquivo config\model_router.json não encontrado." -ForegroundColor Red
        return
    }

    $json = Get-Content -Path $configFile -Raw -Encoding UTF8 | ConvertFrom-Json
    Write-Host "`n--- Matriz de Modelos LLM (Custo-Benefício & Roteamento) ---" -ForegroundColor Yellow

    foreach ($prop in $json.roles.PSObject.Properties) {
        $role = $prop.Value
        Write-Host "`n[Papel: $($role.name)]" -ForegroundColor Cyan
        Write-Host "  * Modelo Padrão: $($role.default_model)" -ForegroundColor Green
        Write-Host "  * Justificativa: $($role.rationale)"
        if ($role.dynamic_escalation) {
            Write-Host "  * Escalação Dinâmica: $($role.dynamic_escalation.escalated_model) quando $($role.dynamic_escalation.condition)" -ForegroundColor Magenta
        }
    }
    Write-Host ""
}

switch ($Command.ToLower()) {
    "status"        { Show-Status }
    "new-prd"       { New-PRD -Slug $Arg1 }
    "new-us"        { New-US -Slug $Arg1 }
    "new-story"     { New-US -Slug $Arg1 }
    "new-bug"       { New-Bug -Slug $Arg1 }
    "new-adr"       { New-ADR -Slug $Arg1 }
    "new-proto"     { New-Proto -Slug $Arg1 }
    "new-prototype" { New-Proto -Slug $Arg1 }
    "init-repo"     { Init-Repo -TargetPathStr $Arg1 }
    "models"        { Show-Models }
    default         { Show-Help }
}
