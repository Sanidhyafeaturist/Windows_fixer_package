@echo off
setlocal enabledelayedexpansion

:menu
cls
echo User Account Management Menu
echo ---------------------------
echo 1. Create User Account
echo 2. Reset User Password
echo 3. Delete User Account
echo 4. Enable UAC
echo 5. Disable UAC
echo 6. Exit
echo ---------------------------
set /p choice=Enter your choice (1/2/3/4/5/6): 

if "%choice%"=="1" (
    call :createUser
) else if "%choice%"=="2" (
    call :resetPassword
) else if "%choice%"=="3" (
    call :deleteUser
) else if "%choice%"=="4" (
    call :enableUAC
) else if "%choice%"=="5" (
    call :disableUAC
) else if "%choice%"=="6" (
    exit /b
) else (
    echo Invalid choice. Please try again.
    pause
    goto :menu
)

goto :menu

:createUser
:: Your createUser code here
goto :menu

:resetPassword
:: Your resetPassword code here
goto :menu

:deleteUser
:: Your deleteUser code here
goto :menu

:enableUAC
:: Enable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
echo User Account Control (UAC) has been enabled.
pause
goto :menu

:disableUAC
:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
echo User Account Control (UAC) has been disabled.
pause
goto :menu
