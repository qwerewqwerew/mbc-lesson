@echo off
setlocal enabledelayedexpansion
title Gemini CLI Launcher

echo ========================================
echo        Gemini CLI Launcher
echo ========================================
echo.

:: Check if an argument was passed (e.g., drag and drop)
if not "%~1"=="" (
    if exist "%~1\*" (
        set "TARGET_PATH=%~1"
        goto :Launch
    ) else (
        echo [Error] The provided path is not a valid directory: "%~1"
        pause
        exit /b 1
    )
)

:: Interactive mode
set "TARGET_PATH=%CD%"
echo You can type or paste a specific directory path.
echo Press [Enter] without typing anything to use the current folder:
echo %CD%
echo.
set /p "USER_PATH=Path: "

if not "!USER_PATH!"=="" (
    :: Remove quotes if user added them
    set "USER_PATH=!USER_PATH:"=!"
    set "TARGET_PATH=!USER_PATH!"
)

if not exist "!TARGET_PATH!\*" (
    echo [Error] The directory does not exist: "!TARGET_PATH!"
    pause
    exit /b 1
)

:Launch
echo.
echo Launching Gemini CLI in: !TARGET_PATH!
cd /d "!TARGET_PATH!"
call gemini
if errorlevel 1 (
    echo.
    echo [Warning] Gemini CLI exited with an error code.
    pause
)
