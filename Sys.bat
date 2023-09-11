@echo off
echo Gathering System Information...

:: Output file path
set "outputFile=%userprofile%\SystemInfo.txt"

:: Redirect the output to the file
systeminfo > "%outputFile%"

:: Display the collected information
type "%outputFile%"

echo System Information has been saved to %outputFile%
pause
