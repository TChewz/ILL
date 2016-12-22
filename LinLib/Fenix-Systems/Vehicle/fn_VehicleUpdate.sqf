/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Updates the vehicle array.

	Parameter(s):
	_this select 0: STRING - Vehicle
	_this select 1: Bool - Save array without modifying it
	
	Returns:
	0
*/
if(!(_this select 1))exitWith{[player, [["vehicle", INV_SavedVeh]]] call LinLib_fnc_ClientUpdate;};

private["_vehicle"];
_vehicle = missionNamespace getVariable [_this select 0, objNull];

if((typeOf _vehicle) in INV_SavedVeh && (_this select 1))then{
	systemChat "You already have this kind of vehicle saved.";
}
else{
	if(isNil "_vehicle")exitWith{systemChat "You did not select a car.";};
	if((count INV_SavedVeh >= 3))exitWith{systemChat "Maximum amount of vehicles saved already. Please remove a vehicle.";};
	if((_vehicle distance savepoint) >= 50)exitWith{systemChat "Vehicle too far away.";};
	
	INV_SavedVeh = INV_SavedVeh + [typeOf _vehicle];
	deleteVehicle _vehicle;
	systemChat "Vehicle saved.";
	
	[player, [["vehicle", INV_SavedVeh]]] call LinLib_fnc_ClientUpdate;
};