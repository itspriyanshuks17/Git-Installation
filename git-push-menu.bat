@echo off
setlocal EnableDelayedExpansion

:main
cls
echo ===============================
echo   Git Commit & Push Menu
echo ===============================

git status --short

:: Get list of changed files
set i=0
for /f "delims=" %%f in ('git status --porcelain') do (
    set /a i+=1
    set "file[!i!]=%%f"
)

if %i%==0 (
    echo No changes to commit.
    pause
    exit /b
)

echo.

echo Select file(s) to commit (separate numbers with space or comma):
for /l %%j in (1,1,%i%) do (
    set "line=!file[%%j]!"
    set "line=!line:~3!"
    echo   %%j. !line!
)
echo   0. Exit

set /p choice=Enter your choice(s): 
if "%choice%"=="0" exit /b
if "%choice%"=="" goto main

:: Replace commas with spaces
set "choice=%choice:,= %"

:: Validate all choices and build list of selected files
set "selected_files="
for %%n in (%choice%) do (
    set valid=1
    set /a idx=%%n
    if !idx! lss 1 if !idx! gtr %i% set valid=0
    if !valid!==0 (
        echo Invalid selection: %%n
        pause
        goto main
    )
    set "line=!file[!idx!]!"
    set "filename=!line:~3!"
    if not exist "!filename!" (
        echo Invalid file: !filename!
        pause
        goto main
    )
    set "selected_files=!selected_files! "!filename!""
)

echo.
set /p msg=Enter commit message: 
if "%msg%"=="" set msg=update !selected_files!

git add !selected_files!
git commit -m "%msg%"

echo.

set /p pushnow=Push to GitHub now? (y/n): 
if /i "%pushnow%"=="y" (
    for /f "delims=" %%b in ('git rev-parse --abbrev-ref HEAD') do set "current_branch=%%b"
    set /p branch=Enter branch to push to [!current_branch!]: 
    if "!branch!"=="" set "branch=!current_branch!"
    git push origin !branch!
)

echo.
echo Commit complete. Press any key to continue...
pause
goto main
