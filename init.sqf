bnkgeld = 0;

titleText ["", "BLACK IN",120];

if(isNil "45983450u34h57y5646ccvd4tjdsjncx7y3h")then{
	45983450u34h57y5646ccvd4tjdsjncx7y3h = 1;
	publicVariable "45983450u34h57y5646ccvd4tjdsjncx7y3h";
	gamerz971HDisLoveHeIsLife = 1;
	publicVariable "gamerz971HDisLoveHeIsLife";

};

#define ExecSQF(FILE) [] call compile preprocessFileLineNumbers FILE

if(isServer) then
{
	[] call LinLib_fnc_InitServer;
	mafiabank = 1;
	Publicvariable "mafiabank";
	execVM "serverscripts\tcgIsLove.sqf";
	mafiamembers = [];
	mafs setVariable ["mafiamembers", mafiamembers, true];
	["server"] execVM "bombs.sqf";
};
["init"] execVM "bombs.sqf";
[] call compile preprocessFileLineNumbers "addons\proving_Ground\init.sqf";

enableSaving [false, false];
waitUntil {!(isNil "tcgIsLove")};
call tcgIsLove;
ILG_Mission_Version = 2.2;
ILG_RanInit		= false;
version        	= "3";
debug          	= false;
dedicatedServer = false;
copscount      	= 25;
civscount      	= 55;
playercount    	= 80;
debugarray     	= [];
execVM "briefing.sqf";
//waitUntil {DCV_Init};
private ["_Handler","_h","_initClient","_initServer"];
//player GlobalChat "Relog if you stats don't load in 2 minutes!";
if(!debug)then{[] execVM "introcam.sqf";};
call compile preprocessfile "triggers.sqf";
waitUntil { ( (time > 1) and ((alive player) or (local server)) ) };
_h = [] execVM "playerarrays.sqf";
waitUntil{scriptDone  _h};
_h = [80, rolenumber] execVM "initfuncs.sqf";
waitUntil{scriptDone  _h};
_h = [playerarray, playerstringarray, !iscop] execVM "INVvars.sqf";
waituntil{scriptDone  _h};
_h = [] execVM "bankexec.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "initWPmissions.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "gfx.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "animList.sqf";
waitUntil{scriptDone  _h};
_h = []	execVM "miscfunctions.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "variables.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "lottoexec.sqf";
waitUntil{scriptDone  _h};

_script = [] spawn compile preprocessFileLineNumbers "easyNameTags\ENT_unitTags.sqf";
waitUntil{scriptDone _script};

player setVariable ["restrained",false,true];
execVM "Juan\init.sqf";
execVM "AntiHackMainCaller.sqf";
execVM "VehInfoUi.sqf";
execVM "saveVars.sqf";
execVM "BTK\Cargo Drop\Start.sqf";
execVM "motd.sqf";
execVM "mayorloop.sqf";
execVM "vehicleGear.sqf";
execVM "radar.sqf";
//execVM "weather.sqf";
execVM "mobilespam.sqf";
//execVM "9382496.sqf";
execVM "markermaker.sqf";
//execVM "Scripts\DRN\DynamicWeatherEffects\DynamicWeatherEffects.sqf";
execVM "R3F_ARTY_AND_LOG\init.sqf";
[5,15] execVM "bodyremover.sqf";
ExecSQF("LinLib\init-func.sqf");
setPitchBank = compile preprocessfile "setPitchBank.sqf";
BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
UKF_noGripOrBipod = true;
UKF_noCQBsights = true;

if(!dedicatedserver) then
{
//	[] call LinLib_MoveBuildings;
	_initClient = execVM "init\InitClient.sqf";
	[] execVM "mafiasyn\mafiafunc.sqf";
	["client"] execVM "bombs.sqf";
};

if (isServer) then
{
	_initServer = execVM "init\InitServer.sqf";
};

[] execVM "ui.sqf";

//playercount = 1;
//publicvariable "playercount";
chiefNumber = 1;
publicvariable "chiefNumber";

if (isNil "ILG_Voting_Enable") then {ILG_Voting_Enable = true;};
/*
while {playerSide == WEST} do {
	sleep 5;
	_vehicle = (vehicle player);
	_pitaction = _vehicle addAction ["Attempt PIT", "pit.sqf",'', 1, false, true, "", 'iscop && (((assignedVehicleRole player) select 0) == "Driver")'];
	_coppc = _vehicle addAction ["Police Computer", "policePC\pages\login.sqf"];
	_reqbackup = _vehicle addAction ["Request Backup", "noscript.sqf", '[] call Activate_Backup_Button', 6, false, true, "", 'iscop && ("ItemGPS" in (items player)) && Allow_Backup'];
	_PanicButton = _vehicle addAction ["<t color=""#ff0000"">" +"PANIC BUTTON", "noscript.sqf", '[] call Activate_Panic_Button', 5.9, false, true, "", 'iscop && Allow_Panic && ("ItemGPS" in (items player))'];
	[_vehicle] call GetInEventHandler_UpdateVehicleUI;
	if(_vehicle isKindOf "Air") then {player removeaction _pitaction;};
	_vehicle removeaction _pitaction;
	_vehicle removeaction _coppc;
	_vehicle removeaction _reqbackup;
	_vehicle removeAction _PanicButton;
	waitUntil {not ((vehicle player) == _vehicle)};
	player removeaction _pitaction;
	player removeaction _coppc;
	player removeaction _reqbackup;
	player removeAction _PanicButton;
};
*/
while {playerSide == WEST} do {
	sleep 5;
	_vehicle = (vehicle player);
	_pitaction = _vehicle addAction ["Attempt PIT", "pit.sqf",'', 1, false, true, "", 'iscop && (((assignedVehicleRole player) select 0) == "Driver")'];
	_coppc = _vehicle addAction ["Police Computer", "policePC\pages\login.sqf"];
	_reqbackup = _vehicle addAction ["Request Backup", "noscript.sqf", '[] call Activate_Backup_Button', 6, false, true, "", 'iscop && ("ItemGPS" in (items player)) && Allow_Backup'];
	_PanicButton = _vehicle addAction ["<t color=""#ff0000"">" +"PANIC BUTTON", "noscript.sqf", '[] call Activate_Panic_Button', 5.9, false, true, "", 'iscop && Allow_Panic && ("ItemGPS" in (items player))'];
	//[_vehicle] call GetInEventHandler_UpdateVehicleUI;
	if(_vehicle isKindOf "Air") then {_vehicle removeaction _pitaction;};
	player removeaction _pitaction;
	player removeaction _coppc;
	player removeaction _reqbackup;
	player removeAction _PanicButton;
	waitUntil {not ((vehicle player) == _vehicle)};
	_vehicle removeaction _pitaction;
	_vehicle removeaction _coppc;
	_vehicle removeaction _reqbackup;
	_vehicle removeAction _PanicButton;
};


fn_netSay3D = compile preprocessFileLineNumbers "Steve\fn_netSay3D.sqf";

if (isNil "PVEH_netSay3D") then {
    PVEH_NetSay3D = [objNull,0];
};

"PVEH_netSay3D" addPublicVariableEventHandler {
      private["_array"];
      _array = _this select 1;
     (_array select 0) say3D (_array select 1);
};
