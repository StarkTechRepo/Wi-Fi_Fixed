@echo off
title - https://github.com/OtaconEvil

REM -- Desactivar el Wi-Fi --
echo Deshabilitando el Wi-Fi...
for /F "tokens=2 delims=: " %%G in ('netsh wlan show interface ^| findstr /C:"Nombre de la interfaz"') do set "nombre_adaptador=%%G"
netsh interface set interface "%nombre_adaptador%" admin=disabled
echo Wi-Fi desactivado correctamente.
pause
