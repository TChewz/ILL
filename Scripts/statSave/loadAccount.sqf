if (true) exitWith {};

player groupChat "Loading stats, You will be temporarily frozen and will not be able to move until stats load.";
player groupChat "Please wait while your stats load...";
hintSilent "Stats Loading 0%";
//player groupChat "Loading";
//Requests info from server in order to download stats
[getPlayerUID player, getPlayerUID player, "moneyPlayer", "NUMBER"] call sendToServer;
sleep 3;
hintSilent "Stats Loading 20%";
//player groupChat "Loading. .";
[getPlayerUID player, getPlayerUID player, "moneyAccount", "NUMBER"] call sendToServer;
hintSilent "Stats Loading 40%";
//player groupChat "Loading. . .";
if(playerSide == west) then
{
	[getPlayerUID player, getPlayerUID player, "WeaponsPlayerWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "MagazinesPlayerWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "LicensesWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "InventoryWest", "ARRAY"] call sendToServer;
};

hintSilent "Stats Loading 60%";
//player groupChat "Loading. . . .";
if(playerSide == resistance) then
{
	[getPlayerUID player, getPlayerUID player, "WeaponsPlayerRes", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "MagazinesPlayerRes", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "LicensesRes", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "InventoryRes", "ARRAY"] call sendToServer;
};

hintSilent "Stats Loading 80%";
//player groupChat "Loading. . . . .";
if(playerSide == civilian) then
{
	[getPlayerUID player, getPlayerUID player, "WeaponsPlayerCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "MagazinesPlayerCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "LicensesCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "InventoryCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedVehiclesCiv", "ARRAY"] call sendToServer;
    [getPlayerUID player, getPlayerUID player, "privateStorageCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "streetReputation", "NUMBER"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "INV_Fabrikowner", "ARRAY"] call sendToServer;
};

hintSilent "Stats Loading 100%";
sleep 2;
disableUserInput false;
//player groupChat "Loading. . . . . .";

//===========================================================================

sleep 3;
//END
statsLoaded = 1;
statsAreLoadedForReal = true;
hint "Stats Load Complete!";
player groupChat "Player Stats Loading Complete If your stats have not yet loaded please relog immediately or risk losing your previous stats";
player groupChat "If your stats have not yet loaded please relog immediately or risk losing your previous stats";
sleep 4;
player groupChat "RELOG IMMEDIATELY IF YOUR STATS HAVE NOT LOADED YET!!";
player groupChat "RELOG IMMEDIATELY IF YOUR STATS HAVE NOT LOADED YET!!";
player groupChat "RELOG IMMEDIATELY IF YOUR STATS HAVE NOT LOADED YET!!";
player groupChat "If your stats have not yet loaded please relog immediately or risk losing your previous stats";