@echo off

title ydl-cli updater

if "%1"=="" (
    echo [ydl-cli updater] Use: %0 ^<URL^>
    exit /b 1
)

set "url=%1"
for %%I in (%url%) do set "filename=%%~nxI"

certutil -urlcache -split -f "%url%" "%filename%" > nul

if %errorlevel% equ 0 (
    echo.
    echo [ydl-cli updater] Download complete: %filename%
    echo [ydl-cli updater] Press any key to exit.
    pause >nul
) else (
    echo [ydl-cli updater] Download failed (we don't know why)
)