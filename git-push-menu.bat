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
echo Select a file to commit:
for /l %%j in (1,1,%i%) do (
    set "line=!file[%%j]!"
    set "line=!line:~3!"
    echo   %%j. !line!
)
echo   0. Exit

set /p choice=Enter your choice (number): 
if "%choice%"=="0" exit /b
if "%choice%"=="" goto main

set "line=!file[%choice%]!"
set "filename=!line:~3!"
if not exist "!filename!" (
    echo Invalid selection.
    pause
    goto main
)

echo.
set /p msg=Enter commit message: 
if "%msg%"=="" set msg=update !filename!

git add "!filename!"
git commit -m "%msg%"

echo.
set /p pushnow=Push to GitHub now? (y/n): 
if /i "%pushnow%"=="y" git push origin main

echo.
echo Commit complete. Press any key to continue...
pause
goto main
