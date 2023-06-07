@echo off
color a
@echo on
taskkill /IM Anydesk.exe
TIMEOUT 5
cd /d C:\AID-GEN\
mkdir C:\AID-GEN\Output\AD1
TIMEOUT 5
cd /d C:\AID-GEN\
TIMEOUT 5
start AnyDesk.exe
TIMEOUT 7
cd /d %AppData%
copy Anydesk C:\AID-GEN\Output\AD1
TIMEOUT 5
taskkill /IM Anydesk.exe
TIMEOUT 5
cd /d %AppData%
del /f /s /q AnyDesk 1>nul
rmdir /s /q AnyDesk
TIMEOUT 5
taskkill /IM Anydesk.exe
TIMEOUT 5
taskkill /IM Anydesk.exe
TIMEOUT 5