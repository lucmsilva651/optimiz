@echo off

rm /s /q %temp%
md %localappdata%\Temp
wsreset
taskkill /f /im WinStore.App.exe
ipconfig/flushDNS
sc stop WSearch
sc config WSearch start=disabled
sc stop WerSvc
sc config WerSvc start=disabled
reg import RegTweaks.reg
powercfg /import MaxPerfPowerPlan.pow
IF EXIST "OOSU10.exe" (
oosu10.exe ooshutup10.cfg
) ELSE (
byte https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe
oosu10.exe ooshutup10.cfg
)

cls

echo [OptimizLog] >> %systemdrive%\OptimizLog.inf
echo %date% %time% >> %systemdrive%\OptimizLog.inf
echo. >> %systemdrive%\OptimizLog.inf
echo Made by Lucas Gabriel (lucmsilva) >> %systemdrive%\OptimizLog.inf
echo https://www.eleu.me / https://github.com/lucmsilva651 >> %systemdrive%\OptimizLog.inf
echo. >> %systemdrive%\OptimizLog.inf
exit \b