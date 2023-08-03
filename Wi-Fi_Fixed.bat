@echo off
title - https://github.com/OtaconEvil

REM -- Fixeando problemas de Wi-Fi --
echo.
echo === Deshabilitando adaptadores de red ===
echo.
wmic path win32_networkadapter where "NetConnectionID Like 'Wi-Fi%' AND NetEnabled='True'" call disable
timeout /t 3 >nul

echo.
echo === Habilitando adaptadores de red ===
echo.
wmic path win32_networkadapter where "NetConnectionID Like 'Wi-Fi%' AND NetEnabled='False'" call enable
timeout /t 3 >nul

echo.
echo === Reiniciando servicios y tareas programadas ===
echo.
sc config LanmanWorkstation start= demand
sc config WdiServiceHost start= demand
sc config NcbService start= demand
sc config ndu start= demand
sc config Netman start= demand
sc config netprofm start= demand
sc config Dhcp start= auto
sc config DPS start= auto
sc config lmhosts start= auto
sc config NlaSvc start= auto
sc config nsi start= auto
sc config RmSvc start= auto
sc config Wcmsvc start= auto
sc config Winmgmt start= auto
sc config WlanSvc start= auto

schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Enable
schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Enable
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Enable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Enable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Enable

echo.
echo === Restableciendo configuraciones y registros ===
echo.
reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f

wmic path win32_networkadapter where index=0 call enable
wmic path win32_networkadapter where index=1 call enable
wmic path win32_networkadapter where index=2 call enable
wmic path win32_networkadapter where index=3 call enable
wmic path win32_networkadapter where index=4 call enable
wmic path win32_networkadapter where index=5 call enable

echo.
echo === Limpiando cachés y tablas ARP ===
echo.
arp -d *
timeout /t 2 >nul
route -f
timeout /t 2 >nul
nbtstat -R
timeout /t 2 >nul
nbtstat -RR
timeout /t 2 >nul

echo.
echo === Reseteando configuraciones de red ===
echo.
netcfg -d
netsh winsock reset
netsh int 6to4 reset all
netsh int httpstunnel reset all
netsh int ip reset
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all
netsh branchcache reset

echo.
echo === Renovando dirección IP ===
echo.
ipconfig /release
timeout /t 2 >nul
ipconfig /renew

echo.
echo Fixeo de Wi-Fi completado. ¡Disfruta de una conexión estable!
pause
