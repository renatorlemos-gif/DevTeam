<#
.SYNOPSIS
    DevTeam CLI - Utilitário PowerShell para Gestão de Demanda e Repositórios
.DESCRIPTION
    Permite inspecionar artefatos, criar rascunhos de PRD, inicializar novos projetos e consultar a matriz de modelos LLM.
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
    Write-Host "  .\cli.ps1 status                  Inspeciona PRDs e Histórias ativas"
    Write-Host "  .\cli.ps1 new-prd <feature_name>  Cria um rascunho PRD v0.1 a partir do template"
    Write-Host "  .\cli.ps1 init-repo [caminho]     Inicializa a estrutura em um repositório alvo"
    Write-Host "  .\cli.ps1 models                  Exibe a matriz de LLMs e custo-benefício"
    Write-Host "  .\cli.ps1 help                    Exibe esta ajuda"
    Write-Host "============================================================" -ForegroundColor Cyan
}

function Show-Status {
    $docsDir = Join-Path (Get-Location) "docs"
    if (-not (Test-Path $docsDir)) {
        $docsDir = Join-Path $BaseDir "docs"
    }

    $prdsDir = Join-Path $docsDir "prds"
    $storiesDir = Join-Path $docsDir "stories"

    Write-Host "`n--- Status dos Artefatos do DevTeam ---" -ForegroundColor Yellow
    Write-Host "Diretório base: $docsDir`n"

    Write-Host "[PRDs de Requisitos]:" -ForegroundColor Green
    if (Test-Path $prdsDir) {
        $prds = Get-ChildItem -Path $prdsDir -Filter "*.md" | Where-Object { $_.Name -notlike ".*" }
        if ($prds) {
            foreach ($p in $prds) {
                Write-Host "  * $($p.Name)"
            }
        } else {
            Write-Host "  (Nenhum PRD encontrado)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (Pasta prds não encontrada)" -ForegroundColor Gray
    }

    Write-Host "`n[Histórias de Usuário / BDD]:" -ForegroundColor Green
    if (Test-Path $storiesDir) {
        $stories = Get-ChildItem -Path $storiesDir -Filter "*.md" | Where-Object { $_.Name -notlike ".*" }
        if ($stories) {
            foreach ($s in $stories) {
                Write-Host "  * $($s.Name)"
            }
        } else {
            Write-Host "  (Nenhuma história encontrada)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (Pasta stories não encontrada)" -ForegroundColor Gray
    }
    Write-Host ""
}

function New-PRD {
    param([string]$FeatureName)

    if ([string]::IsNullOrWhiteSpace($FeatureName)) {
        Write-Host "Erro: Informe o nome da funcionalidade. Ex: .\cli.ps1 new-prd auth-jwt" -ForegroundColor Red
        return
    }

    $templatePath = Join-Path $BaseDir "docs\templates\PRD-template.md"
    if (-not (Test-Path $templatePath)) {
        Write-Host "Erro: Template $templatePath não encontrado." -ForegroundColor Red
        return
    }

    $targetDir = Join-Path (Get-Location) "docs\prds"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    $targetFile = Join-Path $targetDir "PRD-v0.1-$FeatureName.md"
    if (Test-Path $targetFile) {
        Write-Host "Aviso: O arquivo $targetFile já existe." -ForegroundColor Yellow
        return
    }

    $content = Get-Content -Path $templatePath -Raw -Encoding UTF8
    $content = $content.Replace("[Nome da Funcionalidade / Épico]", $FeatureName)
    $content = $content.Replace("[v0.1 | v0.2 | v1.0]", "v0.1")
    $content = $content.Replace("[Rascunho | Em Revisão | Aprovado]", "Rascunho")

    Set-Content -Path $targetFile -Value $content -Encoding UTF8
    Write-Host "Sucesso! PRD v0.1 criado em: $targetFile" -ForegroundColor Green
    Write-Host "Agora convoque o Analista de Requisitos para iniciar as perguntas investigativas." -ForegroundColor Cyan
}

function Init-Repo {
    param([string]$TargetPathStr)

    $targetPath = if ([string]::IsNullOrWhiteSpace($TargetPathStr)) { Get-Location } else { Resolve-Path $TargetPathStr }
    Write-Host "Inicializando governança leve do DevTeam em: $targetPath" -ForegroundColor Cyan

    New-Item -ItemType Directory -Path (Join-Path $targetPath "docs\prds") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $targetPath "docs\stories") -Force | Out-Null

    $geminiFile = Join-Path $targetPath "GEMINI.md"
    if (-not (Test-Path $geminiFile)) {
        $geminiContent = @"
# Regras Técnicas do Projeto

Este repositório é desenvolvido com o suporte do time multi-agente **DevTeam**.

## Diretrizes de Engenharia Locais
- **Linguagem / Stack**: [Defina a linguagem e versão, ex: Python 3.12, Node.js 20, Go 1.22]
- **Frameworks**: [Ex: FastAPI, React, Next.js, Django]
- **Banco de Dados**: [Ex: PostgreSQL, SQLite, MongoDB]
- **Padrão de Testes**: [Ex: pytest com cobertura mínima de 80%]
- **Documentação de Negócio**: Salva em `./docs/prds/` e `./docs/stories/`.
"@
        Set-Content -Path $geminiFile -Value $geminiContent -Encoding UTF8
        Write-Host "  + Criado $geminiFile" -ForegroundColor Green
    }

    Write-Host "Repositório pronto para ser atendido pelo DevTeam!" -ForegroundColor Green
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
    "status"    { Show-Status }
    "new-prd"   { New-PRD -FeatureName $Arg1 }
    "init-repo" { Init-Repo -TargetPathStr $Arg1 }
    "models"    { Show-Models }
    default     { Show-Help }
}
