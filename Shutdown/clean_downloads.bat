@echo off

REM ========================================================
REM Script: clean_downloads.bat
REM Description: This script removes all files and folders from the user's
REM              Downloads folder. It is designed to be run as a scheduled
REM              task during shutdown to free up disk space.
REM
REM WARNING: This script will permanently delete ALL files and folders from the
REM          Downloads folder without prompting or creating backups. Make sure
REM          you have moved any important files before running this script.
REM ========================================================

:: Specify the path to the Downloads folder.
set DOWNLOADS_PATH=%USERPROFILE%\Downloads

:: Delete all files in the Downloads folder.
del /q "%DOWNLOADS_PATH%\*"

:: Delete all subfolders in the Downloads folder.
for /d %%i in ("%DOWNLOADS_PATH%\*") do rd /s /q "%%i"