INV_CreateGunboxLocal = {};

INV_DialogPlayers =

{

private ["_c", "_Fid", "_Fname", "_Fingame", "_Findex", "_Flistlen", "_Feigenenum"];
_Fid        = _this select 0;
_Fname      = _this select 1;
_Fingame    = _this select 2;
_Findex     = 0;
_Flistlen   = 0;
_Feigenenum = -1;

for [{_c=0}, {_c < (count INV_PLAYERSTRINGLIST)}, {_c=_c+1}] do

	{

	_Fspieler = INV_PLAYERSTRINGLIST select _c;

	if ( ((_Fingame) or (_Fspieler call ISSE_UnitExists)) ) then

		{

		if (_Fname) then

			{

			_Findex = lbAdd [_Fid, format ["%1 - (%2)", _Fspieler, name (call compile _Fspieler)]];

			}
			else
			{

			_Findex = lbAdd [_Fid, _Fspieler];

			};

			lbSetData [_Fid, _Findex, format["%1", _c]];
			if (_Fspieler == INV_ROLESTRING) then {_Feigenenum = _Flistlen;};
			_Flistlen = _Flistlen + 1;

		};

	};

[_Flistlen, _Feigenenum]

};

INV_CreateVehicle = {
	private ["_classname", "_position","_dir"];
	_classname = _this select 0;
	_logic	   = _this select 1;
	_type = typeof vehicle player;
	_type1 = ["MH6J_EP1"];
	_type2 = ["Mi17_Civilian","bd5j_civil_3","bd5j_civil_2","bd5j","GazelleUN","GazelleD","Gazelle","Gazelle1","Gazelle3",
	"adf_as350","ibr_as350_specops","ibr_as350_jungle","OH58g","UH1H_TK_GUE_EP1","MH60S","HH65C","ibr_as350_civ","UH1H_TK_GUE_EP1_LIN","PRACS_AB212_cas"];

	/*
		if ((_classname in _type1) or (_classname in _type2))  then
		{


			if (_classname in _type1) then
			{

			call compile format ['

			newvehicle = _classname createVehicle %4;
			newvehicle setpos %4;
			newvehicle setdir %5;
			newvehicle setVehicleInit "
			nul = [this] execVM ""heliDoor\heliDoor_init.sqf"";
			this setVehicleVarName ""vehicle_%1_%2"";
			vehicle_%1_%2 = this;
			clearWeaponCargo this;
			clearMagazineCargo this;
			newvehicle lock true;
			this setVariable [""Player_Vehicle"",true,true];
			this setVariable [""ILG_Player_Spawned"",true,true];
			";
			processInitCommands;
			INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2];
			INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];
			', player, round(time), INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];

			};
			if (_classname in _type2) then
			{

			call compile format ['

			newvehicle = _classname createVehicle %4;
			newvehicle setpos %4;
			newvehicle setdir %5;
			newvehicle setVehicleInit "
			nul = [this, 1] execVM ""\norrn_dbo_fastrope\scripts\NORRN_fastRope_init.sqf"";
			this setVehicleVarName ""vehicle_%1_%2"";
			vehicle_%1_%2 = this;
			clearWeaponCargo this;
			clearMagazineCargo this;
			newvehicle lock true;
			this setVariable [""Player_Vehicle"",true,true];
			";
			processInitCommands;
			INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2];
			INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];
			', player, round(time), INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];
			};


		}

		else
		{

		call compile format ['

		newvehicle = _classname createVehicle %4;
		newvehicle setpos %4;
		newvehicle setdir %5;
		newvehicle setVehicleInit "
		this setVehicleVarName ""vehicle_%1_%2"";
		vehicle_%1_%2 = this;
		clearWeaponCargo this;
		clearMagazineCargo this;
		newvehicle lock true;
		this setVariable [""Player_Vehicle"",true,true];
		";
		processInitCommands;
		INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2];
		INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];
		//"INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];if (""%3"" != """") then {[""CreatedVehicle"", vehicle_%1_%2, typeOf vehicle_%1_%2, %4] execVM ""%3"";};" call broadcast;
		', player, round(time), INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];

		};
		*/


	call compile format ['

		newvehicle = _classname createVehicle %4;
		newvehicle setpos %4;
		newvehicle setdir %5;
		newvehicle setVehicleInit "
		this setVehicleVarName ""vehicle_%1_%2"";
		vehicle_%1_%2 = this;
		clearWeaponCargo this;
		clearMagazineCargo this;
		newvehicle lock true;
		this setVariable [""Player_Vehicle"",true,true];
		";
		processInitCommands;
		', player, round(time), INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];

		[] call LinLib_fnc_KeysUpdate;
		"{_x call ENT_addTag}foreach INV_ServerVclArray;" call broadcast;


		newvehicle setVariable ["Veh_Owners",[[(getPlayerUID player),str(side player)]],true];

	//if (newvehicle iskindof "LandVehicle") then {newvehicle addWeaponCargo ["ItemRadio",1];};
	//if (newvehicle iskindof "Air") then {newvehicle addWeaponCargo ["ItemRadio",1];};

	if (_classname == "ilpd_slick_b40_PBG") then
	{
		newvehicle setVehicleInit "this setObjectTexture [0, 'Steve\factions\cg_vic.paa']";
		processInitCommands;
	};

	if (_classname == "tahoe_uc_white") then
	{
		newvehicle setVehicleInit "this setObjectTexture [0, 'Steve\factions\cg_tahoe.paa']";
		processInitCommands;
	};

	if (_classname == "rksl_efa_fgr4_raf_16") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};

	if (_classname == "CSJ_P38") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};

	if (_classname == "ibr_tucano_lin") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};

	if (_classname == "CSJ_Spitfire") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};

	if (_classname == "3lb_f22") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};

	if (_classname == "CSJ_109G") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};

	if (_classname == "CSJ_HHmkIIa") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		{newvehicle removeMagazine _x} forEach magazines newvehicle;

	};



	if (_classname == "general") then
	{
		newvehicle removeWeapon "DixieHorn";
		newvehicle addWeapon "carhorn";

	};
	
	if (_classname == "VIL_transit_truck") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		newvehicle addWeapon "truckhorn";
		

	};
	
	if (_classname == "VIL_sprinter_cargo") then
	{
		{newvehicle removeWeapon _x} forEach weapons newvehicle;
		newvehicle addWeapon "carhorn";
		

	};

	if (_classname == "Ikarus") then
	{
		newvehicle setVehicleInit "
		this setObjectTexture [0, '#(rgb,8,8,3)color(1,0.35,0.80,1)'];
		";
		processInitCommands;
		pussyAction = newvehicle addAction ["Play Music","Steve\factions\pussymusic.sqf",[],1,false,true,"","_this in _target"];
	};

	if (_classname == "HMMWV_Armored") then
	{
		newvehicle setVehicleInit "
		this setObjectTexture [0, '#(rgb,8,8,3)color(0,0,0.05,1)'];
		";
		processInitCommands;
	};

	if (_classname == "AH6J_EP1") then
		{
			newvehicle removeWeapon "FFARLauncher_14";
			newvehicle removeMagazine "14Rnd_FFAR";
		};

	if (_classname == "Ka60_PMC") then
		{
			newvehicle removeWeapon "57mmLauncher";
			newvehicle removeMagazine "14Rnd_57mm";
		};
	/*
	if (_classname == "CHRYSLER_P_limmo" && _logic == mhicarspawn) then
		{
			newvehicle setVehicleInit "
		this setObjectTexture [0, '#(rgb,8,8,3)color(0,0,0,1)'];
		";
		processInitCommands;
		};

	if (_classname == "Audi_RS4" && _logic == mhicarspawn) then
		{
			hint "Hello?";
			newvehicle setVehicleInit "
		this setObjectTexture [0, '#(rgb,8,8,3)color(0,0,0,1)'];
		";
		processInitCommands;
		};
		
	if (_classname == "tcg_suburban_white" && _logic == mhicarspawn) then
		{
			newvehicle setVehicleInit "
		this setObjectTexture [0, '#(rgb,8,8,3)color(0,0,0,1)'];
		";
		processInitCommands;
		};
		
	if (_classname == "tcg_bell206_3" && _logic == mhihelispawn) then
		{
			newvehicle setVehicleInit "
		this setObjectTexture [0, '#(rgb,8,8,3)color(0,0,0,1)'];
		";
		processInitCommands;
		};
	*/


	if (_classname == "Lada2_TK_CIV_EP1") then
	{
		jihadAction = newvehicle addAction ["Play Jihad Music","bombcarmusic.sqf",[],1,false,true,"","_this in _target"];
		detAction = newvehicle addAction ["Detonate","hippieboom.sqf",[],1,false,true,"","_this in _target"];
	};

	//IRA BOMB TRUCK
	if (_classname == "cl_fuel_mackr") then
		{
	    hint "WARNING: Once you have prepared the explosives to blow up your desired target you must ram it. Do NOT hit anything by mistake after the explosives are prepared/armed!";
	    fuelAction = newvehicle addAction ["Prepare explosion","fuelbomb.sqf",[],1,false,true,"","_this in _target"];
		};

	//PRACS CAS HUEY
	if (_classname == "PRACS_AB212_cas") then
		{
	  	newvehicle removeWeapon "FFARLauncher_14";
		newvehicle removeMagazine "14Rnd_FFAR";
		};

	//OH58b
	if (_classname == "OH58b") then
		{
	  	newvehicle removeWeapon "m296gun";
		newvehicle removeWeapon "kiowa2rndhellfirelauncher";
		newvehicle removeMagazine "m296";
		newvehicle removeMagazine "kiowa2rnd_hellfire";
		};

	//Wildcat
	if (_classname == "AW159_Lynx_BAF") then
		{
		newvehicle removeWeapon "CRV7_PG";
		newvehicle removeWeapon "M621";
		newvehicle removeMagazine "12Rnd_CRV7";
		newvehicle removeMagazine "1200Rnd_20mm_M621";
		newvehicle addweapon "towlauncher";
		newvehicle addmagazine "2rnd_tow2";
		newvehicle addmagazine "2rnd_tow2";
		newvehicle addweapon "m240";
		newvehicle addmagazine "100Rnd_762x51_M240";
		newvehicle addmagazine "100Rnd_762x51_M240";
		};

	// Attack helicopter re-armament
	// Ka-60
	if (_classname == "Ka60_GL_PMC") then
	{
		hint "Reconfiguring helicopter armament...";
		newvehicle removeWeapon "57mmLauncher";
		newvehicle removeMagazine "14Rnd_57mm";
		newvehicle addweapon "CMFlareLauncher";
		newvehicle addmagazine "60Rnd_CMFlareMagazine";

		};

	if (_classname == "ArmoredSUV_PMC") then
	{
		newvehicle addAction ["SUV Cover","noscript.sqf",'call SUV_Gun_Hatch;',1,false,true,"","_this in _target"];
	};
	
	//if (_classname == "cl_flatbed_mackr") then
	//{
	//	newvehicle addAction ["Put Car On Tow Truck","tow.sqf", 'newvehicle, (nearestobjects [getpos newvehicle, ["LandVehicle"], 10] select 0)', 1, true, true,"", "(newvehicle distance (nearestobjects [getpos newvehicle, ["LandVehicle"], 10] select 0) <= 10) && ((nearestobjects [getpos newvehicle, ["LandVehicle"], 10] select 0) getVariable ["BeingTowed", false]  == false) && ((newvehicle getVariable ["Towing", false]) == false) ", "", 10];
	//	newvehicle addAction ["Remove car from tow truck","untow.sqf", 'newvehicle, (nearestobjects [getpos newvehicle, ["LandVehicle"], 10] select 0)', 1, true, true,"", "((nearestobjects [getpos newvehicle, ["LandVehicle"], 10] select 0) attachedTo newvehicle) && ((nearestobjects [getpos newvehicle, ["LandVehicle"], 10] select 0) getVariable ["BeingTowed", true]  == true) && ((newvehicle getVariable ["Towing", false]) == false) ", "", 10];
	//};

	if (_logic == impoundarea1) then
	{
		newvehicle attachTo [impoundarea1,[0,0,30]];

	};

	publicVariable "INV_ServerVclArray";
};

INV_CreateWeapon =

{

private["_class", "_menge", "_crate"];
_class = _this select 0;
_menge = _this select 1;
_crate = _this select 2;
_crate setDammage 0;

_crate setvehicleinit format["
this addweaponCargo [""%1"",%2];
", _class, _menge];
processInitCommands;

};

INV_CreateMag =

{

private["_class", "_menge", "_crate"];
_class = _this select 0;
_menge = _this select 1;
_crate = _this select 2;
_crate setDammage 0;

_crate setvehicleinit format["
this addmagazineCargo [""%1"",%2];
", _class, _menge];
processInitCommands;

};

INV_CreateItem =

{

private["_class", "_menge", "_stor"];
_class = _this select 0;
_menge = _this select 1;
_stor  = _this select 2;
[_class, _menge, _stor] call INV_AddItemStorage;

};

BC_KillCar =
{
	//[] call BC_KillCar;
	private["_sel","_baitCar"];
	_sel = lbCurSel 1004;
	_baitCar = bc_baitcars select _sel;
	_baitCar lock true;
	while {fuel _baitCar > 0} do
	{
		_baitCar setFuel ((fuel _baitCar) - 0.2);
	};
};
