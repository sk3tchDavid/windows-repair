@echo off
echo Repairing Common Windows Errors...

:: 1. Check and repair Windows system files
sfc /scannow

:: 2. Check and repair disk errors
chkdsk /f

:: 3. Reset Windows Update components
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

:: 4. Reset Windows Firewall settings
netsh advfirewall reset

:: 5. Reset TCP/IP stack
netsh int ip reset

:: 6. Clear DNS cache
ipconfig /flushdns

:: 7. Repair Windows Search index
sc config wsearch start=auto
net stop wsearch
net start wsearch

:: 8. Repair Windows Store cache
wsreset.exe

:: 9. Re-register Windows Store apps
Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

:: 10. Repair Windows Image
DISM /Online /Cleanup-Image /RestoreHealth

:: 11. Remove temporary files
cleanmgr /sagerun:1

:: 12. Repair Windows Installer
msiexec /unregister
msiexec /regserver

:: 13. Repair Windows Management Instrumentation (WMI)
winmgmt /salvagerepository

:: 14. Reset Power Plan settings
powercfg -restoredefaultschemes

:: 15. Reset Internet Explorer settings
"%ProgramFiles%\Internet Explorer\iexplore.exe" -extoff -nohome

:: 16. Rebuild Icon Cache
ie4uinit.exe -show

:: 17. Repair User Account Control settings
%windir%\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f

:: 18. Repair Windows Update components (alternative method)
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
del %ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr.dat
cd /d %windir%\system32
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
netsh winsock reset
netsh winhttp reset proxy
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc

:: 19. Repair Windows Event Log
wevtutil el | Foreach-Object {wevtutil cl "$_"}

:: 20. Reboot the computer
shutdown /r /t 0

echo Repair process completed.
pause