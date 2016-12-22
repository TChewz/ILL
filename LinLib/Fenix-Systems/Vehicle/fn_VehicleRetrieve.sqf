/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.

	Author: Linnet (Infection)

	Description:
	Spawns the given saved vehicle.

	Parameter(s):
	_this select 0: STRING - Vehicle Classname

	Returns:
	0
*/
private["_vehicle"];
_vehicle = _this select 0;

if(isNil "_Vehicle")exitWith{systemChat "You did not select a car.";};
INV_SavedVeh = INV_SavedVeh - [_vehicle];
[_vehicle, impoundarea1] spawn INV_CreateVehicle;

[objNull, FALSE] call LinLib_fnc_VehicleUpdate;
systemChat "Vehicle retrieved, go fetch it at the impound lot.";
