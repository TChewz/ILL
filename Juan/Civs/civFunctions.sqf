// Functions for Civilians (Generic)

Verify_Unit_Class =
{
	switch (true) do
	{
		case (((typeOf player) == "LIN_ElPresidente") && (!isMayor)):	{["Priest"] call clothes};
		case (((typeOf player) == "Functionary1") && (streetrep < 15)):	{["Priest"] call clothes};
	};
};

Locate_Gov =
{
	Private ["_Gov","_x","_Cost"];
	_Money = ('Mishy' call INV_GetItemAmount);
	_Cost = 75000;
	if (_Money < 75000) exitWith {player groupchat format ["You need %1 to do this!",_Cost];};
	_GovOnline = false;
	_Gov = Civ1;
	{if (typeOf _x == "LIN_ElPresidente") then {_Gov = _x; _GovOnline = true;};}foreach civarray;
	if (!_GovOnline) exitWith {player sidechat "No governor online!";};
	player groupchat format ["%1",_Gov];
	player sidechat format ["%1 (%2) is located %3",name _Gov,_Gov,([_Gov] call Emita_GetGridRef)];
	player sidechat format ["%1 (%2) is located %3",name _Gov,_Gov,([_Gov] call Emita_GetGridRef)];
	["Mishy",-75000] call INV_AddInvItem;
};

ziptie = {
  private ["_Ziptiee","_exitVar"];
  _Ziptiee = _this select 0;
  if (isNull _Ziptiee || !alive _Ziptiee) exitWith {};

  player setVariable ["restrained",true,true];
  player setVariable ["RestrainedBy", 1, true];

  titleText[format["You've been ziptied by %1(%2)",name _Ziptiee,_Ziptiee],"PLAIN"];
  systemchat format ["Person who ziptied you: %1",name _Ziptiee];
  format ['SERVER globalChat "%1 ziptied %2";',name _Ziptiee,name player] call broadcast;

  _exitVar = false;

  (format ["%1 switchMove ""%2"";",player, ILG_Restrain_Anim]) call broadcast;
	isstunned = false;
	while {true} do {
		waitUntil {((animationState player) != ILG_Restrain_Anim) || !(player getVariable "restrained") || isstunned || !(alive player)};

		if (!(alive player)) then {
			_exitVar = true;
		};

		if (isstunned) then {
			_exitVar = true;
		};

		if (!(player getVariable "restrained")) then {
			_exitVar = true;
		};

		if (_exitVar) exitWith {
			player setVariable ["restrained", false, true];
			player setVariable ["RestrainedBy", -1, true];
			(format ["%1 switchMove """";",player]) call broadcast;
		};

		if ((vehicle player) == player) then {
			waitUntil {!((vehicle player) != player)};
		};

		if ((animationState player) != ILG_Restrain_Anim) then {
			(format ["%1 switchMove ILG_Restrain_Anim;",player]) call broadcast;
		};
	};
};

Blindfold_User = {
	_Blindfoldee = _this select 0;

	if (player getVariable ["restrained", false]) then {
		if ((player getVariable ["User_Blindfolded", false])) exitWith {
			player setVariable ["User_Blindfolded", false, true];
			if (!isNull _Blindfoldee) then {
				titleText [ format ["Blindfold Removed by %1", name _Blindfoldee], "PLAIN DOWN", 2];
			};
			showChat true;
		} else {
			(_this select 0) spawn {
				player setVariable ["User_Blindfolded", false, true];
				player setVariable ["User_BlindfoldedBy", (getPlayerUID _Blindfoldee), true];
				systemChat format ["Blindfolded by %1 (%2)", (name _Blindfoldee), (getPlayerUID _Blindfoldee)];
				showChat false;
				while {(player getVariable ["User_Blindfolded", false])} do {
					if (!(alive player) || !(player getVariable ["restrained", false])) exitWith {
						player setVariable ["User_Blindfolded", false, true];
					};
					titleText ["", "BLACK FADED", 0]; titleFadeOut 999999;
				};
			};
		};
	};

};



moonshineEnd = {
private ["_logic"];
_logic = (nearestobjects [getpos player, ["LOGIC"], 3] select 0);
if (_logic getVariable [isStillLogic, false]) then {
(nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0) setVariable ["Running", false, true];
deleteVehicle _logic;
} else {hint "Contact a dev";};

};

moonshineAddApples = {
private ["_appleCountATM", "_appleCountStuff", "_still"];
hint "moonshineAddApples";
_still = (nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0);
_appleCountATM = _still getVariable ["applecount", 0];
_appleCountStuff = (_appleCountATM + ("Apple" call INV_GetItemAmount));

if (("Apple" call INV_GetItemAmount) > 0) then {
hint str (_appleCountStuff);
_still setVariable ["applecount", _appleCountStuff, true];
["Apple", (("Apple" call INV_GetItemAmount) * -1)] call INV_AddInvItem;




};};

moonshineTakeShine = {

private ["_MoonshineCount","_freeSpace", "_howManyCanHold", _Still];
_Still = (nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0);
_MoonshineCount = _Still getVariable ["shinecount", 0];
_freeSpace = floor (INV_Tragfaehigkeit - (call INV_GetOwnWeight));
_howManyCanHold = floor (_freeSpace / 6);
if (_MoonshineCount > 0 && _howManyCanHold > 0) then {
["moonshine", _howManyCanHold ] call INV_AddInvItem;
_Still setVariable ["shinecount", (_MoonshineCount - _howManyCanHold)];


};


};
