@echo off

echo System Repair Tool

:menu
echo.
echo 1. Attempt to Repair Boot Sector
echo 2. Access BIOS/UEFI Setup Utility
echo 3. Show Current MBR
echo 4. Open Windows Registry Editor
echo 5. Exit
echo.

set /p "choice=Enter your choice (1/2/3/4/5): "

if "%choice%"=="1" (
    call :repair_boot_sector
) else if "%choice%"=="2" (
    call :access_bios_uefi
) else if "%choice%"=="3" (
    call :show_current_mbr
) else if "%choice%"=="4" (
    call :open_registry_editor
) else if "%choice%"=="5" (
    exit /b
) else (
    echo Invalid choice. Please select 1, 2, 3, 4, or 5.
    goto menu
)

:repair_boot_sector
echo Attempting to repair the boot sector...
bootrec /fixboot
bootrec /fixmbr
bootrec /rebuildbcd

echo Boot sector repair completed.

pause
goto menu

:access_bios_uefi
echo To access the BIOS/UEFI setup utility:
echo 1. Restart your computer.
echo 2. Look for a prompt on the screen during boot that indicates the key to access BIOS/UEFI. Common keys include F2, F12, Delete, or Esc.
echo 3. Press the indicated key to enter the BIOS/UEFI setup utility.

pause
goto menu

:show_current_mbr
echo Showing the current MBR...
bootice /mbrbackup:"%CD%\mbr.bin"
bootice /mbr:"%CD%\mbr.bin"

pause
goto menu

:open_registry_editor
echo Opening Windows Registry Editor...
regedit

echo Registry Editor closed.

pause
goto menu
