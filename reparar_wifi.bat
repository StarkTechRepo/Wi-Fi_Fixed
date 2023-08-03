@echo off
title - https://github.com/OtaconEvil

REM -- Reparar problemas de Wi-Fi --
echo Reparando problemas de Wi-Fi...
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo Problemas de Wi-Fi reparados correctamente.
pause
