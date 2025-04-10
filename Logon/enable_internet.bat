@echo off

REM ========================================================
REM Script: enable_internet.bat
REM Description: This script enables the Ethernet network interface after
REM              detecting that the simplewall.exe process is running.
REM              It is designed to be run as a scheduled task during logon.
REM
REM Note: This script assumes the network interface is named "Ethernet".
REM       Modify the interface name if your system uses a different name.
REM       The script will wait until simplewall.exe is running before enabling
REM       the network connection.
REM ========================================================

:CHECK_PROCESS
tasklist | find /i "simplewall.exe" >nul 2>&1
if errorlevel 1 (
    :: Process not found, wait 2 seconds and check again
    timeout /t 2 >nul
    goto CHECK_PROCESS
) else (
    :: Process found, enable Ethernet
    netsh interface set interface "Ethernet" admin=enable
    echo Ethernet has been enabled.
)
