@echo off

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

title Optimiz shell
echo [optimiz] Optimiz, various scripts to optimize Windows
echo [optimiz] ==========================
echo [optimiz] Developed by Lucas Gabriel (lucmsilva)
echo [optimiz] https://github.com/lucmsilva651/optimiz
echo.
timeout /t 5 /nobreak >nul
cd scripts

misc_tweaks