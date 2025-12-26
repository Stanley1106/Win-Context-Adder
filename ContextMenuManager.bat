@echo off
setlocal EnableDelayedExpansion
title Context Menu Manager

:: Check Administrator Privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Error: Please run as Administrator.
    pause
    exit
)

:MainLoop
cls
echo =======================================================
echo    Context Menu Manager (Ctrl+C to Exit)
echo =======================================================
echo.

:: 1. Input Path
set "ToolPath="
set /p "ToolPath=Enter the full path of the .exe: "

if "%ToolPath%"=="" goto :MainLoop
set "ToolPath=%ToolPath:"=%"

if not exist "%ToolPath%" (
    echo [!] Error: File not found.
    pause
    goto :MainLoop
)

:: 2. Input Name
set "MenuName="
echo.
set /p "MenuName=Enter the Name to display in menu: "

if "%MenuName%"=="" goto :MainLoop

:: 3. Registry Operations
echo.
echo [+] Registering "%MenuName%"...

reg add "HKEY_CLASSES_ROOT\*\shell\%MenuName%" /ve /d "%MenuName%" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\%MenuName%" /v "Icon" /d "\"%ToolPath%\"" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\%MenuName%\command" /ve /d "\"%ToolPath%\" \"%%1\"" /f >nul

echo [OK] Successfully added.
echo.
echo Press any key to add another tool...
pause >nul
goto :MainLoop
