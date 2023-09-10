@echo off

echo Drive Manipulation Tool

:menu
echo.
echo 1. Cleanup C Drive
echo 2. Detect Issues on C Drive
echo 3. Format C Drive
echo 4. Delete Drive
echo 5. List Volumes and Drives
echo 6. Exit
echo.

set /p "choice=Enter your choice (1/2/3/4/5/6): "

if "%choice%"=="1" (
    call :cleanup
) else if "%choice%"=="2" (
    call :detect_issues
) else if "%choice%"=="3" (
    call :format_c_drive
) else if "%choice%"=="4" (
    call :delete_drive
) else if "%choice%"=="5" (
    call :list_drives
) else if "%choice%"=="6" (
    exit /b
) else (
    echo Invalid choice. Please select 1, 2, 3, 4, 5, or 6.
    goto menu
)

:cleanup
echo Running Disk Cleanup on C drive...
start /wait cleanmgr /sagerun:1
echo Disk Cleanup completed.
pause
goto menu

:detect_issues
echo Running chkdsk on C drive...
chkdsk C: /f /r
echo chkdsk completed. The computer will automatically restart.
shutdown /r /t 5
goto menu

:format_c_drive
echo WARNING: Formatting the C drive will result in the loss of all data.
echo Ensure you have a complete backup of all data on the C drive before proceeding.
echo.
set /p "confirm=Are you sure you want to format the C drive? (Type 'yes' to continue): "
if /i "%confirm%" neq "yes" (
    echo Operation canceled.
    pause
    goto menu
)
echo Formatting C drive...
format C: /fs:ntfs /q
echo C drive formatted.
echo.
echo WARNING: The C drive has been formatted. You will need to reinstall the operating system and restore your data from backups.
pause
goto menu

:delete_drive
set /p "drive=Enter the drive letter to delete (e.g., D:): "
echo.
echo WARNING: Deleting the %drive% drive will result in the loss of all data on that drive.
echo Ensure you have a complete backup of all data on the %drive% drive before proceeding.
echo.
set /p "confirm=Are you sure you want to delete the %drive% drive? (Type 'yes' to continue): "
if /i "%confirm%" neq "yes" (
    echo Operation canceled.
    pause
    goto menu
)
echo Deleting the %drive% drive...
rd /s /q %drive%
echo %drive% drive deleted.
pause
goto menu

:list_drives
echo Listing all volumes and drives...
wmic logicaldisk get caption, drivetype
pause
goto menu
