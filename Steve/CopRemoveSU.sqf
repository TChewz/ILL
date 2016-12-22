_Car = nearestObject [player,"LandVehicle"];
_Upgrades = _Car getVariable "Tuning";
if (isNil "_Upgrades") exitWith {player groupchat format ["%1 isn't upgraded!",_Car];};

switch (_Upgrades) do
{
	case 1:
	{
		if (!alive player) exitWith {};
		player groupchat "This car does not have an illegal speed upgrade.";
	};
	case 2:
	{
		if (!alive player) exitWith {};
		player groupchat "This car does not have an illegal speed upgrade.";
	};
	case 3:
	{
		if (!alive player) exitWith {};
		player groupchat "This car does not have an illegal speed upgrade.";
	};
	case 4:
	{
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 4 removed from %1",_Car];
		_Car setVariable ["Tuning",nil,true];
	};
	case 5:
	{
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 5 removed from %1",_Car];
		_Car setVariable ["Tuning",nil,true];
	};
};