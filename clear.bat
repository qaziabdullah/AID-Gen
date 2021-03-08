@echo off
color a
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"

FOR /L %%n in (1,1,10) DO (

    call :show_progress %%n 10
    ping localhost -n 2 > nul
)

echo Done!
exit /b

:show_progress
setlocal EnableDelayedExpansion
set current_step=%1
set total_steps=%2
set /a "progress=(current_step * 100) / total_steps"

set /p ".=Progress: !progress!%%!CR!" <nul

if !progress! equ 100 echo.

exit /b
del /f /s /q "%programdata%\AnyDesk" 1>nul
rmdir /s /q "%programdata%\AnyDesk"
del /f /s /q "%appdata%\AnyDesk" 1>nul
rmdir /s /q "%appdata%\AnyDesk"
