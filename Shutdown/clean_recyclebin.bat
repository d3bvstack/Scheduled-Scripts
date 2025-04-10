@echo off

REM ========================================================
REM Script: clean_recyclebin.bat
REM Description: This script permanently empties the Recycle Bin on multiple drives.
REM              It is designed to be run as a scheduled task during shutdown to
REM              free up disk space by removing deleted files.
REM
REM WARNING: This script permanently removes all files in the Recycle Bin without
REM          any chance of recovery. Make sure you don't need any files from
REM          the Recycle Bin before running this script.
REM ========================================================

:: Clear the Recycle Bin on C: drive
rd /s /q C:\$Recycle.Bin

:: Additional drives - modify or remove as needed for your system configuration
rd /s /q D:\$Recycle.Bin
rd /s /q E:\$Recycle.Bin
rd /s /q Z:\$Recycle.Bin
