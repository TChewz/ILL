//By Jonny
_AI = SUAI;
_Car = nearestObject [_AI,"LandVehicle"];
_Upgrades = _Car getVariable "Tuning";
_Cash = ('Mishy' call INV_GetItemAmount);
_Speed1Price = 40000;
_Speed2Price = 70000;
_Speed3Price = 100000;
_Speed4Price = 125000;
_Speed5Price = 180000;
if ((_Car distance _AI) > 10) exitWith {};
if (!(_Car call Own_This_Vehicle)) exitWith {player groupchat format ["You don't have the keys for %1!",_Car];};
if (isNil "_Upgrades") exitWith {player groupchat format ["%1 isn't upgraded!",_Car];};
switch (_Upgrades) do
{
	case 1:
	{
		if (_Cash < (_Speed1price/10)) exitWith {player groupchat format ["You need %1 to get this speed upgrade!",(_Speed1price/10)];};
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 1 removed from %1",_Car];
		["supgrade1",1] call INV_AddInvItem;
		_Car setVariable ["Tuning",nil,true];
	};
	case 2:
	{
		if (_Cash < (_Speed2price/10)) exitWith {player groupchat format ["You need %1 to get this speed upgrade!",(_Speed2price/10)];};
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 2 removed from %1",_Car];
		["supgrade2",1] call INV_AddInvItem;
		_Car setVariable ["Tuning",nil,true];
	};
	case 3:
	{
		if (_Cash < (_Speed3price/10)) exitWith {player groupchat format ["You need %1 to get this speed upgrade!",(_Speed3price/10)];};
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 3 removed from %1",_Car];
		["supgrade3",1] call INV_AddInvItem;
		_Car setVariable ["Tuning",nil,true];
	};
	case 4:
	{
		if (_Cash < (_Speed4price/10)) exitWith {player groupchat format ["You need %1 to get this speed upgrade!",(_Speed4price/10)];};
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 4 removed from %1",_Car];
		["supgrade4",1] call INV_AddInvItem;
		_Car setVariable ["Tuning",nil,true];
	};
	case 5:
	{
		if (_Cash < (_Speed5price/10)) exitWith {player groupchat format ["You need %1 to get this speed upgrade!",(_Speed5price/10)];};
		if (!alive player) exitWith {};
		player groupchat format ["Speed upgrade 5 removed from %1",_Car];
		["supgrade5",1] call INV_AddInvItem;
		_Car setVariable ["Tuning",nil,true];
	};
};