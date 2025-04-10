@echo off
setlocal

REM ========================================================
REM Script: admin_create_symlinks.bat
REM Description: This administrative script creates symbolic links in the Windows
REM              Group Policy script folders to the scripts in this repository.
REM              This allows the scripts to run at their designated events
REM              (logon, logoff, startup, shutdown) through Group Policy.
REM
REM Requirements:
REM   - Must be run as Administrator
REM   - Windows Group Policy must be configured to execute scripts
REM
REM Usage: Right-click and select "Run as administrator"
REM ========================================================

:: Define the root directory where the script is executed
set ROOT_DIR=%~dp0

:: Define the target directories for each category
set LOGOFF_DIR=C:\Windows\System32\GroupPolicy\User\Scripts\Logoff
set LOGON_DIR=C:\Windows\System32\GroupPolicy\User\Scripts\Logon
set SHUTDOWN_DIR=C:\Windows\System32\GroupPolicy\Machine\Scripts\Shutdown
set STARTUP_DIR=C:\Windows\System32\GroupPolicy\Machine\Scripts\Startup

:: Ensure the target directories exist
if not exist "%LOGOFF_DIR%" mkdir "%LOGOFF_DIR%"
if not exist "%LOGON_DIR%" mkdir "%LOGON_DIR%"
if not exist "%SHUTDOWN_DIR%" mkdir "%SHUTDOWN_DIR%"
if not exist "%STARTUP_DIR%" mkdir "%STARTUP_DIR%"

:: Create symlinks for files in Logoff folder
echo Creating symlinks for Logoff files...
for %%F in ("%ROOT_DIR%Logoff\*") do (
    if exist "%%F" (
        echo Creating symlink for "%%F"
        mklink "%LOGOFF_DIR%\%%~nxF" "%%F"
    )
)

:: Create symlinks for files in Logon folder
echo Creating symlinks for Logon files...
for %%F in ("%ROOT_DIR%Logon\*") do (
    if exist "%%F" (
        echo Creating symlink for "%%F"
        mklink "%LOGON_DIR%\%%~nxF" "%%F"
    )
)

:: Create symlinks for files in Shutdown folder
echo Creating symlinks for Shutdown files...
for %%F in ("%ROOT_DIR%Shutdown\*") do (
    if exist "%%F" (
        echo Creating symlink for "%%F"
        mklink "%SHUTDOWN_DIR%\%%~nxF" "%%F"
    )
)

:: Create symlinks for files in Startup folder
echo Creating symlinks for Startup files...
for %%F in ("%ROOT_DIR%Startup\*") do (
    if exist "%%F" (
        echo Creating symlink for "%%F"
        mklink "%STARTUP_DIR%\%%~nxF" "%%F"
    )
)

echo Symlink creation complete.

endlocal
pause
