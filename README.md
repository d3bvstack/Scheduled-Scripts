# Scheduled-Scripts

A collection of Windows batch scripts designed to automate system maintenance tasks during logon, logoff, startup, and shutdown events through Windows Group Policy.

## Overview

This repository contains batch scripts that perform various system maintenance and security tasks such as:
- Cleaning temporary files
- Emptying the Recycle Bin
- Clearing browser history
- Managing network connections
- Maintaining a clean desktop environment

## Directory Structure

The scripts are organized by when they should run:

```
Scheduled-Scripts/
│
├── Logon/             # Scripts executed when a user logs on
│   └── enable_internet.bat
│
├── Logoff/            # Scripts executed when a user logs off
│   └── bg_history.bat
│
├── Startup/           # Scripts executed when the system starts
│
└── Shutdown/          # Scripts executed when the system shuts down
    ├── clean_desktop.bat
    ├── clean_downloads.bat
    ├── clean_recyclebin.bat
    ├── clean_temporary.bat
    └── disable_internet.bat
```

## Script Descriptions

### Logon Scripts

#### enable_internet.bat
Waits for simplewall.exe to start running, then enables the Ethernet network interface. This ensures that your firewall is active before enabling network access.

### Logoff Scripts

#### bg_history.bat
Deletes Windows desktop background history registry entries to enhance privacy by removing records of previously used wallpapers.

### Shutdown Scripts

#### clean_desktop.bat
Removes all files and folders from the user's Desktop folder during shutdown to maintain a clean desktop environment.

#### clean_downloads.bat
Removes all files and folders from the user's Downloads folder to free up disk space.

#### clean_recyclebin.bat
Permanently empties the Recycle Bin on multiple drives to free up disk space.

#### clean_temporary.bat
Removes all files and folders from the system's Temp directory to free up disk space and remove temporary files.

#### disable_internet.bat
Disables the Ethernet network interface during system shutdown for added security.

## Installation

### Prerequisites
- Windows operating system
- Administrative privileges
- Windows Group Policy enabled

### Setup Instructions

1. Clone or download this repository to a permanent location on your system.
   ```
   git clone https://github.com/yourusername/Scheduled-Scripts.git
   ```

2. Run the `admin_create_symlinks.bat` script with administrative privileges:
   - Right-click on `admin_create_symlinks.bat` and select "Run as administrator"
   - This script creates symbolic links in the Windows Group Policy script folders to the scripts in this repository

3. Configure Group Policy:
   - Open the Group Policy Editor (`gpedit.msc`)
   - For user scripts (logon/logoff):
     - Navigate to User Configuration > Windows Settings > Scripts
     - Configure the scripts to run at logon/logoff as needed
   - For system scripts (startup/shutdown):
     - Navigate to Computer Configuration > Windows Settings > Scripts
     - Configure the scripts to run at startup/shutdown as needed

## Customization

### Network Interface Names
Some scripts assume the network interface is named "Ethernet". If your system uses a different name:

1. Find your interface name:
   ```
   netsh interface show interface
   ```

2. Modify the relevant scripts (e.g., `enable_internet.bat` and `disable_internet.bat`) to use your interface name.

### Drive Letters
The `clean_recyclebin.bat` script is configured to clear the Recycle Bin on drives C:, D:, E:, and Z:. Modify this script to match your system's drive configuration.

## Important Notes

- **WARNING**: Many scripts in this repository permanently delete files without confirmation or backup. Review each script carefully before implementing.
- Test scripts in a controlled environment before deploying widely.
- Ensure users are aware that files on the Desktop and in the Downloads folder will be automatically deleted.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.