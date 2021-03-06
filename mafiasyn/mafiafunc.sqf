//Credits to TLR(Clothing script) & Linnet (mafia functions)
player_exists = {
	private["_player"];
	_player = _this select 0;
	if (isNil "_player") exitWith {false};
	if (typeName _player != "OBJECT") exitWith {false};
	if (isNull _player) exitWith {false};
	true
	};	
	
C_delete = { 
_this spawn {
	private ["_unit"];
	_unit = _this select 0;
	if (not([_unit] call player_exists)) exitWith {};
	_unit setPosATL [-1, -1, 0];
	_unit setDammage 1;
	private["_i"];
	_i = 0;
	while { _i < 10 } do {
		hideBody _unit;
		_i = _i + 1;
	};
	deleteVehicle _unit;
	};
};

clothes = {

if (call INV_isArmed) exitWith {player groupChat "You must be unarmed to change clothes!"};

_oldplayer = player;
_oldweapons = weapons _oldplayer;
_oldmags    = magazines _oldplayer;
_score = score _oldplayer;
_rank = rank _oldplayer;
_damage = damage _oldplayer;
_skin = _this select 0;
_pos = getPosATL _oldplayer;
_skinsold = typeof _oldplayer;
_dir = getDir _oldplayer;
_view = cameraView;

if (_skinsold != _skin) then {
	private["_temp_group"];
	_temp_group = (group server);
	private["_group"];
	_group = (group _oldplayer);
	_to_become = _group createUnit [_skin, (position player), [], 0, "NONE"];
	private["_var_name"];
	_var_name = vehicleVarName _oldplayer;
	titleText ["","BLACK OUT",0.01];
	titleText ["","BLACK IN",0.5];
	clearVehicleInit _oldplayer;
	_oldplayer setVehicleVarName format["old_%1", _var_name];
	_to_become setVehicleInit format['this setVehicleVarName "%1"; %1 = this;', _var_name];
	processInitCommands;
	[_to_become] joinSilent _group;
	addSwitchableUnit _to_become;
	selectPlayer _to_become;
	_group selectLeader _to_become;
	[_oldplayer] call C_delete;
	removeAllWeapons _to_become;
	_to_become setRank _rank;
	_to_become addscore _score;
	_to_become setPosATL _pos;
	_to_become setDir _dir;
	_to_become setDammage _damage;
	_to_become switchCamera _view;
	[] call Player_EH_Setup;
	if(LinLib_ClientLoaded)then{
		[player, [["model", (typeOf Player)]]] call LinLib_fnc_ClientUpdate;
	};
	if (iscop) then
	{
		execVM "Actions\copactions.sqf";
	};
	if (isciv) then
	{
		if (player in [Civ51,Civ52,Civ53,Civ54,Civ55]) then
		{
		execVM "Actions\govactions.sqf";
		}else{
		execVM "Actions\civactions.sqf";
	};
	};
	execVM "briefing.sqf";
	INV_PLAYERLIST = playerarray;
	INV_PLAYERSTRINGLIST = playerstringarray;
	gangmember = false;
	{player addWeapon _x} forEach _oldweapons;
	{player addMagazine _x} forEach _oldmags;
	{player selectweapon _x}forEach (weapons player-nonlethalweapons);
	};
};

