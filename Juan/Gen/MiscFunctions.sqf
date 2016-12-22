//Just general functions not requiring a new script by Jonny
Juan_Move_obj =
{
	private ["_N_Obj"];
	if (isNil "ILG_Att") then {ILG_Att = false};
	if (ILG_Att) exitWith {ILG_Att = false};
	ILG_Att = true;
	_N_Obj = (nearestobjects[getpos player,ILG_Moveable_Objects,10]select 0);
	steve = _N_Obj;
	if ((player distance _N_Obj) > 5) exitWith {};
	switch (typeOf _N_Obj) do
	{
		case "ZavoraAnim":{_N_Obj attachTo [player,[0,2,4.2]]};
		case "Land_CncBlock_Stripes":{_N_Obj attachTo [player,[0,2,0.4]]};
		case "il_barrier":{_N_Obj attachTo [player,[0,4,0.7]]};
		default {if (true) exitWith {player groupchat "Error"}};
	};
	waitUntil {!ILG_Att};
	detach _N_Obj;
};

serverUptime =
{
	private ["_mins","_hours","_uptime"];
	_mins = floor (time/60);
	_hours = 0;
	if (_mins >= 60) then {_hours = floor (_mins/60); _mins = _mins - (_hours * 60);};
	_uptime = format["%1 Hours %2 Minutes",_hours,_mins];
	_uptime
};

selectWeapon_Juan =
{
	{
		player selectWeapon (_x);
	}count (weapons player);
};

getLicenseDispName =
{
	private ["_license","_ret","_this"];
	_license = _this;
	_ret = "";
	{
		if ((_x select 0) == _license) then
		{
			_ret = _x select 2;
		};
	}count INV_Lizenzen;
	if (_ret == "") exitWith {false};
	_ret
};

Own_This_Vehicle =
{
	private ["_Veh","_Var","_UID","_Side","_Owner"];
	_Veh = _this;
	if (isNil "_Veh") exitWith {false};
	_Var = _Veh getVariable "Veh_Owners";
	if (isNil "_Var") exitWith {false};
	_Owner = false;
	{
		_UID = _x select 0;
		_Side = _x select 1;
		if ((((getPlayerUID player) == _UID)) && (str(side player) == _Side)) then
		{
			_Owner = true;
		};
	}count _Var;
	_Owner;
};

Remove_veh_Owner =
{
	Private["_player","_Veh","_UID","_Side","_Var","_arrayToSet","_A_Element","_V_UID","_V_Side"];
	_player = _this select 0;
	_Veh = _this select 1;
	_UID = (getPlayerUID _player);
	_Side = str(side _player);
	_Var = _Veh getVariable "Veh_Owners";
	_arrayToSet = [];
	_A_Element = false;
	{
		_V_UID = _x select 0;
		_V_Side =  _x select 1;

		if ((_V_UID == _UID) && (_V_Side == _Side)) then
		{
			_A_Element = True;
		}
		else
		{
			_arrayToSet = _arrayToSet + [_x];
		};
	}count _Var;
	if (!_A_Element) exitWith {titleText ["The selected player doesn't even have those keys!","plain",3]};
	_Veh setVariable ["Veh_Owners",_arrayToSet,true];
};

Add_veh_Owner =
{
	private ["_player","_veh","_var","_arr","_V_Owners","_Side","_V_UID","_V_Side","_AlreadyHasKeys"];
	_player = _this select 0;
	_veh = _this select 1;
	_V_Owners = _veh getVariable "Veh_Owners";
	_P_UID = (GetPlayerUID _player);
	_alreadyHasKeys = False;
	_Side = str(side _player);
	{
		_V_UID = _x select 0;
		_V_Side = _x select 1;

		if ((_V_UID == _P_UID) && (_V_Side == _Side)) then
		{
			_alreadyHasKeys = True;
		};
	}count _V_Owners;
	if (_alreadyHasKeys) exitWith {titleText ["The selected player already has those keys!","Plain",2]};
	_V_Owners = _V_Owners + [[_P_UID,_Side]];
	_veh setVariable ["Veh_Owners",_V_Owners,true];
};

