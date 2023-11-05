Option Explicit
Dim objShell, intResponse
Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "powershell (New-Object Media.SoundPlayer '%SystemRoot%\Media\Windows Notify Calendar.wav').PlaySync();", 0, True
intResponse = MsgBox("Algumas configurações de serviços e entradas do registro foram atualizadas. Nenhuma alteração será aplicada até que você reinicie o seu computador. Deseja reiniciar o computador agora?", vbYesNo, "Atualização de configuração")
If intResponse = vbYes Then
    objShell.Run "shutdown -r -t 0", 0, True
Else
Set objShell = CreateObject("WScript.Shell")
    MsgBox "O script foi encerrado com sucesso. ", vbInformation, "Script Encerrado"
End If
Set objShell = Nothing
