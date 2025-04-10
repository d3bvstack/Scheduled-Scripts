@echo off

REM ========================================================
REM Script: bg_history.bat
REM Description: This script deletes the Windows desktop background history
REM              registry entries. It removes records of previously used
REM              wallpapers from the registry to enhance privacy.
REM
REM Note: This script is designed to be run as a scheduled task during logoff.
REM ========================================================

REM Delete registry values in the specified registry path
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath0 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath1 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath2 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath3 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath4 /f