Is_Player_Veh =
{
	private ["_ret","_Player_Vehicle_Var","_Vehicle"];
	_ret = false;
	_Vehicle = _this;
	_Player_Vehicle_Var = _Vehicle getVariable "Player_Vehicle";
	if (_Player_Vehicle_Var) then {_ret = true};
	_ret
};


Vehicle_Array_Svr_Check =
{
	_this spawn
	{
		while {true} do
		{
			sleep 120;
			{
				if (!(_x in INV_ServerVclArray)) then
				{
					INV_ServerVclArray = INV_ServerVclArray + [_x];
					publicVariable "INV_ServerVclArray";
				};
			}count INV_VehicleArray;
		};
	};
};

ILG_MP_DL_Reminder =
{
	Private "_this";
	waitUntil {!isNil "ILG_Introran"};
	_this spawn
	{
		waitUntil {ILG_Introran == 1};
		while {!ILG_Has_Modpack} do
		{
			sleep (random (300)) + 300;
			titleText[format["\nYou're not running @ILG\nInstall it from IslandLifeLiberation.net"],"Plain Down"];
		};
	};
};

Juan_SetStatVars =
{
	Private ["_Bank","_Money","_INV"];
	_Bank = bnkgeld;
	_Money = 'Mishy' call INV_GetItemAmount;
	_INV = INV_InventarArray;
	_license = INV_LizenzOwner;
	player setVariable ["PlayerStats",[_Bank,_Money,_INV,_license],true];
};

Emita_GetGridRef =
{
	private ["_Pos","_X","_Y","_sY","_sX","_Result"];
	_Pos = _this select 0;
	_X = floor ((getPos _Pos select 0) / 100);
	_Y = floor ((getPos _Pos select 1) / 100);
	_Y = 50 - _Y;
	_sX = str(_X);
	_sY = str(_Y);
	switch (true) do
	{
		case ((_X < 10) && (_Y < 10)):
		{
			_Result = "00"+_sX+"00"+_sY;
		};
		case ((_X < 10) && (_Y > 10)):
		{
			_Result = "00"+_sX+"0"+_sY;
		};
		case ((_Y < 10) && (_X > 10)):
		{
			_Result = "0"+_sX+"00"+_sY;
		};
		default
		{
			_Result = "0"+_sX+"0"+_sY;
		};
	};
	_Result;//Return
};

Hotkey_DialogSetup =
{
	Private ["_Item","_x","_Array"];
	createdialog "ILG_Hotkey";
	lbAdd [1192,"7"];
	lbAdd [1192,"8"];
	lbAdd [1192,"9"];
	_Array = [];
	{
		_Item = (_x select 0) call INV_getitemName;
		if ((_x select 1) > 0) then
		{
			lbAdd [1193,format ["%1",_Item]];
			_Array = _Array + [_x];
		};
	} count INV_InventarArray;
	INV_InventarArray = _Array;
	lbAdd [1194,"Use"];
	lbAdd [1194,"Drop"];
};

