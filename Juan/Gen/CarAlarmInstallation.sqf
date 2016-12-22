//Installs a car alarm on the vehicle. Works with lockpick.sqf script
if ((_this select 0) == "use") then
{
	_Item = _this select 1;
	_Vehicle = cursortarget;
	_Var = _Vehicle getVariable "Car_Alarm";
	if ((player distance _Vehicle) > 5) exitWith {player groupchat "You're too far away from your vehicle"};
	if (!(_Vehicle call Own_This_Vehicle)) exitWith {player groupchat "You don't have the keys to that vehicle"};
	if (!(_Vehicle isKindOf "LandVehicle")) exitWith {};
	if (!alive player) exitWith {};
	if ((animationState player) == "civillying01") exitWith {};
	if (_Var) exitWith {player groupchat "This vehicle already has a car alarm installed"};
	
	[_item, -1] call INV_AddInventoryItem;
	_Vehicle setVariable ["Car_Alarm",true,true];
	player groupchat format ["You successfully installed a car alarm on your %1",getText (configFile >> "cfgVehicles" >> (typeOf _Vehicle) >> "displayName")];
};