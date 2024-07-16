@echo off
setlocal enabledelayedexpansion

if "%~1" == "" (
    echo Usage: %0 [repo-id] [repo-name] [demo-link]
    exit /b 1
)

set "repo-id=%~1"
set "repo-name=%~2"
set "demo-link=%~3"

copy TEMPLATE.md README.md

if not exist README.md (
    echo Error: README.md not found
    exit /b 1
)

set "tempFile=tempReadme.md"

(for /f "tokens=*" %%i in (README.md) do (
    set "line=%%i"
    set "line=!line:[repo-id]=%repo-id%!"
    set "line=!line:[repo-name]=%repo-name%!"
    set "line=!line:[demo-link]=%demo-link%!"
    echo !line!
)) > %tempFile%

move /y %tempFile% README.md
