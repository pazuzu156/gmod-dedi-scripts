@echo off
if exist gmodds goto run
goto norun

:run
cd gmodds
call srcds.exe -console -game garrysmod +map gm_construct +maxplayers 24 -authkey AUTHKEY +sv_setsteamaccount SERVERACCOUNTID
exit

:norun
echo Server not installed. Please run ./updater.sh -i
exit
