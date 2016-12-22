/*
	General Functions for Cop Side
*/

Restrain_Civilian = {

	_Restrained = (player getVariable ["restrained", false]);
	_RestrainedBy = (player getVariable ["RestrainedBy", -1]);
	
	if (_Restrained) then {
		player setVariable ["restrained", false, true];
		player setVariable ["RestrainedBy", -1, true];
		if (_RestrainedBy == 0) then {
			systemChat format ["%1 has uncuffed you", name (_this select 0)];
		} else {
			systemChat format ["%1 has broken the zipties that were restraining you", name (_this select 0)];
		};
	} else {
		private ["_Restrainee","_exitVar"];
		_Restrainee = _this select 0;
		if (_Restrainee == cop1) then {
		
		if (isNull _Restrainee || !alive _Restrainee || !(_Restrainee in coparray)) exitWith {};
		} else {
		
		if (isNull _Restrainee || !alive _Restrainee || isCop || !(_Restrainee in coparray)) exitWith {};
		
		};
		
		

		player setVariable ["restrained",true,true];
		player setVariable ["RestrainedBy", 0, true];

		titleText[format["You've been handcuffed by %1(%2)",name _Restrainee,_Restrainee],"PLAIN"];
		systemchat format ["Person who handcuffed you: %1",name _Restrainee];
		format ['SERVER globalChat "%1 handcuffed %2";',name _Restrainee,name player] call broadcast;

		(format ["%1 switchMove ILG_Restrain_Anim;",player]) call broadcast;
		isstunned = false;
			
		[] spawn
		{
			private ["_currentTime"];
			while {(player getVariable "restrained")} do
			{
				_currentTime = time;
				waitUntil {(time - _currentTime) > (5 * 60)};
				_typeOfcopsArray = [];
				{if (_x call ISSE_UnitExists) then {_typeOfcopsArray = _typeOfcopsArray + [(typeOf vehicle _x)];};}foreach coparray;
				if (count (nearestObjects [(getPos vehicle player),_typeOfcopsArray,100]) == 0) exitWith {player setVariable ["restrained",false,true];};
			};
		};
		[] spawn {
			_exitVar = false;
			
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

				if ((vehicle player) != player) then {
					waitUntil {!((vehicle player) != player)};
				};

				if ((animationState player) != ILG_Restrain_Anim) then {
					(format ["%1 switchMove ILG_Restrain_Anim;",player]) call broadcast;
				};
			};
		};
		
	};
};

Juan_CopSpeedCam =
{
	private ["_cur","_tSpeed","_Driver","_Wanted","_DriverWanted"];
	_cur = cursorTarget;
	_tSpeed = floor(speed _cur);
	_Driver = if (str(driver _cur) == "<NULL-object>")then{"No Driver"}else{driver _cur};
	_Wanted = call compile format['%1_wanted == 1',_Driver];
	_DriverWanted = "";
	if (_Wanted) then {_DriverWanted = "Driver is Wanted"};
	if (!(_cur isKindOf "LandVehicle")) exitWith {};
	if (!alive player) exitWith {};
	if (!iscop) exitWith {titleText["Cops Only!","PLAIN DOWN"];};
	titleText[format["SPEED: %1Km/h\nDRIVER: %2\nREGISTRATION: %3\nTYPE: %4\n%5",_tSpeed,_Driver,_cur,(getText (configFile >> "cfgVehicles" >> (typeOf _cur) >> "displayName")),_DriverWanted],"PLAIN"];
};

Switch_CopAirSkin =
{
	private ["_AirSkin","_x","_AirSkinPlayer"];
	_AirSkin = false;
	{
		if ((_x call ISSE_UnitExists) && ((typeOf _x) == "US_Soldier_Pilot_EP1")) then
		{
			_AirSkin = true;
			_AirSkinPlayer = _x;
		};
	}forEach coparray;
	if (!_AirSkin) then
	{
		["US_Soldier_Pilot_EP1"] call clothes;
		systemchat "Skin Changed, no one else will be able to access this skin.";
	}
	else
	{
		systemchat format ["%1 already has the pilot skin! Only one pilot maybe active at a time.",(name _AirSkinPlayer)];
	};
};

Switch_FromCopAirSkin =
{
	private ["_Patrol","_Sheriff","_SheriffD","_Dispatch","_K9","_SWAT_Lead","_SWAT","_VICE"];
	_Patrol = [Cop4,Cop5,Cop6,Cop7,Cop8,Cop9,Cop10,Cop11,Cop12,Cop13,Cop21,Cop22,Cop23,Cop24,Cop25];
	_Sheriff = [Cop14];
	_SheriffD = [Cop15,Cop16,Cop17,Cop18];
	_Dispatch = [Cop2];
	_K9 = [Cop3];
	_SWAT_Lead = [];
	_SWAT = [];
	_VICE = [Cop19,Cop20];

	if (!iscop) exitWith {};
	switch (true) do
	{
		case (player in _Patrol):{["tcg_police_officer"] call clothes};
		case (player in _Sheriff):{["tcg_police_shrsgt"] call clothes};
		case (player in _SheriffD):{["tcg_police_officsh"] call clothes};
		case (player in _Dispatch):{["vilas_sira_policeman"] call clothes};
		case (player in _K9):{["tcg_police_officerk9"] call clothes};
		case (player in _VICE):{["tcg_police_Functionary"] call clothes};
		case (player in _SWAT_LEAD):{["vilas_sira_swat"] call clothes};
		case (player in _SWAT):{["vilas_sira_swat_m416"] call clothes};
	};
	systemchat "Skin changed. Other officers can now access this Skin.";
};

