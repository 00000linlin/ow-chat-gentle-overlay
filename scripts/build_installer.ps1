#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $ProjectRoot

$VenvPython = Join-Path $ProjectRoot "venv\Scripts\python.exe"
if (-not (Test-Path $VenvPython)) {
    throw "Project venv not found. Run scripts\setup_venv.bat first."
}

Write-Host "Building the application executable..." -ForegroundColor Cyan
& (Join-Path $ProjectRoot "scripts\build.ps1")
if ($LASTEXITCODE -ne 0) {
    throw "PyInstaller build failed."
}

$Candidates = @(
    (Join-Path $env:LOCALAPPDATA "Programs\Inno Setup 7\ISCC.exe"),
    (Join-Path $env:LOCALAPPDATA "Programs\Inno Setup 6\ISCC.exe"),
    (Join-Path $env:USERPROFILE "AppData\Local\Programs\Inno Setup 7\ISCC.exe"),
    (Join-Path $env:USERPROFILE "AppData\Local\Programs\Inno Setup 6\ISCC.exe"),
    (Join-Path $env:ProgramFiles "Inno Setup 7\ISCC.exe"),
    (Join-Path ${env:ProgramFiles(x86)} "Inno Setup 7\ISCC.exe"),
    (Join-Path $env:ProgramFiles "Inno Setup 6\ISCC.exe"),
    (Join-Path ${env:ProgramFiles(x86)} "Inno Setup 6\ISCC.exe")
)
$Iscc = Get-Command ISCC.exe -ErrorAction SilentlyContinue
if ($Iscc) {
    $Compiler = $Iscc.Source
} else {
    $Compiler = $Candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
}
if (-not $Compiler) {
    throw "Inno Setup 6 or 7 is required. Install it from https://jrsoftware.org/isdl.php, then rerun this script."
}

Write-Host "Compiling the installer with $Compiler..." -ForegroundColor Cyan
& $Compiler (Join-Path $ProjectRoot "installer.iss")
if ($LASTEXITCODE -ne 0) {
    throw "Inno Setup compilation failed."
}

$Installer = Join-Path $ProjectRoot "dist\OW-Chat-Gentle-Overlay-Setup-0.1.1.exe"
Write-Host "Installer created: $Installer" -ForegroundColor Green
