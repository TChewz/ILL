

private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

if(isstunned) exitwith

	{

	if(_key == 50)then{_handled = true};
	if(_key == 11)then{_handled = true};

	_handled

	};

switch _key do
{
	//Spacebar
	case 57:
	{
		if (vehicle player != player) exitWith {};
		if (!(call Can_Interact)) exitWith {};
		if ((speed player) < 23) exitWith {};
		if (isNil "Player_Jump") then {Player_Jump = false};
		if (Player_Jump) exitWith {};
		Player_Jump = true;
		_handled = true;
		//format ['%1 playMove "ActsPercMrunSlowWrflDf_FlipFlopPara"',player] call broadcast;
		[] spawn {
			sleep 5;
			Player_Jump = false;
		};
	};
	//P Key
	case 25:
	{
		if(!INV_shortcuts)exitwith{};
		_handled=true;
		if(dialog)exitwith{closeDialog 0;};
		if (jonOpenDLG) exitWith {};
		jonOpenDLG = true;
		[] call playerMenuDLG;
		[] spawn{uiSleep 1; jonOpenDLG = false;};
	};
	//Map
	case (actionKeys "ShowMap" select 0):
	{
		if !(player getVariable ["User_Blindfolded", false]) then {
			[] spawn JuansCopMarkers;
			true
		} else {
			false
		};

	};
	//7 key
	case 8:
	{
		if (!INV_shortcuts)exitwith{};
		if (isNil "Hotkey_7_Sleep") then {Hotkey_7_Sleep = false;};
		if (Hotkey_7_Sleep) exitWith {};
		Hotkey_7_Sleep = true;
		call Hotkey_7;
		_handled=true;
		sleep 1.5;
		Hotkey_7_Sleep = false;
	};
	//8 key
	case 9:
	{
		if (!INV_shortcuts)exitwith{};
		if (isNil "Hotkey_8_Sleep") then {Hotkey_8_Sleep = false;};
		if (Hotkey_8_Sleep) exitWith {};
		Hotkey_8_Sleep = true;
		call Hotkey_8;
		_handled=true;
		sleep 1.5;
		Hotkey_8_Sleep = false;
	};
	//9 key
	case 10:
	{
		if (!INV_shortcuts)exitwith{};
		if (isNil "Hotkey_9_Sleep") then {Hotkey_9_Sleep = false;};
		if (Hotkey_9_Sleep) exitWith {};
		Hotkey_9_Sleep = true;
		call Hotkey_9;
		_handled=true;
		sleep 1.5;
		Hotkey_9_Sleep = false;
	};
	//0 key
	case 11:
	{
		if(!INV_shortcuts)exitwith{};
		if (dialog) exitWith {closeDialog 0;};
		closeDialog 0;
		createDialog "MainMenu";
	};

	//New tool
	case 62:
	{
		if(dialog)exitwith{closeDialog 0;};
		if(!INV_shortcuts)exitwith{};
		if(!(isClass(configFile >> "CfgPatches" >> "Lin_Admin")))exitWith{};
		_handled=true;
		[] call LinLib_fnc_Admin_Start;
	};
	//y key
	case 21:
	{
	if(dialog)exitwith{closeDialog 0;};
	if(!INV_shortcuts)exitwith{};
	_handled=true;
	[] execVM "animdlgopen.sqf";

	};

	//6 key
case 7:
{
	if(dialog)exitwith{closeDialog 0;};
	if(!INV_shortcuts)exitwith{};
	if(_shift) then
	{
	if(!INV_shortcuts)exitwith{};
	_handled=true;
	[] execVM "8675309.sqf";
	}
	else
	{
	if(!INV_shortcuts)exitwith{};
	[0,0,0,["penalcode"]] execVM "maindialogs.sqf";
	};
};

	//F5 key
	case 63:

	{

	if(INV_shortcuts)then{INV_shortcuts=false; titletext["IL keys off", "PLAIN DOWN"];[] execVM "actions\actionsRemove.sqs"}else{INV_shortcuts=true; titletext["IL keys on", "PLAIN DOWN"];[] execVM "actions\copactions.sqf"};};
	//L key
	case 38:

	{

	if(!INV_shortcuts)exitwith{};

	_vcls = nearestobjects [getposatl player, ["LandVehicle", "Air", "ship"], 7];
	_vcl = _vcls select 0;

	if(!(_vcl call Own_This_Vehicle))exitwith{player groupchat "You do not have the keys to this vehicle.";_handled=true;};
	["schluessel", str(_vcl), 0] execVM "keys.sqf";
	_handled=true;

	};

	//T key
	case 20:

	{

	if(!INV_shortcuts)exitwith{};
	if(dialog)exitwith{closeDialog 0;};

	_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship", "TKOrdnanceBox_EP1"], 12];
	_vcl = _vcls select 0;
	if (player != driver _vcl)exitwith{player groupchat "You must be in the drivers seat to get to the trunk";};
	if(!(_vcl in INV_VehicleArray) and typeof _vcl == "TKOrdnanceBox_EP1")exitwith{player groupchat "You do not have the keys to this hideout.";};
	if(!(_vcl call Is_Player_Veh))exitwith{player groupchat "You do not have the keys to this vehicle.";};
	if(!isnull _vcl)then{call compile format['[0,0,0,["%3", "public", ["vcl", "%2", %1]]] execVM "storage.sqf";', _vcl, (typeOf _vcl), format["%1_storage", _vcl]];};

	};
	//Left Shift key
	case 42:

	{

	_vcl = vehicle player;

	if(_vcl == player)exitwith{};

	_nos	= _vcl getvariable "nitro";

	if(isEngineOn _vcl and !isnil "_nos") then

		{

		_vel  = velocity _vcl;
		_spd  = speed _vcl;
		_fuel = fuel _vcl;
		_vcl setVelocity [(_vel select 0) * 1.01, (_vel select 1) * 1.01, (_vel select 2) * 0.99];
		_vcl setfuel (_fuel - 0.0003);

		};

	};
		//U key
  	case 22: {
			if(!INV_shortcuts) exitWith {false};
		  if (!(iscop)) exitWith {false};
			if (((vehicle player) != player) && (driver (vehicle player) == player)) then {
				_target = cursorTarget;
				_string = "";
				if (_target isKindOf "LandVehicle") then {
					_speed = speed _target;
					_speedS = if(_speed > 200) then {"Over 200 kmph"} else {format["%1 kmph", _speed]};
					_string = format["SPEED- %1		VEHICLE- %2", _speedS, _target];
				} else {
					_string = "INVALID TARGET";
				};
				titleText[_string, "plain down", 0.1];
			};
		};

	//E key
	case 18:

	{

	//if(isstunned) exitwith{};
	if(!INV_shortcuts)exitwith{};
	if(keyblock)exitwith{};
	if(dialog)exitwith{closeDialog 0;};
	if(local_arrest == 1)exitwith{};

	private ["_civ"];

	for [{_i=1}, {_i < 3}, {_i=_i+1}] do

		{

		if(vehicle player != player) exitwith{};

       		_range = _i;
       		_dirV = vectorDir vehicle player;
       		_pos = player modelToWorld [0,0,0];
        	_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
       	 	_men    = nearestobjects [_posFind,["Man", "RUBasicAmmunitionBox", "UNBasicAmmunitionBox_EP1","RUSpecialWeaponsBox","Barrels"], 1] - [player];
		_atms   = nearestObjects [_posFind,["Man", "tcg_ATM"],2];
		_civ    = _men select 0;
		_atm	= _atms select 0;

		if(iscop and !(isnull _civ) and _civ in civarray) exitwith

			{

			_i = 4;
			call compile format['[0,0,0, ["civmenu", "%1", %1]] execVM "interact.sqf";', _civ];
			_handled=true;

			};

		if(!(isnull _civ) and _civ in shopusearray) exitwith

			{

			_i = 4;
			if(iscop and _civ in drugsellarray)exitwith{_civ execVM "drugsearch.sqf"};
			_id = _civ call INV_getshopnum;
			diag_log "Executing Shopdialogs.sqf";
			[0,0,0,[_id]] execVM "shopdialogs.sqf";
			_handled=true;

			};

		if(!(isnull _atm) and _atm in bankflagarray) exitwith

			{

			_i = 4;
			if(!local_useBankPossible)exitwith{hint "The ATM rejected your card"};
			[] execVM "atm.sqf";
			_handled=true;

			};

		};

	if(_handled)exitwith{};

	if(vehicle player == player) exitwith

		{

		private ["_vcl"];

		for [{_i=1}, {_i < 3}, {_i=_i+1}] do

			{

       			_range = _i;
       			_dirV = vectorDir vehicle player;
       			_pos = player modelToWorld [0,0,0];
        		_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
       	 		_vcls    = nearestobjects [_posFind,["LandVehicle", "Air", "ship"], 2];
			_vcl     = _vcls select 0;

			if(!(isnull _vcl))exitwith{_i = 4};

			};

		if(locked _vcl)exitwith{};

		if(_vcl emptyPositions "Driver" > 0)exitwith   {player action ["getInDriver", _vcl]};
		if(_vcl emptyPositions "Gunner" > 0)exitwith   {player action ["getInGunner", _vcl]};
		if(_vcl emptyPositions "Commander" > 0)exitwith{player action ["getInCommander", _vcl]};
		if(_vcl emptyPositions "Cargo" > 0)exitwith    {player action ["getInDriver", _vcl];_vcl spawn {keyblock=true;sleep 0.5;player moveincargo _this; keyblock=false;};};

		};

	_vcl  = vehicle player;

	if(_vcl != player) exitwith

		{
		if(_vcl == bus1 and speed _vcl > 10)exitwith{player groupchat "The vehicle is moving too fast"};
		if(_vcl == bus1)exitwith{moveout player};
		if(locked _vcl)exitwith{player groupchat "The vehicle is locked."};
		if(speed _vcl > 30)exitwith{player groupchat "The vehicle is moving too fast"};
		player action ["getOut", _vcl];

		};

	};


	case 33:

	{

	if(!INV_shortcuts)exitwith{};

	if(_shift and (vehicle player == player) and call INV_isArmed) then

		{

		_men = nearestobjects [getposatl player, ["Man"], 2] - [player];

		_men spawn

			{

			(format ["%1 switchmove ""%2"";", player, "AwopPercMstpSgthWnonDnon_end"]) call broadcast;
			sleep 0.01;
			if(count _this > 0) then

				{

				_civ = _this select 0;
 				if(_civ distance player > 2 or !isPlayer _civ)exitwith{};
				(format ["if (player == %1) then {[""hit"", %2, ""Melee"", 1] execVM ""stun.sqf""};", _civ, player]) call broadcast;
				if (_civ getVariable "restrained") then {_civ setVariable ["restrained",false,true];};
				player groupchat "you stunned this player!";

				};

			};

		_handled=true;

		};

	};

	//H key
	case 35:

	{

	if(!INV_shortcuts)exitwith{};

	if(iscop) then {if(vehicle player != player)then{[0,0,0,["activate"]] execVM "siren.sqf"; _handled=true;};};
	//if(playerSide == resistance) then {if(vehicle player != player)then{[0,0,0,["activate"]] execVM "siren_un.sqf"; _handled=true;};};

	if (vehicle player != player) exitWith {};
	if (_shift && alive player) exitWith
	{
		//if ((call INV_isArmed) && !(isNil "R_Weapon_Holster")) exitWith {player groupchat "You already have a holstered rifle.";};
		[0] execVM "WeaponHolster.sqf"; //PrimaryWeapon
		_handled = true;
	};
	if (alive player) exitWith
	{
		//if ((call INV_isArmed) && !(isNil "P_Weapon_Holster")) exitWith {player groupchat "You already have a holstered rifle.";};
		[1] execVM "WeaponHolster.sqf"; //SecondaryWeapon
		_handled = true;
	};
};

	//tilde key
	case 41:
	{
		if(!INV_shortcuts)exitwith{};
		if(dialog)exitwith{closeDialog 0;};
		createdialog "ILG_policepc_main";
		_handled = true;
	};

	//1 key
	case 2:
	{
		if(!INV_shortcuts)exitwith{};
		_handled=true;
		if(dialog)exitwith{closeDialog 0;};
		if (jonOpenDLG) exitWith {};
		jonOpenDLG = true;
		[] call mainMenuDLG;
		[] spawn{uiSleep 1; jonOpenDLG = false;};
	};

	//3 key
	case 4:

	{

	if(!INV_shortcuts)exitwith{};

	if(keyblock or vehicle player != player)exitwith{};

	keyblock=true; [] spawn {sleep 2; keyblock=false;};

	player playmove "amovpercmstpssurwnondnon";
	_handled=true;

	};

	//5 key
	case 6:

	{
		if(!INV_shortcuts)exitwith{};
		if(keyblock or vehicle player != player)exitwith{};
		keyblock=true; [] spawn {sleep 3; keyblock=false;};
		["use", "spikestrip"] execvm "createobject.sqf";
		_handled=true;
	};

	//4 key
	case 5:

	{

	if(!INV_shortcuts)exitwith{};
	if(dialog)exitwith{closeDialog 0;_handled=true;};
	if ((player == cop2) && (player distance dispatchdesk <= 4)) then
	{
		execVM "dispatchsys\dlgopen.sqf";
	}
	else
	{
		[0,1,2,["coplog"]] execVM "maindialogs.sqf";
	};
	_handled=true;

	};

	//W key
	case 17:

	{

	_vcl = vehicle player;
	_type = typeof vehicle player;
	_class = typeOf _vcl;
	if(_vcl == player)exitwith{};
	//player groupchat format["%1", _class];
	if(typeof _vcl == "Smallboat_1" or typeof _vcl == "Smallboat_2") then

		{

		_vel = velocity _vcl;
		_spd = speed _vcl;
		if(_spd <= 20)then{_vcl setVelocity [(_vel select 0) * 1.001, (_vel select 1) * 1.001, (_vel select 2) * 0.99]};
		if(_spd <= 30 and _spd > 20)then{_vcl setVelocity [(_vel select 0) * 1.002, (_vel select 1) * 1.002, (_vel select 2) * 0.99]};
		if(_spd <= 40 and _spd > 30)then{_vcl setVelocity [(_vel select 0) * 1.003, (_vel select 1) * 1.003, (_vel select 2) * 0.99]};

		};

	if(typeof _vcl == "Fishing_Boat") then

		{

		_vel = velocity _vcl;
		_spd = speed _vcl;
		if(_spd <= 30)then{_vcl setVelocity [(_vel select 0) * 1.001, (_vel select 1) * 1.001, (_vel select 2) * 0.99]};

		};

	if(_class in cararray) then
	{
	_vel = velocity _vcl;
	_vcl setVelocity [(_vel select 0) * 1.005, (_vel select 1) * 1.005, (_vel select 2) * 0.99];

	};
	_lvl = _vcl getvariable "tuning";
	if(isEngineOn _vcl and !isnil "_lvl") then

		{

		_vel = velocity _vcl;
		_spd = speed _vcl;
		if(_lvl == 1)then{_vcl setVelocity [(_vel select 0) * 1.006, (_vel select 1) * 1.006, (_vel select 2) * 0.99]};
		if(_lvl == 2)then{_vcl setVelocity [(_vel select 0) * 1.008, (_vel select 1) * 1.008, (_vel select 2) * 0.99]};
		if(_lvl == 3)then{_vcl setVelocity [(_vel select 0) * 1.014, (_vel select 1) * 1.010, (_vel select 2) * 0.99]};
        if(_lvl == 4)then{_vcl setVelocity [(_vel select 0) * 1.020, (_vel select 1) * 1.012, (_vel select 2) * 0.99]};
        if(_lvl == 5)then{_vcl setVelocity [(_vel select 0) * 1.026, (_vel select 1) * 1.014, (_vel select 2) * 0.99]};

		};
	};

	//G Key
	case 34:
	{
		if(_shift) then
		{
			if (vehicle player == player) exitWith {player groupChat "You must be in a vehicle to store your rifle.";};
			if (primaryWeapon player == "") exitWith {player groupChat "You do not have a rifle equipped!";};
			_primWeap = primaryWeapon player;
			player removeWeapon _primWeap;
			vehicle player addWeaponCargoGlobal [_primWeap,1];
			player groupchat "Your rifle has been stored in the gear.";
			_handled = true;
		};
	};

	case 24: {
		if (isNil "Ear_Plugs") then {Ear_Plugs = false};
		if (!Ear_Plugs) then {
			1 fadeSound 0.2;
			titleText [format["Earplugs In"], "PLAIN DOWN"];
			Ear_Plugs = true;
		} else {
			1 fadeSound 1;
			titleText [format["Earplugs Out"], "PLAIN DOWN"];
			Ear_Plugs = false;
		};
	};
};

_handled;
