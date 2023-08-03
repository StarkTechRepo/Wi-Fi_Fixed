@echo off
title - https://github.com/OtaconEvil

REM -- Activar el Wi-Fi --
echo Habilitando el Wi-Fi...
for /F "tokens=2 delims=: " %%G in ('netsh wlan show interface ^| findstr /C:"Nombre de la interfaz"') do set "nombre_adaptador=%%G"
netsh interface set interface "%nombre_adaptador%" admin=enabled
echo Wi-Fi activado correctamente.
pause
