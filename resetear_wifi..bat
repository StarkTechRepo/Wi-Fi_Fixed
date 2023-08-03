@echo off
REM -- Reiniciar la configuración de la tarjeta Wi-Fi --
echo Reiniciando la configuración de la tarjeta Wi-Fi...
netsh int ip reset resetlog.txt
netsh winsock reset catalog
ipconfig /flushdns
echo Configuración de la tarjeta Wi-Fi reiniciada correctamente.
pause
