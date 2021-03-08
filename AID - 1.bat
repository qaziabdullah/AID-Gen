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
copy "C:\Users\Haqani Network\AppData\Roaming\AnyDesk" C:\AID-GEN\Output\AD1
TIMEOUT 5
taskkill /IM Anydesk.exe
TIMEOUT 5
del /f /s /q "C:\Users\Haqani Network\AppData\Roaming\AnyDesk" 1>nul
rmdir /s /q "C:\Users\Haqani Network\AppData\Roaming\AnyDesk"
TIMEOUT 5
taskkill /IM Anydesk.exe
TIMEOUT 5