JuansCopMarkers =
{
	private ["_CopMArray","_marker","_x"];
	waitUntil {visibleMap};
	if (copmarker_on == 0) exitWith {};
	_CopMArray = [];
	_CopVArray = [];
	_NoVICE = [Cop1,Cop2,Cop3,Cop4,Cop5,Cop6,Cop7,Cop8,Cop9,Cop10,Cop11,Cop12,Cop13,Cop14,Cop15,Cop16,Cop17,Cop18,Cop21,Cop22,Cop23,Cop24,Cop25];
	_VICE = [Cop19,Cop20];
	{
		if (_x call ISSE_UnitExists) then
		{
			_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerTextLocal format["%1", name _x];
			_marker setMarkerDirLocal (getDir _x);
			_marker setMarkerSizeLocal [0.5,1];
			_CopMArray = _CopMArray + [[_marker,_x]];
		};
	} forEach _NoVICE;

	{
		if (_x call ISSE_UnitExists) then
		{
			_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerTextLocal format["%1", name _x];
			_marker setMarkerDirLocal (getDir _x);
			_marker setMarkerSizeLocal [0.5,1];
			_CopVArray = _CopVarray + [[_marker,_x]];
		};
	} forEach _VICE;

	while {true} do
	{
		{
			if ((alive (_x select 1)) && ((_x select 1) call ISSE_UnitExists)) then
			{
				(_x select 0) setMarkerPosLocal (getPos vehicle(_x select 1));
				(_x select 0) SetMarkerDirLocal (getDir vehicle(_x select 1));
			};
//			if (animationstate (_x select 1) == "civilsitting") then
//			{
//				deleteMarkerLocal (_x select 0);
//			};
			if ((_x select 1) hasWeapon "ItemGPS") then {}
			else
			{
				deleteMarkerLocal (_x select 0);
			};
			if (!alive (_x select 1)) then
			{
				deleteMarkerLocal (_x select 0);
			};
		} forEach _CopMArray;
		{
			if ((alive (_x select 1)) && ((_x select 1) call ISSE_UnitExists)) then
			{
				(_x select 0) setMarkerPosLocal (getPos vehicle(_x select 1));
				(_x select 0) SetMarkerDirLocal (getDir vehicle(_x select 1));
			};
//			if (animationstate (_x select 1) == "civilsitting") then
//			{
//				deleteMarkerLocal (_x select 0);
//			};
			if ((_x select 1) hasWeapon "ItemGPS") then {}
			else
			{
				deleteMarkerLocal (_x select 0);
			};
			if (!alive (_x select 1)) then
			{
				deleteMarkerLocal (_x select 0);
			};
		} forEach _CopVArray;
		if (!visiblemap) exitWith {};
		sleep 0.02;
	};

	{
		deleteMarkerLocal (_x select 0);
	}forEach _CopMArray;
	{
		deleteMarkerLocal (_x select 0);
	}forEach _CopVArray;
};

