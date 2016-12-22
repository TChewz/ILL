/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Creates a new entry in the SQL-database.

	Parameter(s):
	_this select 0: OBJECT 	- Player
	_this select 1: INTEGER - Bank
	_this select 2: ARRAY 	- Inventory
	_this select 3: ARRAY 	- License
	_this select 4: DOUBLE 	- Street Rep
	
	Returns:
	0
*/
["DB_ClientInsert", _this] call LinLib_fnc_ClientToServer;
LinLib_ClientLoaded = true;