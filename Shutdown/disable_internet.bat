@echo off

REM ========================================================
REM Script: disable_internet.bat
REM Description: This script disables the Ethernet network interface.
REM              It is designed to be run as a scheduled task during shutdown.
REM
REM Note: This script assumes the network interface is named "Ethernet".
REM       Modify the interface name if your system uses a different name.
REM ========================================================

:: Disable Ethernet
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Wi-Fi" admin=disable
