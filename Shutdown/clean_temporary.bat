@echo off

REM ========================================================
REM Script: clean_temporary.bat
REM Description: This script removes all files and folders from the system's
REM              Temp directory. It is designed to be run as a scheduled task
REM              during shutdown to free up disk space and remove temporary files.
REM
REM WARNING: This script deletes all files in the %temp% directory without
REM          creating backups. Make sure no important files are stored there.
REM ========================================================

:: Delete all files in the Temp directory (including subdirectories)
:: /f - Forces deletion of read-only files
:: /s - Deletes files in subdirectories
:: /q - Quiet mode (no confirmation)
del /f /s /q %temp%\*

:: Loop through each subdirectory in the Temp directory and delete it
:: /d - Specifies to loop through directories
:: /s - Deletes subdirectories and files inside
:: /q - Quiet mode (no confirmation)
for /d %%x in (%temp%\*) do rd /s /q "%%x"
