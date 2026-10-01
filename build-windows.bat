@echo off
title Build OutGrow WhatsApp Validator for Windows
cd /d "%~dp0"

echo ========================================================
echo   Building OutGrow WhatsApp Validator for Windows (x64)
echo ========================================================

if not exist "node_modules\" (
    echo [1/3] Installing npm dependencies...
    call npm install
) else (
    echo [1/3] Dependencies already installed.
)

if not exist "cloudflared.exe" (
    echo [2/3] Downloading cloudflared.exe...
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe' -OutFile 'cloudflared.exe'"
) else (
    echo [2/3] cloudflared.exe found.
)

echo [3/3] Packaging Windows Portable EXE...
call npm run dist:portable

echo.
echo ========================================================
echo   Build Complete!
echo   Output: dist\OutGrow_WhatsApp_Validator_Portable.exe
echo ========================================================
pause