Hotkey_Configuration =
{
	Private ["_UserKey","_UserINV","_UserUseDrop","_Error"];
	_UserKey = lbCurSel 1192;
	_UserINV = lbCurSel 1193;
	_UserUseDrop = lbCurSel 1194;
	_Error = false;
	switch (_UserKey) do
	{
		case 0:	{_UserKey = 7};
		case 1:	{_UserKey = 8};
		case 2: 	{_UserKey = 9};
		default	{_Error = true};
	};
	if (_UserINV == -1) then {_Error = true};
	_UserINV = (INV_InventarArray select _UserINV) select 0;
	if (_UserUseDrop == -1) then {_Error = true};
	switch (_UserUseDrop) do
	{
		case 0:	{_UserUseDrop = "use"};
		case 1:	{_UserUseDrop = "drop"};
		default 	{_Error = true};
	};
	if (_Error) exitWith {player groupchat "You didn't fill in all the fields!";};

	switch (_UserKey) do
	{
		case 7:
		{
			if (_UserUseDrop == "use") then
			{
				call compile format ['Hotkey_7 = {if (("%1" call INV_GetItemAmount) <= 0) exitWith {Player groupchat "Inventory item not found."};["use","%1",1] execVM "INVactions.sqf"};',_UserINV];
			};
			if (_UserUseDrop == "drop") then
			{
				call compile format ['Hotkey_7 = {if (("%1" call INV_GetItemAmount) <= 0) exitWith {Player groupchat "Inventory item not found."};["%1",1] execVM "Drop.sqf";};',_UserINV];
			};
		};

		case 8:
		{
			if (_UserUseDrop == "use") then
			{
				call compile format ['Hotkey_8 = {if (("%1" call INV_GetItemAmount) <= 0) exitWith {Player groupchat "Inventory item not found."};["use","%1",1] execVM "INVactions.sqf"};',_UserINV];
			};
			if (_UserUseDrop == "drop") then
			{
				call compile format ['Hotkey_8 = {if (("%1" call INV_GetItemAmount) <= 0) exitWith {Player groupchat "Inventory item not found."};["%1",1] execVM "Drop.sqf";};',_UserINV];
			};
		};

		case 9:
		{
			if (_UserUseDrop == "use") then
			{
				call compile format ['Hotkey_9 = {if (("%1" call INV_GetItemAmount) <= 0) exitWith {Player groupchat "Inventory item not found."};["use","%1",1] execVM "INVactions.sqf"};',_UserINV];
			};
			if (_UserUseDrop == "drop") then
			{
				call compile format ['Hotkey_9 = {if (("%1" call INV_GetItemAmount) <= 0) exitWith {Player groupchat "Inventory item not found."};["%1",1] execVM "Drop.sqf";};',_UserINV];
			};
		};
	};
	player groupchat "Hotkey set!";
	closeDialog 0;
};

SUV_Gun_Hatch =
{
	_this spawn
	{
		if (((vehicle player) animationPhase "HideGun_01")==1) then
		{
			(vehicle player) animate ["CloseCover1", 0];
			sleep 0.2;
			(vehicle player) animate ["CloseCover2", 0];
			sleep 1;
			(vehicle player) animate ["HideGun_01", 0];
			systemChat "SUV Gunner Opened.";
		}
		else
		{
			if (alive(gunner (vehicle player))) exitWith {systemChat "Theres a player in the gunner seat!";};
			(vehicle player) animate ["HideGun_01", 1];
			sleep 1;
			(vehicle player) animate ["CloseCover2", 1];
			sleep 0.2;
			(vehicle player) animate ["CloseCover1", 1];
			systemChat "SUV Gunner Closed.";
		};
	};
};

SUV_Gunner_Checks =
{
	_this spawn
	{
		private [];
		while {true} do
		{
			waitUntil {((typeOf vehicle player) == "ArmoredSUV_PMC") && ((Gunner (Vehicle player)) == player) && (((vehicle player) animationPhase "HideGun_01")==1)};
			player action ["getOut", vehicle player];
			systemchat "You cannot get into this position!";
			waitUntil {vehicle player == player};
		};
	};
};

