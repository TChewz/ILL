/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Calls the server for player stats.

	Parameter(s):
	_this select 0: OBJECT 	- Player
	
	Returns:
	0
*/

["DB_ClientSelect", _this] call LinLib_fnc_ClientToServer;