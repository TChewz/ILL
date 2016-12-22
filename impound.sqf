_vcl = _this select 0;
_art = _this select 1;

if(_art == "impound")then
{
	if ((count crew _vcl) > 0) exitWith {player groupChat "The vehicle is not empty!"};
	if(_vcl distance impoundarea2 < 30)exitwith{player groupchat "the vehicle is already impounded!"};
	if(_vcl distance impoundarea1 < 35)exitwith{player groupchat "You cannot impound here!"};
	_incarpark = false;
	{if ((player distance (_x select 0)) < (_x select 1)) then {_incarpark = true};} forEach INV_VehicleGaragen;
	if(_incarpark)exitwith{player groupchat "this vehicle is in a carpark. you cannot impound it!"};
	_DN = getText (configFile >> "cfgVehicles" >> typeOf (_vcl) >> "displayName");
	_vcl attachTo [impoundarea1,[0,0,30]];
	_Mishy = 2000;
	['Mishy', _Mishy] call INV_AddInvItem;
	player groupChat "You have been paid $2000 for cleaning up the streets";
	_VehicleDisplayName = getText (configFile >> "cfgVehicles" >> (typeOf _vcl) >> "displayName");
	_Vcl setVariable ["Impounded", true, true];
	format['hint format["Vehicle Impound\n\n%1(%2) has impounded a %3 with the registration %4"];',name player,player,_DN,_vcl] call broadcast;
	if (isServer) then
	{
		//Auto impound
		format['if (%1 call Own_This_Vehicle) then {systemchat format["Your %2 has despawned. You can retrieve it an any impound lot."];};',_vcl,_VehicleDisplayName] call broadcast;
	}
	else
	{
		//Player impound
		format['if (%1 call Own_This_Vehicle) then {systemchat format["%2(%3) has impounded your %4. You can retrieve it an any impound lot."];};',_vcl,name player,player,_VehicleDisplayName] call broadcast;
	};


	_vcl setDammage 0;
	_vcl setvehiclelock "locked";
	_vFuel = fuel _vcl;
	_vcl setFuel 0;
	sleep 2;
	_vcl setFuel _vFuel;
};

if(_art == "buy")then
{
	_Mishy = "Mishy" call INV_getitemamount;
	if(_Mishy < impoundpay)exitwith{player groupchat "you do not have enough money"};
	['Mishy', -impoundpay] call INV_AddInvItem;
	_vcl = call compile format["%1", _vcl];
	_String = "an unknown location";
	detach _vcl;
	_VehicleDisplayName = getText (configFile >> "cfgVehicles" >> (typeOf _Vcl) >> "displayName");

	switch (true) do
	{
		case (iscop && (player distance (getPos copcar)) < 15): {
			_vcl setPos (getPos ck9spawn);
			_vcl setDir (getDir ck9spawn);
			_String = "the Main Police HQ";
		};
		case (iscop && (player distance (getPos copcar1)) < 15): {
			_vcl setPos (getPos ccarspawn1);
			_vcl setDir (getDir ccarspawn1);
			_String = "the Sheriff's Office";
		};
		case (iscop && (player distance (getPos copswatcars)) < 15): {
			_vcl setPos (getPos ccarspawnswat);
			_vcl setDir (getDir ccarspawnswat);
			_String = "the SWAT Base";
		};
		case (iscop && (player distance (getPos copfbicars)) < 15): {
			_vcl setPos (getPos ccarspawnfbi);
			_vcl setDir (getDir ccarspawnfbi);
			_String = "the VICE HQ";
		};
		case (isciv && (player distance (getPos impoundbuy)) < 15): {
			_vcl setPos (getPos impoundarea2);
			_vcl setDir (getDir impoundarea2);
			_String = "the Civil Spawn Impound lot";
		};
		case (isciv && (player distance (getPos airatm)) < 15): {
			_vcl setPos (getPos asairspawn);
			_vcl setDir (getDir asairspawn);
			_String = "the Emita Airport";
		};
		case (iscop && (player distance (getPos copair)) < 10): {
			_vcl setPos (getPos cairspawn);
			_vcl setDir (getDir cairspawn);
			_String = "the Cop Air Unit";
		};
		case (isciv && ((player distance (getPos civ_boat)) < 15)): {
			_vcl setPosASL (getPos civ_boat_unimpound_spawn);
			_cvl setDir (getDir civ_boat_unimpound_spawn)
		};
		case (iscop && ((player distance (getPos cop_boat)) < 15)): {
			_vcl setPosASL (getPos cop_boat_unimpound_spawn);
			_cvl setDir (getDir cop_boat_unimpound_spawn)
		};
	};
	systemchat format ["You've retrieved the %1. It's spawned at %2",_VehicleDisplayName,_String];
	_vcl setVariable ["Impounded", false, true];
};
