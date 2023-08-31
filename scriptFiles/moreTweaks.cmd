echo [optimiz] Cleaning temporary files...
rmdir /s /q %temp%
mkdir %localappdata%\Temp
cls

echo [optimiz] Flushing DNS...
ipconfig/flushDNS
cls

echo [optimiz] Resetting Windows Store...
wsreset
taskkill /f /im WinStore.App.exe
cls

cd regFiles
echo [optimiz] Now disabling the Lock Screen...
reg import NoLock.reg
cls

echo [optimiz] Disabling Web Search Suggestions on Search Bar...
reg import DisableWebSearch.reg
cls

echo [optimiz] Restoring the classic Alt+Tab style...
reg import ClassicAltTab.reg
cls

echo [optimiz] Disabling Live Tiles...
reg import NoTileApp.reg
cls

echo [optimiz] Disabling Telemetry...
reg import DisableTelemetry.reg
sc config DiagTrack start= disabledsc config dmwappushservice start= disabled
cls

cd ..
optimizShell