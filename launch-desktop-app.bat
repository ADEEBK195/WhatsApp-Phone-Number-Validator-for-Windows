@echo off
title OutGrow WhatsApp Validator (Desktop App)
cd /d "%~dp0"

if exist "dist\win-unpacked\OutGrow WhatsApp Validator.exe" (
    echo Launching OutGrow WhatsApp Validator Desktop Application...
    start "" "dist\win-unpacked\OutGrow WhatsApp Validator.exe"
    exit /b 0
)

echo Starting desktop application via Electron...
call npm run app
