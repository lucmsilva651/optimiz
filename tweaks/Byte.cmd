@echo off

if "%~1"=="" (
    echo Byte 3.1.2.0
    echo Usage: %0 ^<URL^>
    exit /b 1
)

set "url=%~1"
for %%I in (%url%) do set "filename=%%~nxI"

echo.
certutil -urlcache -split -f "%url%" "%filename%" > nul

if %errorlevel% equ 0 (
    echo Download completed successfully: "%filename%"
) else (
    echo.
    echo The download of this file failed for an unknown reason.
    echo Make sure the URL starts with the HTTP protocol and the file exists.
    echo.
    echo Press any key to exit.
    pause >nul
)