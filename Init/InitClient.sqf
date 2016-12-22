["ca\missions_pmc\data\ui_gps_ca.paa",-0.05,0.16] call bis_fnc_customGPS;
//["init"] execVM "food.sqf";
["clientloop"] execVM "clientloop.sqf";
[0,0,0,["clientloop"]] execVM "gangs.sqf";
[] execVM "respawn.sqf";
[] execVM "itemactions.sqf";
[] execVM "petrolactions.sqf";
[] execVM "SpeedCams.sqf";
[] execVM "nametags.sqf";
[] execVM "mobilespam.sqf";
[] execVM "initplayer.sqf";
[2] execVM "markers.sqf";
[] execVM "salaries.sqf";
//[] execVM "pistolControl.sqf";
//[] execVM "rifleControl.sqf";
[] execVM "tluphone\tluphone.sqf";
[] execVM "RAV_lifter\InitMan.sqf";

//unholsterRifle = nil;
//holsterRifle = nil;

//unholsterPistol = nil;
//holsterPistol = nil;

CodeBroadcast = [];
"CodeBroadcast" addPublicVariableEventHandler
{
    _params = _this select 1;
    if(local (_params select 0)) then
    {
        (_params select 1) execVM (_params select 2);
    };
};
for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do {_i execVM "facqueue.sqf"};
player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun.sqf";}];
player setVariable ["restrained",false,true];
player setVariable ["FaceMaskOn",false,true];
//player setVariable ["RifleBagOn",false,true];
//player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "test.sqf";}];
//player addEventHandler ["handleDamage", {_this call compile preprocessfile "sethit.sqf"}];
waituntil{vehicle player == player};
player addEventHandler ["fired",{_this execVM "fired.sqf"}];
[]spawn{while{true} do {sleep 1;

	_gasobject = nearestObject [player, "SmokeShellYellow"];

	if(player getVariable "flashed" and isciv) then
	{
		if (not(alive player)) exitWith {};
		_Var = player getVariable "GasMaskOn";
		if (_Var) exitWith {};
		2 cutText ["","WHITE OUT",0];
		sleep 5;
		2 cutText ["","WHITE IN",3];
		sleep 1;
		player setVariable ["flashed",false, true];

	};
	if(player getVariable "flashedB") then
	{

		if (not(alive player)) exitWith {};
		sleep 2.5;
		player say ["flash_bang",5];
		2 cutText ["","WHITE OUT",0];
		sleep 10;
		2 cutText ["","WHITE IN",3];
		sleep 1;
		player setVariable ["flashedB",false, true];

	};

	if (player distance _gasobject <= 30 && !(playerside == resistance)) then
	{
		if (not(alive player)) exitWith {};
		2 cutText ["You are coughing from the nearby gas. I wouldn't get any closer.","WHITE OUT",0];
		playSound "coughing";
		sleep 10;
		2 cutText ["","WHITE IN",4];
		sleep 1;
	};
};};

[]spawn{while{true} do {

	_gasobject = nearestObject [player, "SmokeShellYellow"];

	if (player distance _gasobject <= 15 && !(playerside == resistance)) then
	{
		if (not(alive player)) exitWith {};
		titleText ["You are taking damage due to being close to the gas.","PLAIN DOWN"]; titleFadeOut 4;
		player setDammage ((damage player) + 0.1);
		sleep 4;
	};
	};
};

[]spawn {while {true} do
{
	disableSerialization;
	waitUntil {!(isNull (findDisplay 49))};
	((findDisplay 49) displayCtrl 1010) ctrlEnable false;
	_time = time;
	waitUntil {(isNull (findDisplay 49)) || time >= _time + 30};
	if (!(isNull (findDisplay 49))) then
	{
		((findDisplay 49) displayCtrl 1010) ctrlEnable true;
		waitUntil {isNull (findDisplay 49)};
	};
};
};

PlayerTeam = str(playerSide);
switch (PlayerTeam) do
{
    case "CIV":
	{
	[] execVM "actions\civactions.sqf";
	[] execVM "stungunfix.sqf";
	["handy", 1] call INV_SetItemAmount;
	onKeyPress = compile preprocessFile "actions\CivonKeyPress.sqf";
	waituntil {!(IsNull (findDisplay 46))};
	(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];
  
	};

    case "WEST":
	{
	[] execVM "actions\copactions.sqf";
	[] execVM "stungunfix.sqf";
	["handy", 1] call INV_SetItemAmount;
  player addWeapon "ItemGPS";
	onKeyPress = compile preprocessFile "actions\CoponKeyPress.sqf";
	waituntil {!(IsNull (findDisplay 46))};
	(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];
	};

    case "GUER":
	{
	[] execVM "actions\govactions.sqf";
	["handy", 1] call INV_SetItemAmount;
	onKeyPress = compile preprocessFile "actions\govonKeyPress.sqf";
	waituntil {!(IsNull (findDisplay 46))};
	(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];
	};
};
if(!isDedicated) then
{
	JIP_Stats_Ready = true;
	waitUntil{weaponsloaded};
	If(side player == west)then{
		LinLib_LoadSkin = false;
	};
	_h = [player] spawn LinLib_fnc_InitClient;
	waitUntil{scriptDone  _h};
};
