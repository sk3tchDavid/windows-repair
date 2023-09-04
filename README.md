# windows-repair
   A collection of cmd commands that can help to fix windows problems

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Adjusting the Script](#adjusting-the-script)
- [License](#license)

## Introduction

This batch script automates the process of repairing common Windows errors by executing a series of built-in Windows diagnostic and repair commands.

## Features

The script includes the following features:

- **Check and Repair Windows System Files:** Verifies and repairs corrupted or missing Windows system files using the System File Checker (sfc).

- **Check and Repair Disk Errors:** Checks and repairs disk errors on the system drive using chkdsk.

- **Reset Windows Update Components:** Stops and restarts Windows Update services and performs maintenance tasks to fix Windows Update-related issues.

- **Reset Windows Firewall Settings:** Resets Windows Firewall settings to their default configurations.

- **Reset TCP/IP Stack:** Resets the TCP/IP network stack to its default settings.

- **Clear DNS Cache:** Flushes the DNS resolver cache, helping to resolve network-related problems.

- **Repair Windows Search Index:** Sets the Windows Search service to start automatically and restarts it, which can resolve search-related issues.

- **Repair Windows Store Cache:** Clears and resets the Windows Store cache.

- **Re-register Windows Store Apps:** Re-registers all Windows Store apps, which can resolve app-related problems.

- **Repair Windows Image:** Uses DISM to repair the Windows image.

- **Remove Temporary Files:** Runs the Disk Cleanup utility to remove temporary files.

- **Repair Windows Installer:** Unregisters and re-registers the Windows Installer service.

- **Repair Windows Management Instrumentation (WMI):** Attempts to repair the WMI repository.

- **Reset Power Plan Settings:** Restores the power plan settings to their defaults.

- **Reset Internet Explorer Settings:** Resets Internet Explorer settings to their defaults.

- **Rebuild Icon Cache:** Rebuilds the Windows icon cache.

- **Repair User Account Control Settings:** Adjusts User Account Control (UAC) settings.

- **Reset Windows Update Components (Alternative Method):** An alternative method for resetting Windows Update components.

- **Repair Windows Event Log:** Clears and resets the Windows Event Log.

- **Reboot the Computer:** Restarts the computer to apply any changes.


## Getting Started

1. Download the script to your Windows computer.

2. Right-click on the script file and select "Run as administrator" to ensure it has the necessary privileges.

3. The script will execute all repair steps in sequence. Wait for the script to complete the repairs.

4. After the script finishes, it will display "Repair process completed." Check for any remaining issues.


## Adjusting the Script

You can adjust the script to run individual repair methods step by step. Simply comment out (prepend with `::`) or remove the lines corresponding to the methods you want to skip.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
