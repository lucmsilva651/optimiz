@echo off

rmdir /s /q %temp%
mkdir %localappdata%\Temp
wsreset
taskkill /f /im WinStore.App.exe
ipconfig/flushDNS
sc stop SysMain
sc config SysMain start=disabled
sc stop WSearch
sc config WSearch start=disabled
sc stop WerSvc
sc config WerSvc start=disabled
reg import tweaks\tweaks.reg
cls

wscript tweaks\ftweaks.vbs
cmd /k tweaks\ltweaks.cmd