Vehicle_Despawn_SvrLoop =
{
	_this spawn
	{
		Private ["_ServerVehicle","_x","_Set","_Var","_NotImpoundable","_StartTime"];
		_NotImpoundable = [/* Classnames of big choppers were here, but we have seperate aviation spawns from impound now. */];
		while {isserver} do
		{
			uiSleep (5 * 50);
			{
				_PlayerVehicle = _x getVariable "Player_Vehicle";
				if ((_x distance (getPos impoundarea1)) < 500) then {_PlayerVehicle = false;};
				if (!(isNil "_PlayerVehicle")) then {
					if (_PlayerVehicle) then
					{
						_Var = _x getVariable "Veh_Despawn";
						_Set = false;
						if (isNil "_Var") then {_x setVariable ["Veh_Despawn",[(getPos _x),0],true];};
						if ((count crew _x) > 0) then {_Set = true;};
						if ((typeOf _x) in _NotImpoundable) then {_Set = true;};
						if ((_x distance (getMarkerPos "ILG_CarPark_1")) < 16) then {_Set = true;};
						if ((_x distance (getMarkerPos "ILG_CarPark_2")) < 16) then {_Set = true;};
						if ((_x distance (getMarkerPos "ILG_CarPark_3")) < 16) then {_Set = true;};
						if (!_Set) then
						{
							if (((_Var select 0) distance _x) < 30) then
							{
								//Been inactive
								if ((_Var select 1) >= 4) then
								{
									//Been inactive for a long time//Call despawn/impound
									_x attachTo [impoundarea1,[0,0,30]];
									_x setVariable ["Veh_Despawn",[(getPos _x),0],true];
								}
								else
								{
									//Not been inactive long enough for despawn, Just add 1 to value of (_Var select 1)
									_x setVariable ["Veh_Despawn",[(_Var select 0),((_Var select 1)+1)],true];
								};
							}
							else
							{
								//Been active, reset var of Veh_Despawn
								_x setVariable ["Veh_Despawn",[(getPos _x),0],true];
							};
						};
					};
				};
			} count vehicles;
		};
	};
};

VON_Disable =
{
	/*
		This function is heavily based of KK's blog method. Credits to him
		http://killzonekid.com/arma-scripting-tutorials-whos-talking/
	*/
	_this spawn
	{
		Private ["_Warning","_WarningMax"];
		_Warning = 0;
		_WarningMax = 5000; //1000 = 1 second (Approx)
		while {true} do
		{
			if (isciv) then {waitUntil {(ctrlText (findDisplay 63 displayCtrl 101) == (localize "str_channel_Global") && !(isNull (findDisplay 55))) OR (ctrlText (findDisplay 63 displayCtrl 101) == (localize "str_channel_Side") && !(isNull (findDisplay 55)))};};
			if (iscop) then {waitUntil {(ctrlText (findDisplay 63 displayCtrl 101) == (localize "str_channel_Global")) && !(isNull (findDisplay 55))};};
			titleText [format["Remove yourself from global VON immediately.\nWe do not allow talking in global VON."],"PLAIN"];
			_Warning = _Warning + 1;
			playSound "VON_Alert";
			hint format ["***Warning***\nYou have %1 warnings left before\n being kicked for using VON.",_WarningMax-_Warning];
			if (_Warning > _WarningMax) then {endMission "END1";};
		};
	};
};

Cur_RemoveActionText =
{
	//This is used to un-fuck the buggy nametags made via addAction
	_this spawn
	{
		Private ["_TagArray","_x"];
		_TagArray = playerarray+shopusearray+bankflagarray;
		_lastCur = "";
		while {true} do
		{
			_cur = cursortarget;
			waitUntil {(cursortarget != _cur) && (str(cursortarget) != _lastCur)};
			_TagArray = playerarray+shopusearray+bankflagarray;
			10 cutRsc ["ENT_playertags", "PLAIN"];
			{if (!isnil "_x") then {_x call ENT_addTag};} count vehicles;
			{if (!isnil "_x") then {_x call ENT_addTag};} count (playerarray - [player]);
			{if (!isnil "_x") then {_x call ENT_addTag};} count (bankflagarray);
			{if (!isnil "_x") then {_x call ENT_addTag};} count (drugsellarray);
			{if (!isnil "_x") then {_x call ENT_addTag};} count (shopusearray);
			_lastCur = str(cursortarget);
		};
	};
};

Server_SelectVICECivNumber =
{
	private ["_Number"];
	if (!isserver) exitWith {};
	_Number = round(random (50));
	VICE_CIVNUMBER = format ["Civ%1",_Number];
	publicVariable "VICE_CIVNUMBER";
};

