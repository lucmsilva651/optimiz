@echo off

rmdir /s /q %temp%
mkdir %localappdata%\Temp
cls

rmdir /s /q %SystemDrive%\Temp
rmdir /s /q %SystemRoot%\Temp
cls

wsreset
taskkill /f /im WinStore.App.exe
cls

ipconfig/flushDNS
cls

sc stop WSearch
sc config WSearch start=disabled

sc stop WerSvc
sc config WerSvc start=disabled
cls

reg import RegTweaks.reg
powercfg /import MaxPerfPowerPlan.pow
cls

IF EXIST "dxwebsetup.exe" (
echo It seems that you already have the DirectX setup file. Installing DirectX silently...
dxwebsetup.exe /Q
) ELSE (
echo Downloading and installing DirectX silently...
byte https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe
dxwebsetup /Q
)
cls

IF EXIST "VisualCppRedist_AIO_x86_x64.exe" (
echo It seems that you already have the Visual C++ AIO setup file. Installing Visual C++ AIO silently...
VisualCppRedist_AIO_x86_x64.exe /ai /gm2
) ELSE (
echo Downloading and installing Visual C++ AIO silently...
byte https://github.com/abbodi1406/vcredist/releases/latest/download/VisualCppRedist_AIO_x86_x64.exe
VisualCppRedist_AIO_x86_x64.exe /ai /gm2
)
cls

IF EXIST "NDP481-Web.exe" (
echo It seems that you already have the .NET Framework setup file. Installing .NET Framework silently...
NDP481-Web.exe /q
) ELSE (
echo Downloading and installing .NET Framework silently...
byte https://download.microsoft.com/download/4/b/2/cd00d4ed-ebdd-49ee-8a33-eabc3d1030e3/NDP481-Web.exe
NDP481-Web.exe /q
)
cls

IF EXIST "OOSU10.exe" (
echo Importing O&O ShutUp10++ config file...
oosu10.exe ooshutup10.cfg
) ELSE (
echo Downloading and importing O&O ShutUp10++ config file...
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
