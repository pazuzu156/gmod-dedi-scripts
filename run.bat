@echo off
if exist gmodds goto run
goto norun

:run
cd gmodds
call srcds.exe -console
exit

:norun
echo Server not installed. Please run ./updater.sh -i
exit