P_DeathLoop =
{
	_this spawn
	{
		while {true} do
		{
			waituntil {!alive player};
			waitUntil {alive player};
			removeAllWeapons player;
			removebackpack player;
			{player removeMagazine _x}count magazines player;
		};
	};
};

Player_EH_Setup =
{
	player removeAllEventHandlers "HandleDamage";
	player removeAllEventHandlers "Fired";
	player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun.sqf";}];
	player addEventHandler ["fired",{_this execVM "fired.sqf"}];
	player addEventHandler ["HandleDamage",{_this call DDOPP_taser_handleHit}];
	player addEventHandler ["handleDamage", {_this call compile preprocessfile "sethit.sqf"}];
};

PIT_Effects =
{
	_this spawn
	{
		if (iscop) exitWith {};
		waitUntil {(((vehicle player) getVariable "hasbeenpitted") == 1)};
		while {true} do
		{
			if (((vehicle player) getVariable "hasbeenpitted") == 0) exitWith {player groupchat "Pit effects removed";};
			if ((speed (vehicle player)) > 0) then {(vehicle player) setFuel ((Fuel (vehicle player)) - 0.005);};
			sleep 0.05;
		};
	};
};

Can_Interact =
{
	//This returns either (True) or (false) to whether the player can interact with things
	private [];
	_Ret = true;
	if (!alive player) then {_Ret = false};
	if ((animationState player) == ILG_Restrain_Anim) then {_Ret = false};
	if (player getVariable "isTazed") then {_Ret = false};
	//To be expanded w/ more error checks
	_Ret
};


Rob_Station_Check = {

_counter = 30;
timelefttorob = _counter;
publicVariable "timelefttorob";

while {true} do
	{

	_station = nearestObject [player, "UNBasicAmmunitionBox_EP1"];

	if (player distance _station > 6) exitWith {player sideChat "You moved too far from the station!"; titleText ["","PLAIN DOWN"]; titleFadeOut .1;  _station setVariable ["beingrobbed",0,true];};
	if (timelefttorob < 1) exitWith {titleText ["","PLAIN DOWN"]; titleFadeOut .1; _station setVariable ["beingrobbed",0,true];};
	if (!alive player) exitwith {_station setVariable ["beingrobbed",0,true];};
	if ((player getVariable ["isTazed",false])) exitWith {titleText ["","PLAIN DOWN"]; titleFadeOut .1; _station setVariable ["beingrobbed",0,true];};
	if (!(robbingGasStation)) exitWith {titleText ["","PLAIN DOWN"]; titleFadeOut .1; _station setVariable ["beingrobbed",0,true];};

	titleText [format ["ROBBING STATION\nTime Remaining: %1",_counter], "plain down"];

	_counter = _counter - 1;
	timelefttorob = _counter;
	publicVariable "timelefttorob";
	sleep 1;
	};

};

