/*
	file: WeaponHolster.sqf
	By:	[ILG] Jonny
	Desc:	Holsters weapons, bruh.
*/
isPistol =
{
	_unknownWeaponClass = _this select 0;
	
	_unknownConfig = configFile >> "CfgWeapons" >> _unknownWeaponClass;
	_pistolConfig = configFile >> "CfgWeapons" >> "PistolCore";
	
	_isPistol = false;
	while {isClass _unknownConfig} do
	{
	    if (_unknownConfig == _pistolConfig) exitWith
	    {
	        _isPistol = true;
	    };
	
	    _unknownConfig = inheritsFrom _unknownConfig;
	};
	
	_isPistol; // Return.
};
_type = _this select 0;
_fromRifle = false;
_fromPistol = false;
if (_type == 0) then {_fromRifle = true;};
if (_type == 1) then {_fromPistol = true;};
_cWep = currentWeapon player;
if (_fromRifle) exitWith
{	
	_cWep = primaryWeapon player;
	if ((_cWep == "") && (isNil "R_Weapon_Holster")) exitWith {player groupchat "Primary Weapon not Present";['gewehr', 0] call INV_SetItemAmount;};
	
//	_rifleBagOn = player getVariable "RifleBagOn";
//	if (!(_rifleBagOn)) exitWith {player groupChat "You do not have a rifle holster equipped.";};
	
	if (isNil "R_Weapon_Holster") then
	{
		_rPic = getText (configFile >> "cfgWeapons" >> _cWep >> "picture");
		_rName = getText (configFile >> "cfgWeapons" >> _cWep >> "displayName");
		hint parsetext format ["<t size='1.5'>%1<br /><img size='5' image='%2'/><t color='#FF0000' size='2'>HOLSTERED",_rName,_rPic];
		//player groupchat "Be sure to unholster your weapon your weapon before disconnecting to ensure it saves.";
		player removeWeapon _cWep;
		R_Weapon_Holster = _cWep;
		['gewehr', 1] call INV_SetItemAmount;
	}
	else
	{
		_rPic = getText (configFile >> "cfgWeapons" >> R_Weapon_Holster >> "picture");
		_rName = getText (configFile >> "cfgWeapons" >> R_Weapon_Holster >> "displayName");
		hint parsetext format ["<t size='1.5'>%1<br /><img size='5' image='%2'/><t color='#66FF33' size='2'>UNHOLSTERED",_rName,_rPic];
		player addWeapon R_Weapon_Holster;
		R_Weapon_Holster = nil;
		player selectWeapon (primaryWeapon player);
		['gewehr', 0] call INV_SetItemAmount;
	};
};

if (_fromPistol) exitWith
{
	if ((_cWep == "") && (isNil "P_Weapon_Holster")) exitWith {player groupchat "Secondary Weapon not Present";['pistole', 0] call INV_SetItemAmount;};
	if (isNil "P_Weapon_Holster") then
	{
		_wepArray = ((weapons player) - [primaryWeapon player]);
		{
			if ([_x] call isPistol) then {_cWep = _x;};
		} forEach _wepArray;
		_rPic = getText (configFile >> "cfgWeapons" >> _cWep >> "picture");
		_rName = getText (configFile >> "cfgWeapons" >> _cWep >> "displayName");
		hint parsetext format ["<t size='1.5'>%1<br /><img size='5' image='%2'/><t color='#FF0000' size='2'>HOLSTERED",_rName,_rPic];
		//player groupchat "Be sure to unholster your weapon your weapon before disconnecting to ensure it saves.";
		player removeWeapon _cWep;
		P_Weapon_Holster = _cWep;
		['pistole', 1] call INV_SetItemAmount;
	}
	else
	{
		_rPic = getText (configFile >> "cfgWeapons" >> P_Weapon_Holster >> "picture");
		_rName = getText (configFile >> "cfgWeapons" >> P_Weapon_Holster >> "displayName");
		hint parsetext format ["<t size='1.5'>%1<br /><img size='5' image='%2'/><t color='#66FF33' size='2'>UNHOLSTERED",_rName,_rPic];
		player addWeapon P_Weapon_Holster;
		player selectWeapon P_Weapon_Holster;
		P_Weapon_Holster = nil;
		['pistole', 0] call INV_SetItemAmount;
	};
};

player groupchat "Error - Report to developer and tell them to look at bottom of holster script.";
['pistole', 0] call INV_SetItemAmount;
['gewehr', 0] call INV_SetItemAmount;