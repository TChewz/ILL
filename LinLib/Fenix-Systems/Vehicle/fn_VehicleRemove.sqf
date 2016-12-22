/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Removes given vehicle from the saved vehicle array.

	Parameter(s):
	_this select 0: String 	- Vehicle Classname
	
	Returns:
	0
*/
private["_vehicle"];
_vehicle = _this select 0;
if(isNil "_Vehicle")exitWith{player sidechat "You did not select a car.";};
INV_SavedVeh = INV_SavedVeh - [_vehicle];