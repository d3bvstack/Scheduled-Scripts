# Windows Scheduled Scripts

A collection of Windows batch scripts designed to automatically run during system events (startup, shutdown, logon, logoff) through Windows Group Policy.

## Overview

This repository contains batch scripts that perform various system maintenance and security tasks. The scripts are organized into folders according to when they should run:

- **Logon**: Scripts that run when a user logs on to the system
- **Logoff**: Scripts that run when a user logs off from the system
- **Startup**: Scripts that run when the system starts up
- **Shutdown**: Scripts that run when the system shuts down

## Installation

1. Clone or download this repository to your local machine
2. Run `admin_create_symlinks.bat` as administrator to create symbolic links in the appropriate Windows Group Policy script folders
3. Ensure Windows Group Policy is configured to execute scripts at the appropriate events

### Prerequisites

- Windows operating system
- Administrator rights
- Group Policy configured to run scripts at system events

## Script Details

### Logon Scripts

#### enable_internet.bat

Enables the Ethernet network interface after detecting that the simplewall.exe process is running.
- Monitors for the simplewall.exe process
- Once the process is detected, enables the Ethernet interface
- Assumes the network interface is named "Ethernet"

### Logoff Scripts

#### bg_history.bat

Deletes Windows desktop background history registry entries.
- Removes records of previously used wallpapers from the registry
- Enhances privacy by removing background history

### Shutdown Scripts

#### clean_desktop.bat

Removes all files and folders from the user's Desktop.
- Permanently deletes all files and folders without creating backups
- Maintains a clean desktop environment

#### clean_downloads.bat

Removes all files and folders from the user's Downloads folder.
- Permanently deletes all files and folders without creating backups
- Frees up disk space

#### clean_recyclebin.bat

Permanently empties the Recycle Bin on multiple drives.
- Removes files from Recycle Bins on drives C:, D:, E:, and Z:
- Frees up disk space

#### clean_temporary.bat

Removes all files and folders from the system's Temp directory.
- Deletes temporary files to free up disk space
- Removes potentially sensitive cached data

#### disable_internet.bat

Disables the Ethernet network interface.
- Deactivates the network connection during shutdown
- Assumes the interface is named "Ethernet"

### Startup Scripts

Currently contains a placeholder script:
- dummy.bat (empty script file)

## Administration

### admin_create_symlinks.bat

This administrative script creates symbolic links in the Windows Group Policy script folders to the scripts in this repository.
- Must be run as Administrator
- Creates the necessary folder structure if it doesn't exist
- Creates symbolic links to all scripts in the appropriate Group Policy directories

## Warning

Many of these scripts permanently delete files without confirmation or backup. Always ensure you have backed up important files before using these scripts.

## Customization

You may need to customize these scripts based on your specific system configuration:
- Network interface names in network-related scripts
- Drive letters in scripts that target specific drives
- File paths if your system uses non-standard locations

## License

See the [LICENSE](LICENSE) file for details.
