$cachePath = Join-Path $PSScriptRoot "..\.cache\standards"
$lockFile = Join-Path $cachePath ".pull_lock"

$shouldPull = $true
if (Test-Path $lockFile) {
    $lastPull = (Get-Item $lockFile).LastWriteTime
    if ($lastPull -gt (Get-Date).AddMinutes(-30)) {
        $shouldPull = $false
    }
}

if ($shouldPull) {
    Set-Content -Path $lockFile -Value (Get-Date) -Force
    Push-Location $cachePath
    git fetch origin main -q
    git reset --hard origin/main -q
    git clean -fd -q
    Pop-Location
}
