/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Updates variables provided by array. Format: ["Column", variable]

	Parameter(s):
	_this select 0: OBJECT 	- Player
	_this select 1: ARRAY - Variable ARRAY
		["Column", variable],["Column2", variable2]
	
	Returns:
	0
*/
if((isNil "LinLib_ClientLoaded")) exitWith{systemChat "Update query not available yet."; diag_log format ["Attempted update with 2: %1", _this]; false};
if(!LinLib_ClientLoaded) exitWith{systemChat "Update query not available yet."; diag_log format ["Attempted update with 1: %1", _this]; false};
diag_log format ["Updated with: %1", _this];
["DB_ClientUpdate", _this] call LinLib_fnc_ClientToServer;
true