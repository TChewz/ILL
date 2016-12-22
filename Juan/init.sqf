/*
	This section of the mission is Jon's
	This is mainly to keep track of what i make
	so its easily accessible
	(And so the mission file has some sort of basic structure)
*/
/* Defines */
_Script = [] execVM "Juan\Gen\SMS.sqf";
waitUntil{scriptDone  _Script};

_Script = [] execVM "Juan\Gen\MiscFunctions.sqf";
waitUntil{scriptDone  _Script};

Panic_Count = 0;
Allow_Panic = true;
Allow_Backup = true;

_Script = [] execVM "Juan\Cop\notification.sqf";
waitUntil{scriptDone  _Script};

_Script = [] execVM "Juan\Cop\Functions.sqf";
waitUntil{scriptDone  _Script};

_Script = [] execVM "Juan\Civs\civFunctions.sqf";
waitUntil{scriptDone  _Script};

_Script = [] execVM "Juan\Esu\initFunc.sqf";
waitUntil{scriptDone  _Script};

[] execVM "Juan\Gen\MainMenu.sqf";
[] execVM "Juan\Admin\loggingfunctions.sqf";
[] execVM "Juan\Admin\adminFunctions.sqf";

ILG_Has_Modpack = isClass(configFile >> "cfgPatches" >> "ILG_Objects");
player setVariable ["ILG_Has_Modpack",ILG_Has_Modpack,true];
ILG_Moveable_Objects = ["ZavoraAnim","Land_CncBlock_Stripes","il_barrier"];
_Avalible_HUD = ["modern"];
HUD = _Avalible_HUD select (floor(random(count _Avalible_HUD)));

if ("car" in INV_LizenzOwner) then {demerits = 10};

/* Just Scripts to run */
[] execVM "Juan\Gen\healthRegain.sqf";
[] execVM "Juan\Gen\Recomplilations.sqf";

/* Look Fancy like yours truely, Linnet */
sleep 5;
player setVariable ["restrained",false,true];
resetSettingDLG = false;
jonOpenDLG = false;
[] call P_DeathLoop;
[] call Vehicle_Despawn_SvrLoop;
[] call ESU_Clothing;
[] call Verify_Unit_Class;
[] call SUV_Gunner_Checks;
[] call VON_Disable;
[] call Juan_SetStatVars;
[] call Cur_RemoveActionText;
[] call Server_SelectVICECivNumber;
[] call Player_EH_Setup;
[] call ILG_MP_DL_Reminder;
//Name tags
{_x call ENT_addTag} foreach (playerarray - [player]);
{_x call ENT_addTag} foreach (bankflagarray);
{_x call ENT_addTag} foreach (drugsellarray);
{_x call ENT_addTag} foreach (shopusearray);
if ((getPlayerUID player) in ILG_PMC) then {bankflagarray = bankflagarray + [atm_pmc];};