Call_ESU = {
	if (ESU_Call_Cooldown) exitWith {systemChat "Sorry, your cooldown for calling ESU is still active, please wait a few minutes before calling ESU again.";};
	if ((playersNumber INDEPENDENT) == 0) exitWith {systemChat "Sorry but there's currently no ESU available at the moment, please try again later";};
	ESU_Call_Cooldown = true;
	(format ['
		if (player in esuslots) then {
			player sideChat "%1 (%2) requires assistance and his location has been marked on the map! (GRID: %3)";
			playSound "beepSimple";
			_Player = %2;
			if ((getMarkerColor "Assistance_Marker_%2") != "") then {
				deleteMarkerLocal "Assistance_Marker_%2";
			};
			_Marker = createMarkerLocal ["Assistance_Marker_%2", [0,0]];
			_Marker setMarkerShapeLocal "ICON";
			_Marker setMarkerTypeLocal "Warning";
			"Assistance_Marker_%2" setMarkerColorLocal "ColorGreen";
			"Assistance_Marker_%2" setMarkerTextLocal "%1 Has requested EMS assistance here!";
			"Assistance_Marker_%2" setMarkerPosLocal getPos %2;
			"Assistance_Marker_%2" setMarkerSizeLocal [1,1];
			[] spawn {
				while {(getMarkerColor "Assistance_Marker_%2") != ""} do {
					sleep 600;
					deleteMarkerLocal "Assistance_Marker_%2";
					systemChat "The marker for %1 has been cleared.";
				};
			};
		};
		', name player, player, [player] call Emita_GetGridRef]) call broadcast;
		systemChat "ESU have been notified of your location.";
		systemChat "Since you've just requested EMS, we've blocked any phone calls from your phone to our system for 5 minutes";
		[] spawn {
			sleep 300;
			ESU_Call_Cooldown = false;
			systemChat "Your ESU block has been lifted and you can now call ESU again";
		};
};



/*
GetInEventHandler_AddCopActions = {
	if (((_this select 1) == "driver")) then {
		Interaction_AttemptPIT = (_this select 2) addAction ["Attempt PIT", "pit.sqf", [], -1, false];
	};
	Interaction_PolicePC = (_this select 2) addAction ["Police PC", "policePC\pages\login.sqf"];
	Interaction_RequestBackup = (_this select 2) addAction ["Request Backup", "policePC\fnc\requestbackup.sqf"];
	_Vehicle_Role = assignedVehicleRole player;

	_SeatChangeFnc = {
		waitUntil {(_Vehicle_Role != assignedVehicleRole (_this select 2)) || !((_this select 2) in (_this select 0))};

		if (!((_this select 2) in (_this select 0))) exitWith {}; // Prevents extra threads being used unnessassarly

		if (_Vehicle_Role == "driver") then {
			removeAction Interaction_AttemptPIT;
		};

		_Vehicle_Role = assignedVehicleRole (_this select 2);
		if (_Vehicle_Role == "driver") then {
			Interaction_AttemptPIT = (_this select 2) addAction ["Attempt PIT", "pit.sqf", [], -1, false];
		};

		_this spawn _SeatChangeFnc;
	};

	_this spawn _SeatChangeFnc;
};
*/
GetInEventHandler_UpdateVehicleUI = {
	_Vehicle_Picture = getText (configFile >> "cfgVehicles" >> typeOf (_this select 0) >> "picture");
	_Vehicle_DisplayName = getText (configFile >> "cfgVehicles" >> typeOf (_this select 0) >> "displayName");
	_Vehicle_Tuning = (vehicle player) getVariable "tuning";
	_Player_HasKeys = if ((Vehicle player) call Own_This_Vehicle) then {"You have keys to this vehicle"}else{"You don't have the keys to this vehicle!"};
	_Vehicle_HasAlarm = if ((!(isNil (vehicle player) getVariable "Car_Alarm") && (vehicle player) getVariable "Car_Alarm")) then {"<br />This vehicle has a Car Alarm installed."} else {""};
	_Vehicle_SpeedUpgradeLevel = if (isNil "_Vehicle_Tuning") then {"0"} else {_Vehicle_Tuning};
	hintSilent parseText Format ["<t size='1' color='#FF0000'>Vehicle Info<t color='#FFFFFF' size='0.75'><br />%1<br /><img size='5' image='%2'/><br />License Plate: %5<br />%4<br />Speed Upgrade: %3%6",_Vehicle_DisplayName,_Vehicle_Picture,_Vehicle_SpeedUpgradeLevel,_Player_HasKeys, (vehicle player), _Vehicle_HasAlarm];
	sleep 5;
	hintSilent "";
};
/*
GetOutEventHandler_RemoveCopActions = {
	if ((_this select 1) == "driver") then {
		(_this select 2) removeAction Interaction_AttemptPIT;
	};
	(_this select 2) removeAction Interaction_PolicePC;
	(_this select 2) removeAction Interaction_RequestBackup;
};*/
