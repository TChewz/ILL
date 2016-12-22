_art = _this select 0;




if (_art == "use") then
{
	_item = _this select 1;
 	_anzahl = _this select 2;
  	if (!(createDialog "schluessel")) exitWith {hint "Dialog Error!";};

 	//Set Actions
 	//Use
  	buttonSetAction [2, "
	['schluessel', lbdata [1,(lbCurSel 1)], lbCurSel 1] execVM 'keys.sqf';
	closeDialog 0;
	"];

	//Drop keys
	buttonSetAction [4, "
	['dropschluessel', lbdata [1,(lbCurSel 1)], lbCurSel 1] execVM 'keys.sqf';
	closeDialog 0;
	"];

	//Give keys to player
	buttonSetAction [5, "
	['schluesseluebergabe', lbdata [1,(lbCurSel 1)], lbCurSel 1] execVM 'keys.sqf';
	closeDialog 0;
	"];

	{
		if (_x call Own_This_Vehicle) then 
	 	{
	    		_index = lbAdd [1, format ["%1(%2)", getText (configFile >> "cfgVehicles" >> typeOf (_x) >> "displayName"), _x]];
	    		lbSetData [1, _index, format["%1",_x]];
	    	};
	}forEach vehicles;



};
if (_art == "schluessel") then
{
	_vcl = call compile (_this select 1);//Is a string needs compiling
    	_sel = _this select 2;

   	if (player distance _vcl < 20) then
 	{
   		if (!(locked _vcl)) then
 		{
	 		format ["%1 lock true;", _vcl] call broadcast;
   			titleText[localize "STRS_inv_items_vehiclelock_locked","Plain down",0.1];
 		} else {
	 		format ["%1 lock false;", _vcl] call broadcast;
   			titleText[localize "STRS_inv_items_vehiclelock_unlocked","Plain down",0.1];
 		};

  	} else {
	  	player groupChat localize "STRS_inv_items_vehiclelock_closer";
 	};
};



if (_art == "dropschluessel") then
{
	//player groupchat "Sorry, function removed.";

  	_vcl = call compile (_this select 1);
    	_sel = _this select 2;

   	[player,_vcl] call Remove_veh_Owner;

	[] call LinLib_fnc_KeysUpdate;
 	player groupChat localize "STRS_inv_items_weggeworfen";
};

if (_art == "schluesseluebergabe") then
{
	_vcl = _this select 1;
 	_sel = _this select 2;
 	_spielernum = call compile INV_InventarGiveReceiver;
	_spieler = INV_PLAYERSTRINGLIST select _spielernum;
 	_playerobject = INV_PLAYERLIST select _spielernum;
   	if (!(_spieler call ISSE_UnitExists))	exitWith
   	{
		player groupChat localize "STRS_inv_not_ingame";
	};

	if (_playerobject == player) exitWith
	{
		player groupChat localize "STRS_inv_inventar_uebergabe_self";
	};

   	if (player distance _playerobject > 20)	exitWith
   	{
		player groupChat localize "STRS_inv_inventar_uebergabe_distance";
	};


	_dispName = getText (configFile >> "cfgVehicles" >> typeOf (call compile (_vcl)) >> "displayName");
	format['if (player == %1) then {titleText ["%2 Gave you some keys to a %3.","plain down"];};',_playerobject,name player,_dispName] call broadcast;
	titleText[format["You gave %1 keys to a %2",name _playerobject,_dispName],"Plain"];

	[_playerobject,call compile (_vcl)] call Add_veh_Owner;


};
