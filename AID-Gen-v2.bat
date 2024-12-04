@echo off
color a
setlocal enabledelayedexpansion

:: Get user input for timeout duration
set /p timeoutSeconds="Enter timeout duration (in seconds): "

:: Get user input for the number of IDs
set /p numIDs="Enter the number of IDs to process: "

:: Initialize variables
set progress=0
set increment=100

:: Calculate the increment percentage for progress bar
set /a increment=100/%numIDs%

:: Begin the process
for /l %%i in (1, 1, %numIDs%) do (
    cls
    echo ================================================
    echo           AnyDesk Automation Script            
    echo ================================================
    echo Processing ID %%i of %numIDs%
    
    :: Progress bar display
    set /a progress+=increment
    if !progress! gtr 100 set progress=100
    call :ProgressBar !progress!
    
    :: Perform operations
    taskkill /IM Anydesk.exe >nul 2>&1
    mkdir C:\AID-GEN\Output\AD%%i >nul 2>&1
    start C:\AID-GEN\AnyDesk.exe
    timeout /t %timeoutSeconds% >nul
    cd /d %AppData% >nul
    copy AnyDesk C:\AID-GEN\Output\AD%%i >nul 2>&1
    taskkill /IM Anydesk.exe >nul 2>&1
    del /f /s /q AnyDesk >nul 2>&1
    rmdir /s /q AnyDesk >nul 2>&1
)

:: Completion message
cls
echo ================================================
echo           Process Completed Successfully        
echo ================================================
pause
exit /b

:ProgressBar
:: Display a progress bar
:: %1 = progress percentage (0-100)
set /a completed=%1/2
set /a remaining=50-%completed%
set barCompleted=
set barRemaining=
for /l %%j in (1, 1, !completed!) do set barCompleted=!barCompleted!#
for /l %%j in (1, 1, !remaining!) do set barRemaining=!barRemaining!-
echo [!barCompleted!!barRemaining!] %1%%
exit /b