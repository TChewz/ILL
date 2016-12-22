/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Initializes the database system.

	Parameter(s):
	
	
	Returns:
	0
*/
if(isNil "LinLib_ServerLoaded") then {
	LinLib_ServerLoaded = false;
};

if (isNil "LinLib_ServerFailed") then {
	LinLib_ServerFailed  = [false, ""];
};

if(isNil "LinLib_Logging") then {
	LinLib_Logging = true;
};

if(isNil "LinLib_LoadSkin")then {
	LinLib_LoadSkin = true;
};

if(isNil "LinLib_LoadWeapons")then {
	LinLib_LoadWeapons = true;
};

DB_Packet = nil;
LinLib_ClientLoaded = false;

waitUntil{LinLib_ServerLoaded};
if (LinLib_ServerFailed select 0) exitWith {
	systemChat format ["%1", LinLib_ServerFailed select 1];
	sleep 3;
	"END3" call BIS_fnc_EndMission;
};

waitUntil {!isNull player};
[player] call LinLib_fnc_ClientSelect;
systemChat "Requesting statistics.";

waitUntil{!isNil("DB_Packet")};
systemChat "Statistics received.";
diag_log format["EXTDB> %1", DB_Packet];
DB_Packet = call compile(DB_Packet);
diag_log format["EXTDB> %1", DB_Packet];
DB_Packet = (DB_Packet Select 1);
diag_log format["EXTDB> %1", DB_Packet];
if (count (DB_Packet) == 0) exitWith{

	[player, bnkgeld, INV_InventarArray, INV_LizenzOwner, streetrep, INV_Fabrikowner] call LinLib_fnc_ClientInsert;
	systemChat "New account created.";
};

[] call LinLib_fnc_InitVariables;
systemChat "Statistics loaded.";
