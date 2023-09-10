@echo off
echo Checking and repairing system files...
sfc /scannow
dism /online /cleanup-image /restorehealth

echo.
echo System file check and repair completed.
echo Please review the output above for any errors or issues.
pause
