//Puts up a nice UI for Vehicle Info
//vehInfoUi.sqf
/*
while {true} do
{
	waitUntil {vehicle player != player};
	_vehPic = getText (configFile >> "cfgVehicles" >> typeOf (Vehicle Player) >> "picture");
	_vehDisName = getText (configFile >> "cfgVehicles" >> typeOf (Vehicle Player) >> "displayName");
	_upgradeVariable = (vehicle player) getVariable "tuning";
	_keyChain = if ((Vehicle player) call Own_This_Vehicle) then {"You have keys to this vehicle"}else{"You don't have the keys to this vehicle!"};
	_carAlarm = "";
	if ((vehicle player) getVariable "Car_Alarm") then {_carAlarm = "<br />This vehicle has a Car Alarm installed."};
	_sUpgrade = if (isNil "_upgradeVariable") then {"0"} else {_upgradeVariable};
	hintSilent parseText Format ["<t size='1' color='#FF0000'>Vehicle Info<t color='#FFFFFF' size='0.75'><br />%1<br /><img size='5' image='%2'/><br />License Plate: %5<br />%4<br />Speed Upgrade: %3%6",_vehDisName,_vehPic,_sUpgrade,_keyChain, vehicle player,_carAlarm];
	waitUntil {vehicle player == player};
	sleep 1;
};
*/
