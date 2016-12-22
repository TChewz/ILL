adminCMD = lbCurSel 1000;
TarGetPLayer = ctrlText 2000;
liafu = player;
_inputText = ctrlText 2000;
_data = lbData[1000,(lbCurSel 1000)];

switch (_data) do
{
	case "Heal/Repair (3m)": //First Aid
	{
		if (!((getPlayerUID player) in StaffLevel3)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		_objs = (position (vehicle player) nearObjects 3); {_x setDammage 0} forEach _objs; closeDialog 0;
	};
	case "Log System":
	{
		closedialog 0;
		[] spawn jon_adminlogs;
	};
	case "Spectate (F3 to Quit)": //Spectate
	{
		if (!((getPlayerUID player) in StaffLevel3)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		handle = [] execVM "addons\proving_ground\fnc_spectate.sqf"; closeDialog 0;
	};
	case "Stat Checker": //Stat Checker
	{
		if (!((getPlayerUID player) in StaffLevel3)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		closeDialog 0; 
		closeDialog 0;
		execVM "Juan\Admin\statisticCheck.sqf";
	};
	case "Teleport": //Teleport
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		hint "Click on the map to Teleport!";
		liafu = true;
		closeDialog 0;
		openMap true;
		onMapSingleClick "onMapSingleClick """";liafu = true; (vehicle player) setpos [_pos select 0, _pos select 1, 0]; openMap false;";
	};
	case "Delete": //Delete
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		deleteVehicle cursorTarget;closeDialog 0;
	};
	case "Carmageddon (50 meters)": // Carmageddon
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
	
		_distance = 50;
		
		if ((typeName _distance) == (typeName (1234))) then {
		
				player groupchat format["Starting Carmageddon at a range of %1 meters", _distance];
		
				{
					{		
						if ({alive _x} count crew _x == 0) then {
								deleteVehicle _x;
							};
					} foreach((getpos player) nearObjects [_x, _distance]);
				} forEach ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck", "Wreck_Base", "HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", "Ka137_Base_PMC", "A10"];
			} else {
				hint "ERROR: expected number";
			};
		
	};
	case "GPS/NV/Binocs": //GPS,NV,Binoc
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		player addweapon "ItemGPS";
		player addweapon "NVGoggles";
		player addweapon "Binocular";
	};
	case "World Heal": // World Heal 
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		_objs = (position (vehicle player) nearObjects 100000); {_x setDammage 0} forEach _objs;
		[] execVM "Juan\Gen\Fixer\mostThings.sqf";
		[] execVM "Juan\Gen\Fixer\buildingsOnly.sqf";
		(format ["titleText [""%1 has just performed a worldwide repair/heal!"", ""plain""];",name player]) call broadcast;
	};
	case "Masterkey": // Masterkey
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship"], 25];
		_vcl = _vcls select 0;
		["schluessel", str(_vcl), 0] execVM "keys.sqf";

	};
	case "Inventory Money": //Clear Hack Logs
	{
		if (!((getPlayerUID player) in StaffLevel2)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		CheatInfo = nil;
		publicVariable "CheatInfo";
	};
	case "Inventory Money": //Inventory Money
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		['Mishy',100000] call INV_AddInventoryItem;
	};
	case "Tags": //Tags
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		handle = [] execVM "addons\proving_ground\fnc_2dRadar.sqf"; closeDialog 0;
	};
	case "Satellite": //Satellite
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		handle = [] execVM "gcam\gcam.sqf"; closeDialog 0;
	};
	case "Repair Kit": //Large Repair Kit
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		['reparaturkit',1] call INV_AddInventoryItem;
	};
	case "Refuel Can": //Refuel Can
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		['kanister',1] call INV_AddInventoryItem;
	};
	case "Medkit": //Medkit
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		['medikit',1] call INV_AddInventoryItem;
	};
	case "Fix My Ride": //fix my ride
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		vehicle player setFuel 1;
		vehicle player setDammage 0;
	};
	case "Infinite Ammo": // Inf Ammo
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		if (infammook==0) then
		{
			hint "Infinite Ammo on";
			infammook=1;
		}
		else
		{
			infammook=0;
		};

		while {infammook==1} do
		{;
			(vehicle player) setVehicleAmmo 1;
			sleep 0.1;
		};
		hint "Infinite Ammo off";
		infammook=0;
	};
	case "Infinite Fuel": // FUEL
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		if (isNil "inffuelok") then {inffuelok = 0;};
		if (inffuelok==0) then
			{
			hint "Infinite Fuel ON!";
			iloopokk=1;
			inffuelok=1;
			}
		else
			{
			iloopokk=0;
			};
		while {iloopokk==1} do
			{;
			(vehicle player) setFuel 1;
			sleep 0.1;
			};
		hint "Infinite Fuel OFF!";
		inffuelok=0;
	};
	case "PGSpawn": //PGSPAWN
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		createDialog "balca_debug_main";
	};
	case "Teleport Player To Me":
	{
		if (!((getPlayerUID player) in StaffLevel1)) exitWith {

		(format["server globalchat ""%1 ATTEMPTED TO RUN AN ADMIN COMMAND! REPORT TO A MEMBER OF STAFF IMMEDIATELY!: ILL.TS3DNS.COM"";", name player]) call broadcast;
		endmission "end3";
		};
		
		execVM "TPtoME.sqf"; closedialog 0;
	};
};
/*
-----------------------------------------------------------------------------------------
*/

// 
if (TarGetPLayer == "") then
{
	CoDeString = cmdLine;
}
else
{
	CoDeString = "if (name vehicle player == TarGetPLayer) then {_comp = compile cmdLine; call _comp;}";
};

publicVariable "TarGetPLayer";
sleep 0.3;
publicVariable "cmdLine";
sleep 0.3;
publicVariable "CoDeString";
sleep 0.3;

// nil = [CoDeString] execVM "public.sqf";
_O0O0 = player;