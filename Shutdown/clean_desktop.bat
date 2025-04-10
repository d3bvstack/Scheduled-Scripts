@echo off

REM ========================================================
REM Script: clean_desktop.bat
REM Description: This script removes all files and folders from the user's
REM              Desktop folder. It is designed to be run as a scheduled
REM              task during shutdown to maintain a clean desktop environment.
REM
REM WARNING: This script will permanently delete ALL files and folders from the
REM          Desktop folder without prompting or creating backups. Make sure
REM          you have moved any important files before running this script.
REM ========================================================

:: Delete all files on the Desktop
del /f /q "%USERPROFILE%\Desktop\*.*"

:: Delete all folders on the Desktop and their contents
:: /s - Removes all directories and files in the specified directory
:: /q - Quiet mode, doesn't ask if ok to remove a directory tree
for /d %%p in ("%USERPROFILE%\Desktop\*") do rmdir /s /q "%%p"
