@echo off
REM Actualizar el adaptador de red Ethernet
echo Actualizando el adaptador de red Ethernet...
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Ethernet" admin=enable
echo El adaptador de red Ethernet ha sido actualizado.

REM Desactivar el adaptador de Wi-Fi
echo Desactivando el adaptador de Wi-Fi...
netsh interface set interface "Wi-Fi" admin=disable
echo El adaptador de Wi-Fi ha sido desactivado.

REM Mostrar mensaje atractivo
echo.
echo *** ¡Proceso completado con éxito! ***
echo Ahora estás utilizando la conexión Ethernet.
pause
exit
