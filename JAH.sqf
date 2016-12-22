waitUntil {getPlayerUID player != "";};
waitUntil {name player != "";};
sleep 1;

"JAMESAH_GLOBALMSG" addPublicVariableEventHandler 
{
	_message = _this select 1;
	systemChat format["JAH: %1.", _message];
};

_gtfo =
{
	systemChat "JAH: SCRIPT KICK: Bad Script Content Found!";
	sleep 4;
	endMission "loser";
};

_kick = 
{
	systemChat "JAH: SCRIPT KICK: Bad Variable/Settings/Dialog Found!";
	sleep 2.5;
	endMission "loser";
};

_stringkick =
{
    SystemChat "JAH: STRING KICK: You have changed your clients strings.";
    sleep 4;
	endMission "loser";
};

_weaponkick =
{
	systemChat "JAH: WEAPON KICK: ILL Does not allow this weapon!"; // Change **SERVERNAME** To the abbreviation of your server. E.G: ILG, EVO, CCG, RLRPG
	sleep 5;
endMission "loser";
};

//////////////////////////////////////////////////////////////////////
//Kick Functions//
//////////////////////////////////////////////////////////////////////

_BladeAH = false; //If using Blade Stealth Hunters AH, select true. (Merges James AH with BSH AH.)
_VarCheck = true; // Default: True. Recomended: True. (Checks for variables that hack menus use.)
_DialogCheck = true; // Default: False. Recomended: True. (Checks for open dialogs, Menus Ect.)
_WeaponCheck = false; // Default: False. Recomended: False. (Can conflict with Island Life.)
_ScriptCheck = true; // Default: True. Recomended: True. (Script Scan Check.)
_BrokenFncs = true; // Default: False. Recomended: False. (Checks to see if people manipulate objects and break them.)
_RecoilCheck = true; // Default: True. Recomended: False. (Can conflict with Island Life.)
_ModificationCheck = true; // Default: True. Recomended: True (Prevents users using Memory Editors.)


_Timeout = 5; // Time between client checks // Recomended: 5 seconds.

//////////////////////////////////////////////////////////////////////
//Editable Functions//
//////////////////////////////////////////////////////////////////////

if (_BladeAH) then {_AdminsList = _AdminsList + _Admin}; //Merges this list with Blades.

_AdminsList = []; // Place your Admin UIDs here.

_BannedList = []; // Place all the baddies up in here.

//////////////////////////////////////////////////////////////////////
_DevList = ["76561198017852199"]; // This adds all the Developers in.
// If you support me, - ^^ - keep that in.
//////////////////////////////////////////////////////////////////////
//Developer UID List//
//////////////////////////////////////////////////////////////////////

