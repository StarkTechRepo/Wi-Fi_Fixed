@echo off
title - https://github.com/OtaconEvil

REM -- Configurar la conexión Wi-Fi automáticamente --
echo Configurando la conexión Wi-Fi automáticamente...
for /F "tokens=2 delims=: " %%G in ('netsh wlan show interface ^| findstr /C:"Nombre de la interfaz"') do set "nombre_adaptador=%%G"
netsh wlan set autoconfig enabled=yes interface="%nombre_adaptador%"
echo Conexión Wi-Fi configurada automáticamente.
pause
