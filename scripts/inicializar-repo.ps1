<#
    inicializar-repo.ps1
    Primer commit del repositorio Marca Personal, con los chequeos que
    evitan los dos accidentes conocidos:
      - quedar dentro de otro repositorio (el .git suelto de C:\Users\rootless)
      - hacer git add -A sobre un directorio equivocado

    Uso:
      cd <carpeta del repo>
      .\scripts\inicializar-repo.ps1 -Simular      # no toca nada, informa
      .\scripts\inicializar-repo.ps1               # inicializa y commitea
#>

param(
    [switch]$Simular,
    [string]$Remoto = ""
)

$ErrorActionPreference = "Stop"
$raiz = Split-Path -Parent $PSScriptRoot

Write-Host ""
Write-Host "Repositorio: $raiz" -ForegroundColor Cyan
Write-Host ""

# ── 1. ¿Estamos dentro de otro repositorio? ────────────────────────────
Push-Location $raiz
$repoPadre = $null
try {
    $repoPadre = (git rev-parse --show-toplevel 2>$null)
} catch { }

if ($repoPadre) {
    $repoPadreNorm = (Resolve-Path $repoPadre).Path.TrimEnd('\')
    $raizNorm      = (Resolve-Path $raiz).Path.TrimEnd('\')
    if ($repoPadreNorm -ne $raizNorm) {
        Pop-Location
        Write-Host "DETENIDO." -ForegroundColor Red
        Write-Host "Esta carpeta esta dentro de otro repositorio git:" -ForegroundColor Red
        Write-Host "  $repoPadreNorm"
        Write-Host ""
        Write-Host "Si es el .git suelto del home, neutralizalo primero:"
        Write-Host "  Rename-Item $repoPadreNorm\.git .git-desactivado"
        Write-Host "  Test-Path $repoPadreNorm\.git   # tiene que dar False"
        exit 1
    }
    Write-Host "Ya existe un repositorio en esta misma carpeta." -ForegroundColor Yellow
} else {
    Write-Host "OK: la carpeta no esta dentro de ningun repositorio." -ForegroundColor Green
}

# ── 2. Inventario previo ───────────────────────────────────────────────
$archivos = Get-ChildItem -Path $raiz -Recurse -File |
            Where-Object { $_.FullName -notmatch '\\\.git\\' }
$total = $archivos.Count
$peso  = [math]::Round(($archivos | Measure-Object Length -Sum).Sum / 1MB, 2)

Write-Host ""
Write-Host "Se van a versionar $total archivos ($peso MB)." -ForegroundColor Cyan
$archivos | Group-Object { $_.Directory.Name } |
    Sort-Object Count -Descending |
    Select-Object -First 10 |
    ForEach-Object { Write-Host ("  {0,-28} {1,4}" -f $_.Name, $_.Count) }

# ── 3. Salida en modo simulacion ───────────────────────────────────────
if ($Simular) {
    Write-Host ""
    Write-Host "MODO SIMULACION: no se ejecuto ningun comando git." -ForegroundColor Yellow
    Write-Host "Si el numero de arriba es el esperado, volve a correr sin -Simular."
    Pop-Location
    exit 0
}

# ── 4. Init, add, commit ───────────────────────────────────────────────
if (-not $repoPadre) {
    git init -b main | Out-Null
    Write-Host ""
    Write-Host "git init -b main" -ForegroundColor Green
}

git add -A
$staged = (git diff --cached --name-only | Measure-Object -Line).Lines
Write-Host "Staged: $staged archivos" -ForegroundColor Green

if ($staged -ne $total) {
    Write-Host ""
    Write-Host "AVISO: se esperaban $total archivos y se staged $staged." -ForegroundColor Yellow
    Write-Host "Revisa .gitignore antes de commitear. Nada se commiteo todavia."
    Pop-Location
    exit 1
}

git commit -m "Sistema de agentes de marca personal: hub de 27 modulos, 13 skills y documentacion" | Out-Null
Write-Host "Commit hecho." -ForegroundColor Green

# ── 5. Remoto opcional ─────────────────────────────────────────────────
if ($Remoto) {
    git remote add origin $Remoto
    git push -u origin main
    Write-Host "Push a $Remoto" -ForegroundColor Green
    Write-Host ""
    Write-Host "Verifica contra el remoto, no contra este mensaje:" -ForegroundColor Yellow
    Write-Host "  git ls-remote --heads origin"
} else {
    Write-Host ""
    Write-Host "Falta el remoto. Crea el repositorio PRIVADO en GitHub y despues:" -ForegroundColor Cyan
    Write-Host "  git remote add origin https://github.com/ValeriaYashan/marca-personal-agentes.git"
    Write-Host "  git push -u origin main"
}

Pop-Location
Write-Host ""