clothes_gov = {

//if (call INV_isArmed) exitWith {player groupChat "You must be unarmed to change clothes!"};

_oldplayer = player;
_oldweapons = weapons _oldplayer;
_oldmags    = magazines _oldplayer;
_score = score _oldplayer;
_rank = rank _oldplayer;
_damage = damage _oldplayer;
_skin = _this select 0;
_pos = getPosATL _oldplayer;
_skinsold = typeof _oldplayer;
_dir = getDir _oldplayer;
_view = cameraView;

if (_skinsold != _skin) then {
	private["_temp_group"];
	_temp_group = (group server);
	private["_group"];
	_group = (group _oldplayer);
	_to_become = _group createUnit [_skin, (position player), [], 0, "NONE"];
	private["_var_name"];
	_var_name = vehicleVarName _oldplayer;
	titleText ["","BLACK OUT",0.01];
	titleText ["","BLACK IN",0.5];
	clearVehicleInit _oldplayer;
	_oldplayer setVehicleVarName format["old_%1", _var_name];
	_to_become setVehicleInit format['this setVehicleVarName "%1"; %1 = this;', _var_name];
	processInitCommands;
	[_to_become] joinSilent _group;
	addSwitchableUnit _to_become;
	selectPlayer _to_become;
	_group selectLeader _to_become;
	[_oldplayer] call C_delete;
	removeAllWeapons _to_become;
	_to_become setRank _rank;
	_to_become addscore _score;
	_to_become setPosATL _pos;
	_to_become setDir _dir;
	_to_become setDammage _damage;
	_to_become switchCamera _view;
	[] call Player_EH_Setup;
	if(LinLib_ClientLoaded)then{
		[player, [["model", (typeOf Player)]]] call LinLib_fnc_ClientUpdate;
	};
	if (iscop) then
	{
		execVM "Actions\copactions.sqf";
	};
	if (isciv) then
	{
		if (player in [Civ51,Civ52,Civ53,Civ54,Civ55]) then
		{
		execVM "Actions\govactions.sqf";
		}else{
		execVM "Actions\civactions.sqf";
	};
	};
	execVM "briefing.sqf";
	INV_PLAYERLIST = playerarray;
	INV_PLAYERSTRINGLIST = playerstringarray;
	gangmember = false;
	{player addWeapon _x} forEach _oldweapons;
	{player addMagazine _x} forEach _oldmags;
	{player selectweapon _x}forEach (weapons player-nonlethalweapons);
	};
};

invitationadd = 
{
	player sidechat "Tony had a feeling you would show up, he left a present for you."; 
	titleCut ["", "BLACK FADED", 999]; 
	["Functionary1"] call clothes;
	sleep 3;
	titleText ["Opening package...","PLAIN"];
	titleFadeOut 7;
	sleep 3;
	titleText ["Thank you Tony.","PLAIN"];
	titleFadeOut 7;
	sleep 3;
	_wepon = secondaryweapon player;
		if (_wepon == "") then 
		{
		player addWeapon "RH_python";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		player addmagazine "RH_6Rnd_357_Mag";
		};
	titleCut ["", "BLACK IN", 5];
	[] call selectWeapon_Juan;
	mafiamembers = mafiamembers + [player];
	mafs setVariable ["mafiamembers", mafiamembers, true];
};

//Called by action (GET JOB)
getmafjob = 
{
hasjob = true;
_playable = playableUnits;
_randomplayer = _playable;
{
	if ((typeOf _x) == "Functionary1") then
	{
		_randomplayer = _randomplayer - [_x];
	};
}forEach playerarray;
_randomplayer = _randomplayer - [player];
_randomplayer = _randomplayer - [Civ51,Civ52,Civ53,Civ54,Civ55];
//_randomplayer = _playable; // FOR DEBUG
_unit = _randomplayer select floor(random count _randomplayer);
//_gridPos = mapGridPosition getpos _unit;
_gridPos = [_unit] call Emita_GetGridRef;
player sidechat format ["Tony wants you to kidnap: %1, you have 60 min to bring him back here. He was last seen at these grid coordinates %2.", name _unit, _gridPos];
[_unit] spawn clienthostage;
};

//LOOP FOR KEEPING TRACK OF HOSTAGE/LIFE OF KIDNAPPER
clienthostage =
{

_counter = 0;
_hostage = _this select 0;
(format['%1 groupchat localize "STRS_mafia_hosmes";', _hostage]) call broadcast;

  while {hasjob} do 
  {
  
	if (_hostage distance mafs < 50) exitwith { 
		player sidechat "You've managed to get the hostage to Tony, congratulations he left $100,000 for you.";
		["Mishy", 100000] call INV_addinvitem;
		hasjob = false;
	};
	if (!alive _hostage) exitwith 
	{
		player sidechat "It seems our friend sleeps with the fishes tonight.";
		hasjob = false;
	};
	if (!alive player) exitwith 
	{
		(format['%1 groupchat localize "STRS_mafia_died";', _hostage]) call broadcast;
		hasjob = false;
	};
	if (_counter >= 3600) exitwith 
	{
		player sidechat "It seems our friend got away. Tony don't like when people don't make deadlines.";
		(format['%1 groupchat localize "STRS_mafia_away";', _hostage]) call broadcast;
		hasjob = false;
	};
	_counter = _counter + 1;
	sleep 1;
	
  };
  
};