if ((getplayerUID player) in _AdminsList) exitWith {systemChat "JAH: Welcome, Admin!";
// execVM "AdminTools.sqf"};
if ((getplayerUID player) in _DevList) exitWith {systemChat "JAH: Welcome, Developer!";
// execVM "AdminTools.sqf"};

//////////////////////////////////////////////////////////////////////
//  DO NOT EDIT BELOW UNLESS YOU ARE FAMILIAR WITH THE SQF LANGUAGE \\
//////////////////////////////////////////////////////////////////////
_variable = 
[
	"MonsterCheats_Admin_Options","MonsterCheats_Options","MonsterCheats_GodMode",
	"FND_fnc_subs","FND_fnc_select","exec","Jkeyszz","Menu_init_J","kep","keybinds",
	"Le_menu","weirdo","sCode","ESP_Markers","EliteMarkers","I_love_rustler","Walcka",
	"togglethis","Enable_MP_Markers","Logan__RE","SUPERMAGICAL_RE","hacks","fnc_temp",
	"markers","playericons","g0dmode","kill_all_star","infiSTAR_chewSTAR_dayz_1","monkytp",
	"cheatlist","ESP","T3le","Monky_funcs_inited","Dwarden","pic","veh","wuat_fpsMonitor",
	"unitList","list_wrecked","p","fffffffffff","markPos","pos","marker","TentS","VL","MV",
    "mk2","i","j","fuckmegrandma","mehatingjews","scode","TTT5OptionNR","igodokxtt","omgwtfbbq",
    "lmzsjgnas","vm","Monky_hax_toggled","pu","nb","vspeed","godlol","aesp","godall","initarr3",
	"imbeingawesome","unitList","j","LoganKillsPeopleSometimes","scode",
	"TargetPlayer","lazy_ILHA_is_lazy","Lmenu1","Lmenu2","Scott_Joplin",
	"Lbuildings","LogansVIPJet","serverObjectMonitor","Armor1","planeGroup",
	"nukepos","nukev","LogansFlagSwag","LogansOtherFlagSwag","loganisawesome",
	"Lpathtoscrdir","menu","main","misc","SavedText","take2","Rapeisfun","take1",
	"J_RE","box","Lystics_Code","startmenu_star","anotherpage","Metallica_battleHIGH_initMenu","Metallica_battleHIGH_funcs_inited",
	"Metallica_battleHIGH_hax_toggled","infiSTAR_RE","spawnvehicles_star","init_Fncvwr_menu_star",
	"atext","BIS_fnc_3dCredits_n","tdtext","HMDIR","HDIR","MENUTITLE","option","img",
	"temp","temp1","Mystic_ESP","FND_fnc_subs","FND_fnc_select","exec","FND_fnc_menu_players",
	"FND_fnc_handle_player","FND_fnc_menu_bis","FND_fnc_menu_vdayz","FND_fnc_menu_edayz",
	"FND_fnc_menu_oa","FND_fnc_script_handler","FND_fnc_menu_car","FND_fnc_menu_armor",
	"FND_fnc_menu_air","FND_fnc_menu_ship","FND_fnc_menu_static","FND_fnc_spawn_veh",
	"FND_fnc_add_thing","FND_fnc_menu_guns","freddiesmm","kep","MonsterCheats_Menu",
	"MCheats_Clip_UD_M1","MonsterCheats_Toggle","MonsterCheats_Admin_Options",
	"MonsterCheats_Toggle_Mods","hoenUSABLE","hoen183","hoenDialogCp","hoenAdmins",
	"hoenDayz","hoenEpoch","hoenAllowed","hoenRcfc","gearDialog_create","hoenRE",
	"hoenDatal2","hoenFilenr2","hoenNametmr2","hoenRc","hoenScanon","hoenDatal",
	"hoenHide","hoenEclick","hoenModSelected","manatee_craft_menu","hoenNear",
	"ssCoDdeEes","P_DD_O_S","invion","igodok","infammook","isnok","ifuelok","ifogok",
	"frezok","flareok","atomOk","bDisaUSInpu","Alxtplname","hijCode","PlayerNames",
	"jexecstring","AlxOptionNR","Flare","blttpe","XmasSmashhitsvolume12","Xmas",
	"keyhandler","Alex_DELETE_TOOL","start","loaded","password","abc","abc2","abc3",
	"abc4","abcd","hacks","hack","hack1","hacks2","whitelist","sCode","bis_vila","pic",
	"pic2","j","b","v","veh","vehC","LogansFlagSwag","LogansSmokeyinsertSMILEYFACEhere",
	"control_tank","creep_tank","objectUID","controlling_vehicle","Lexploplayer","LoganIsTired",
	"LoganLikesPandas","vehv","Logan__RE","nukehold","nukemarker","quake","windv","ash","envi",
	"snow","Exec_code","LogansFlag","Flag","LdamageHandlerStaph","logansnerpsnerpyo","ArcticPiano",
	"Lsnowman","toggle","imseriouslyrightnow","LoganIsS_C_O_P_IE_D","IHateMondays","AntiCheatEqualsNo",
	"Lexstr","LoganIsDamnSexyToday",
    "sfsefse","tw4etinitMenu","tw4etgetControl","efr4243234","sdfwesrfwesf233",
    "sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd","dayz_serverObjectMonitor","fsfgdggdzgfd",
    "advertising_banner_infiSTAR","godall","cargod","godmode","MonsterCheats_Toggle","MonsterCheats_Noobs"
];

_Folder = 
[
	"Script Scan Complete.sqf","freddiesexternalmenu\freddies_active.sqf","LoganNZL\LoganNZL@start.sqf",
	"infiSTAR_BLACK\startup.sqf","scr\startMenu.sqf","startup.sqf","start.sqf","renamethis.sqf","LoganNZL@start.sqf",
	"Supplys\BBstart.sqf","Scripts\exec.sqf","wuat\start.sqf","wuat\screen2.sqf","hoen\sttart.sqf","asdf.sqf","asdfghjkl.sqf",
	"renameme.sqf","swagInit.sqf","WastelandMenu.sqf","hack.sqf","qwerty.sqf","swag.sqf"
];

_dialog = 
[
	64,2929
];

_broken_function = 
[
	"player","name","getPlayerUID",
	"true","false","publicVariableServer",
	"preprocessFileLineNumbers","if","isNil",
	"unitRecoilCoefficient","format","isNull"
];

_badWeapon =
[
	"FFARLauncher","STRELA","DSHKM",
	"AK74GrenadeLauncher","M60","MAAWS",
	"M32_EP1","M47Launcher_EP1","M79_EP1",
	"SMAW","MetisLauncher","Igla"
];
if ((getPlayerUID player) in _BannedList) exitWith {systemChat 'You are on the blacklist!'; sleep 2.5; endmission "LOSER";};
if (name player in ["The Stig","Whippy"]) exitWith {systemChat 'Hackers are not permitted in the server.'; execVM "HackerFound.sqf";}; //custom name filter
while {true} do 
{
	preprocessFileLineNumbers "Scan Complete Hack Content";
	execVM "BadSQFNotFound.sqf";
	{
		_file = preprocessFileLineNumbers _x;
		if (_file != "") then 
		{
			JAMESAH_GLOBALMSG = format ["%1 has cheats in their game files. File Name: %2.", name player ,_x];
			publicVariableServer "JAMESAH_GLOBALMSG";
			call _gtfo;
		};
	}forEach _Folder;
   if (_ModificationCheck) then
    	{
shouldResultMain = 'private ["_dummy"]; _dummy = [_this,"onload"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentMain = getText (configfile >> "RscDisplayDSinterface" >> "onLoad");
shouldResultLogin = 'private ["_dummy"]; _dummy = [_this,"login"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentLogin = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Login" >> "onButtonClick");
shouldResultVoteKick = 'private ["_dummy"]; _dummy = [_this,"vote_kick"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentVoteKick = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Vote_kick" >> "onButtonClick");
shouldResultVoteAdmin = 'private ["_dummy"]; _dummy = [_this,"vote_admin"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentVoteAdmin = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Vote_admin" >> "onButtonClick");
shouldResultVoteMission = 'private ["_dummy"]; _dummy = [_this,"vote_mission"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentVoteMission = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Play_Vote_Mission" >> "onButtonClick");
shouldResultVoteMission2 = 'private ["_dummy"]; _dummy = [_this,"vote_missions"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentVoteMission2 = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Vote_Missions" >> "onButtonClick");
shouldResultVoteReassign = 'private ["_dummy"]; _dummy = [_this,"vote_reassign"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentVoteReassign = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Vote_Reassign" >> "onButtonClick");
shouldResultVoteRestart = 'private ["_dummy"]; _dummy = [_this,"vote_restart"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentVoteRestart = getText (configfile >> "RscDisplayDSinterface" >> "ControlsBackground" >> "CA_B_Vote_Restart" >> "onButtonClick");
shouldResultLogout = 'private ["_dummy"]; _dummy = [_this,"logout"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentLogout = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Logout" >> "onButtonClick");
shouldResultKick = 'private ["_dummy"]; _dummy = [_this,"Kick"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentKick = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Kick" >> "onButtonClick");
shouldResultBan = 'private ["_dummy"]; _dummy = [_this,"ban"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentBan = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Ban" >> "onButtonClick");
shouldResultShutdown = 'private ["_dummy"]; _dummy = [_this,"shutdown"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentShutdown = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Shutdown" >> "onButtonClick");
shouldResultPlayMission = 'private ["_dummy"]; _dummy = [_this,"mission"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentPlayMission = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Play_Mission" >> "onButtonClick");
shouldResultMissions = 'private ["_dummy"]; _dummy = [_this,"missions"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentMissions = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Missions" >> "onButtonClick");
shouldResultReassign = 'private ["_dummy"]; _dummy = [_this,"reassign"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentReassign = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Reassign" >> "onButtonClick");
shouldResultRestart = 'private ["_dummy"]; _dummy = [_this,"restart"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentRestart = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_B_Restart" >> "onButtonClick");
shouldResultChangeSel = 'private ["_dummy"]; _dummy = [_this,"players"] execVM "\ca\ui\scripts\dedicatedServerInterface.sqf";';
getCurrentChangeSel = getText (configfile >> "RscDisplayDSinterface" >> "Controls" >> "CA_Playerslist" >> "onLBSelChanged");
if(shouldResultMain != getCurrentMain or
shouldResultLogin != getCurrentLogin or
shouldResultVoteKick != getCurrentVoteKick or
shouldResultVoteAdmin != getCurrentVoteAdmin or
shouldResultVoteMission != getCurrentVoteMission or
shouldResultVoteMission2 != getCurrentVoteMission2 or
shouldResultVoteReassign != getCurrentVoteReassign or
shouldResultVoteRestart != getCurrentVoteRestart or
shouldResultLogout != getCurrentLogout or
shouldResultKick != getCurrentKick or
shouldResultBan != getCurrentBan or
shouldResultShutdown != getCurrentShutdown or
shouldResultPlayMission != getCurrentPlayMission or
shouldResultMissions != getCurrentMissions or
shouldResultReassign != getCurrentReassign or
shouldResultRestart != getCurrentRestart or
shouldResultChangeSel != getCurrentChangeSel) then
{
JAMESAH_GLOBALMSG = format ["%1 is using a Cheat Engine based hack or PayHack, please alert an admin.", name player];
publicVariableServer "JAMESAH_GLOBALMSG";
call _stringkick;
}
else
{
};
};

    if (_VarCheck) then
    {
	{
		if !(isNil _x) then 
		{
			JAMESAH_GLOBALMSG = format ["%1 is using cheats, please alert an admin.", name player];
			publicVariableServer "JAMESAH_GLOBALMSG";
			call _kick;
		};
	}forEach _variable;
    };
	if (_RecoilCheck) then
    {
	if (unitRecoilCoefficient player != 1) then 
	{
		JAMESAH_GLOBALMSG = format ["%1 for some reason has no recoil! this could be a hack situation, please alert an admin.", name player];
		publicVariableServer "JAMESAH_GLOBALMSG";
		call _kick;
	};
    };
    if (_WeaponCheck) then
    {
	{
		if (_x in _badWeapon) then
		{
			JAMESAH_GLOBALMSG = format ["%1 is has a blacklisted weapon, please alert an admin.", name player];
			publicVariableServer "JAMESAH_GLOBALMSG";
			sleep 5;
			call _weaponkick;
		};
	}forEach (weapons player);
    };


   if (_DialogCheck) then
   	{
	{
		if !(isNull (findDisplay _x)) then 
		{
			JAMESAH_GLOBALMSG = format ["%1 has a bad dialog menu opened, please alert an admin.", name player];
			publicVariableServer "JAMESAH_GLOBALMSG";
			call _kick;
		};
	}forEach _dialog;
    };
	if (_BrokenFncs) then
	{
	{
		if !(isNil _x) then 
		{
			JAMESAH_GLOBALMSG = format ["%1 has a broken function, please alert an admin.", name player];
			publicVariableServer "JAMESAH_GLOBALMSG";
		};
	}forEach _broken_function;
    };
	
	sleep _Timeout;
};

//////////////////////////////////////////////////////////////////////
//  DO NOT EDIT ABOVE UNLESS YOU ARE FAMILIAR WITH THE SQF LANGUAGE \\
//////////////////////////////////////////////////////////////////////

/*
AntiCheat was created for Island Life Liberation Emita
AntiHack Auther: The JAMES.
Some credit goes to Blade Stealth Hunter.
Some credit also goes to G. Riggi !

I DO NOT GIVE PERMISSION FOR THIS TO BE
USED ON ANY OTHER SERVER THAN ILG EMITA.

IF FOUND DOING SO THE SERVER WILL BE ASKED TO REMOVE.
IF SERVER FAILS TO REMOVE ACTIONS WILL BE TAKEN.

Contact | Jay.Ap3
*/