Activate_Backup_Button = {
	if (!(Allow_Backup)) exitWith {
		player sideChat "Your 10 second cooldown hasn't ended yet.";
	};
	Allow_Backup = false;
	player sideChat "Officers have been notified of your disress call";
	(format ['
			if (iscop) then {
				player sideChat "%1 (%2) is requesting backup to his location. (GRID: %3)";
				if (player != %2) then {
					player say3D ["beepSimple", 3];
				};
			};
	', name player, player, [player] call Emita_GetGridRef]) call broadcast;

	(format ['
		_Player = %2;
		if ((getMarkerColor "Backup_Button_%2") != "") then {
			deleteMarkerLocal "Backup_Button_%2";
		};
		_Marker = createMarkerLocal ["Backup_Button_%2", [0,0]];
		_Marker setMarkerShapeLocal "ICON";
		_Marker setMarkerTypeLocal "Warning";
		"Backup_Button_%2" setMarkerColorLocal "ColorBlue";
		"Backup_Button_%2" setMarkerTextLocal "%1 has requested backup here";
		"Backup_Button_%2" setMarkerPosLocal getPos %2;
		"Backup_Button_%2" setMarkerSizeLocal [1,1];
		[] spawn {
			while {(getMarkerColor "Backup_Button_%2") != ""} do {
				sleep 600;
				deleteMarkerLocal "Backup_Button_%2";
			};
		};
	', name player, player, [player] call Emita_GetGridRef]) call broadcast;

	player sideChat "You need to wait 10 seconds before pressing the backup button again";
	sleep 10;
	Allow_Backup = true;
};

Activate_Panic_Button = {
	if (!(Allow_Panic)) exitWith {
		player sideChat "Your 5 minutes cooldown hasn't ended yet.";
	};

	if (Panic_Count == 0) exitWith {
		player sideChat "Press the panic button one more time if your life is in danger";
		Panic_Count = Panic_Count + 1;
		sleep 5;
		if (Panic_Count == 1) then {
			Panic_Count = 0;
			player sideChat "Panic Button reset!";
		};
	};

	if (Panic_Count == 1) then {
		Panic_Count = Panic_Count + 1;
		Allow_Panic = false;
		player sideChat "Officers have been notified of your disress call";
		(format ['
				if (iscop) then {
					player sideChat "%1 (%2) has just pressed his panic button! (GRID: %3)";
					/* ArmA 2 Work around :/ */
					if (player != %2) then {
						[] spawn {
							player say3D ["beepSimple", 3];
							sleep 0.5;
							player say3D ["beepSimple", 3];
							sleep 0.5;
							player say3D ["beepSimple", 3];
						};
					};
					_Player = %2;
					if ((getMarkerColor "Panic_Button_%2") != "") then {
						deleteMarkerLocal "Panic_Button_%2";
					};
					_Marker = createMarkerLocal ["Panic_Button_%2", [0,0]];
					_Marker setMarkerShapeLocal "ICON";
					_Marker setMarkerTypeLocal "Warning";
					"Panic_Button_%2" setMarkerColorLocal "ColorRed";
					"Panic_Button_%2" setMarkerTextLocal "%1 pressed his Panic Button here!";
					"Panic_Button_%2" setMarkerPosLocal getPos %2;
					"Panic_Button_%2" setMarkerSizeLocal [1.3,1.3];
					[] spawn {
						while {(getMarkerColor "Panic_Button_%2") != ""} do {
							sleep 600;
							deleteMarkerLocal "Panic_Button_%2";
						};
					};
				};
		', name player, player, [player] call Emita_GetGridRef]) call broadcast;
		player sideChat "You need to wait 5 minutes before pressing the panic button again";
		sleep 300;
		Panic_Count = 0;
		Allow_Panic = true;
	};
};

/*
Cop_Grouping_InUnit = {
	_Unit = Player getVariable ["Cop_Current_Unit", ""];

	_InUnit = false;
	{

	} count Cop_Grouping_Units;
};

Cop_Grouping_CreateUnit = {
	_SquadID = format ["Unit_%1", (getPlayerUID player)];
	{
		if ((_x select 0) == _SquadID) then {
			systemChat "A Squad already exists under your UID (Error?)";
		};
	} count Cop_Grouping_Units;

	player setVariable ["Cop_Current_Unit", _SquadID, true];
	player setVariable ["Cop_Current_Unit_Position", 0, true];

	Cop_Grouping_Units = Cop_Grouping_Units + [[_SquadID, [[(getPlayerUID player), player]]]];
	publicVariable "Cop_Grouping_Units";

	systemChat "Your Unit has been Created";
};

Cop_Grouping_InviteUnit = {
	_UnitToInvite = (_this select 0);
	_GroupToInviteTo = (_this select 1);

	_GroupExists = false;

	{
		if ((_x select 0) == _GroupToInviteTo) then {
			_GroupExists = true;
		};
	} count Cop_Grouping_Units;

	if ((player getVariable ["Cop_Current_Unit_Position", -1]) != 0) exitWith {systemChat "Only the Group Owner can invite new members to a unit!";};

	(format ['
		if (player == %1) [%3, %2] call Cop_Grouping_RetrieveInvite;
	', _UnitToInvite, _GroupToInviteTo, player]) call broadcast;
};

Cop_Grouping_RetrieveInvite = {
	_PlayerWhoInvited = (_this select 0);
	_GroupInvitedTo = (_this select 1);
};

Cop_Grouping_JoinUnit = {
	_UnitToJoin =
};

Cop_Grouping_LeaveUnit = {
	_PlayerLeaving = (_this select 0);

	if ((player getVariable ["Cop_Current_Unit", ""]) == "") exitWith {
		_IDInArr = false;
		_PlayerInArr = false;
		{
			_ID = (_x select 0);
			_MembersList = (_x select 1);
			{
				_PID = (_x select 0);
				_Player = (_x select 1);

				if (_PID == getPlayerUID player) then {
					_IDInArr = true;
				};
				if (_Player == player) then {
					_PlayerInArr = true;
				};
			} count _MembersList;

			if (_IDInArr && _PlayerInArr) then
		} count Cop_Grouping_Units;



		systemChat "You're currently not in a group";


	};

	if ((player getVariable ["Cop_Current_Unit_Position", -1]) == 0)
};

Cop_Grouping_KickPlayerFromUnit = {

};

Cop_Grouping_ChangeOwner = {

};*/
