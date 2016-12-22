/*
	Lockpicks
	written by Juan for ILG @ 22/08/2014

	Use it if you want idgaf
*/
if ((_this select 0) != "use") exitWith {};
if (working) exitWith {};
working = true;
_item = _this select 1;
_LockpickingObject = cursorTarget;
_suc = false;
_steven = 0;
if (vehicle player != player) exitWith {player groupchat "You must be on foot to use lockpicks!"; working = false;};
if (player distance _LockpickingObject > 6) exitWith { working = false;};//Range
if (_LockpickingObject call Own_This_Vehicle) exitWith {player groupchat format ["The vehicle %1 is already on your keychain!",_LockpickingObject]; working = false;};
if (!(_LockpickingObject isKindOf "LandVehicle") OR (_LockpickingObject isKindOf "Tank")) exitWith {player groupchat format ["%1 isn't a lockpickable vehicle!",_LockpickingObject]; working = false;};
if (!(_LockpickingObject call Is_Player_Veh)) exitWith
{
	player groupchat "This vehicle is bugged. Please file a bug report/Report to developer on the situation.";
	player groupchat "If it looks hacked in please notify a staff member";
	working = false;
};
_Has_CarAlarm = _LockpickingObject getVariable "Car_Alarm";
_AnimWaitTime = (round(random(5)))+5;
if (_Has_CarAlarm) then {_AnimWaitTime = 20; _valueNeeded = 20; player groupchat "This vehicle has a car alarm! This will take a while...";};
format ['%1 switchMove "c7a_bravo_dovadeni5";',player] call broadcast;
_LoopCounter = 0;
LPcancel = false;
_Action = player addAction ["<t color='#FF0000'>Cancel Lockpick</t>","noscript.sqf",'LPcancel = true;'];
_ExitVar = false;
_valueNeeded = 35;
_Progress = 0;
_Percent = (100/_Animwaittime);
if (_Has_CarAlarm) then
{
	_LockpickingObject spawn
	{
		format ['%1 say3D "alarm4";',_this] call broadcast;
		sleep 5;
		format ['%1 say3D "alarm4";',_this] call broadcast;
		sleep 5;
		format ['%1 say3D "alarm4";',_this] call broadcast;
		sleep 5;
		format ['%1 say3D "alarm4";',_this] call broadcast;
	};
};
while {true} do
{
	if (_LoopCounter >= _AnimWaitTime) exitWith {};
	if (!alive player) exitWith {_ExitVar = true};
	if ((animationState player) == "civillying01") exitWith {_ExitVar = true};
	if ((animationState player) != "c7a_bravo_dovadeni5") then {format ['%1 switchMove "c7a_bravo_dovadeni5";',player] call broadcast;};
	if (LPcancel) exitWith {_ExitVar = true};
	if ((player distance _LockpickingObject) > 7) exitWith {_ExitVar = true};
	_LoopCounter = _LoopCounter + 1;
	_Progress = _Progress + _Percent;
	titleText[format["Lockpicking | %1%2",floor(_Progress),"%"],"PLAIN DOWN"];
	sleep 1;
};
format ['%1 switchMove "";',player] call broadcast;
if (_ExitVar) exitWith {titleText["Lockpick Cancelled","Plain Down"]; player removeAction _Action; working = false;};
_dice = round (random (100));
if (_dice <= _valueNeeded) then
{
	titleText ["Lockpick successful!","plain down"];
	player groupchat format ["%1 is now on your keychain",_LockpickingObject];
	[player,_LockpickingObject] call Add_veh_Owner;
	[] call LinLib_fnc_KeysUpdate;
	_suc = true;
}
else
{
	titleText ["Lockpick Broke!","plain down"];
	_suc = false;
};
[_item, -1] call INV_AddInventoryItem;
player removeAction _Action;
{
	if (player distance _x < 125) then
	{
		_steven = _steven + 1;
	};
} forEach coparray;//Checks for cops around

if (_steven != 0) then
{
	if (_suc) then
	{
		_VehConfigName = getText (configFile >> "cfgVehicles" >> (typeOf _LockpickingObject) >> "displayName");
		format['hintSilent format["%1 has lockpicked %3 (%2)"];',name player,_LockpickingObject, _VehConfigName] call broadcast;
		(format['if(!("Grand Theft Auto" in %1_reason))then{%1_reason = %1_reason + ["Grand Theft Auto"]}; %1_wanted = 1; kopfMishy_%1 = kopfMishy_%1 + 5000;', player]) call broadcast;
	}
	else
	{
		_VehConfigName = getText (configFile >> "cfgVehicles" >> (typeOf _LockpickingObject) >> "displayName");
		format['hintSilent format["%1 has attempted to lockpick %3 (%2)"];',name player,_LockpickingObject, _VehConfigName] call broadcast;
		(format['if(!("Attempted Grand Theft Auto" in %1_reason))then{%1_reason = %1_reason + ["Attempted Grand Theft Auto"]}; %1_wanted = 1; kopfMishy_%1 = kopfMishy_%1 + 750;', player]) call broadcast;
	};
};
working = false;
