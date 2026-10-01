@echo off
title OutGrow - WhatsApp Number Validator
cd /d "%~dp0"

echo ===================================================
echo   OutGrow - WhatsApp Number Validator
echo ===================================================

:: Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed on this computer!
    echo Please download and install the free LTS version of Node.js from:
    echo   https://nodejs.org
    echo After installation is complete, double-click this file again.
    echo.
    pause
    exit /b 1
)

:: Check if dependencies are installed
if not exist "node_modules\" (
    echo [SETUP] Installing required dependencies...
    echo This is a one-time setup and takes about 20-30 seconds.
    echo.
    call npm install
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to install dependencies. Please ensure you have internet access.
        pause
        exit /b 1
    )
    echo.
    echo [SETUP] Setup completed successfully!
    echo.
)

echo Starting WhatsApp Number Validator...
echo Opening dashboard at http://localhost:3000 ...

:: Open browser automatically
start "" http://localhost:3000

:: Start Node.js server
node server.js
pause
