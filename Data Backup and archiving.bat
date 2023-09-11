@echo off
setlocal

:: Set the source and destination directories
set "sourceDir=C:\SourceFolder"
set "backupDir=D:\BackupFolder"

:: Set the archive directory (where older backups will be moved)
set "archiveDir=D:\Archive"

:: Set the date format for the backup folder
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set "dateStamp=%%c-%%a-%%b"
)

:: Create a backup folder with the current date
set "backupFolder=%backupDir%\Backup-%dateStamp%"
mkdir "%backupFolder%"

:: Perform the backup using robocopy
robocopy "%sourceDir%" "%backupFolder%" /mir /copyall /log+:%backupFolder%\BackupLog.txt

:: Move older backups to the archive folder
forfiles /p "%backupDir%" /m "Backup-*" /d -7 /c "cmd /c move @file \"%archiveDir%\""

echo Backup completed successfully.
