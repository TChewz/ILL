//Bodybag script for IslandLifeGaming.com by [ILG] Jonny
_T = _this select 0;
if (_T == 1) then
{
	if (player distance (getMarkerPos "atmmarke") < 120) exitWith {};
	_bBag = "BODY" createVehicle (position player);
	_bBag setVehicleVarName format ["%1_%2",player,time];
	_bBag setDir (random 360);
	_Weapons = [];
	_Holstered_Pistol = false;
	_Holstered_Rifle = false;
	_Unholstered_Rifle = false;
	_Unholstered_Pistol = false;
	_Unholstered_Weapon = false;
	if !(isNil "P_Weapon_Holster") then {_Holstered_Pistol = true;};
	if !(isNil "R_Weapon_Holster") then {_Holstered_Rifle = true;};
	if (hadAWeaponBodyBag) then {_Unholstered_Weapon = true; hadAWeaponBodyBag = false;};
	_arrayToSet = [(str(player)),name player, time, getPos player,[_Holstered_Pistol,_Holstered_Rifle,_Unholstered_Weapon]];
	_bBag setVariable ["bodyBagInfo",_arrayToSet, true];
	_bBag setVariable ["BodyBag",true,true];
	sleep 500;
	deleteVehicle _bBag;
};

if (_T == 2) then
{
	_nObj = nearestObject [player, "BODY"];
	_is_bodyBag = _nObj getVariable "bodyBag";
	if (_is_bodyBag) then
	{
		_nObj setVariable ["bodyBag",false,true];
		_bodyBag_info = _nObj getVariable "bodyBagInfo";
		hint format ["Here lies %1(%3),\nThey died %2 seconds ago.",(_bodyBag_info select 1),round(time - (_bodyBag_info select 2)),(_bodyBag_info select 0)];
		format['%1 playMove "AinvPknlMstpSlayWrflDnon_medic";',player] call broadcast;
		waitUntil {(animationState player) == "AinvPknlMstpSlayWrflDnon_medic"};
		waitUntil {(animationState player) != "AinvPknlMstpSlayWrflDnon_medic"};
		if (isNull _nObj) exitWith {};
		if (!alive _nObj) exitWith {};
		_bodyPartArray = [1,2,2,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6];
		_bodyPartSelected = (_bodyPartArray select (floor(random(count _bodyPartArray))));
		switch (_bodyPartSelected) do
		{
			case 1:
			{
				player groupchat "You harvested a Human Genitalia";
				["Illegal_Genitalia",1] call INV_AddInvItem;
			};
			case 2:
			{
				player groupchat "You harvested a Human Heart";
				["Illegal_Heart",1] call INV_AddInvItem;
			};
			case 3:
			{
				player groupchat "You harvested a Human Brain";
				["Illegal_Brain",1] call INV_AddInvItem;
			};
			case 4:
			{
				player groupchat "You harvested a Human Lung";
				["Illegal_Lung",1] call INV_AddInvItem;
			};
			case 5:
			{
				player groupchat "You harvested a Human Kidney";
				["Illegal_Kidney",1] call INV_AddInvItem;
			};
			case 6:
			{
				player groupchat "You harvested a Human Liver";
				["Illegal_Liver",1] call INV_AddInvItem;
			};
		};
		deleteVehicle _nObj;
	};
};

if (_T == 3) then
{
	_nObj = nearestObject [player, "BODY"];
	_is_bodyBag = _nObj getVariable "bodyBag";
	if (_is_bodyBag) then
	{
		_bodyBag_info = _nObj getVariable "bodyBagInfo";
		_bodyBag_weapons = (_bodyBag_info select 4);
		_UGuns = "No gunshot residue found.";
		_HGuns = "No holstered weapons found.";
		if (_bodyBag_weapons select 2) then {_UGuns = "Gunshot residue found.";};
		if (_bodyBag_weapons select 3) then {_UGuns = "Gunshot residue found.";};
		if (_bodyBag_weapons select 0) then {_HGuns = "You find a weapon holster on his body.";};
		if (_bodyBag_weapons select 1) then {_HGuns = "You find a weapon holster on his body.";};
		hint format ["Here lies %1(%2)\nInvestigate their death and serve justice!\nDied %3 seconds ago\n\n%4\n%5",(_bodyBag_info select 1),(_bodyBag_info select 0),round(time - (_bodyBag_info select 2)),_UGuns,_HGuns];
	};
};

if (_T == 4) then
{
	_nObj = nearestObject [player, "BODY"];
	_is_bodyBag = _nObj getVariable "bodyBag";
	if (_is_bodyBag) then
	{
		_nObj setVariable ["bodyBag",false,true];//Prevention of spam/glitching
		_bodyBag_info = _nObj getVariable "bodyBagInfo";
		hint format ["You're clearing the body of %1(%2)\nThey died %3 seconds ago.\nGood Job.",(_bodyBag_info select 1),(_bodyBag_info select 0),round(time - (_bodyBag_info select 2))];
		format ['%1 switchMove "AinvPknlMstpSlayWrflDnon_medic";',player] call broadcast;
		sleep 2;
		format ['%1 switchMove "normal";',player] call broadcast;
		if (isNull _nObj) exitWith {};
		if (!alive _nObj) exitWith {};
		deleteVehicle _nObj;
		["Mishy",3500] call INV_AddInvItem;
		player groupchat "You recieved $3500 for clearing this bodybag.";
	};
};	