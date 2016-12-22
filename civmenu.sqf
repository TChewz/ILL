_loopart = _this select 0;
_Mishy    = 'Mishy' call INV_GetItemAmount;
if (_loopart == "disarm") then

{

call INV_EntferneIllegales;
R_Weapon_Holster = nil;
P_Weapon_Holster = nil;
player groupChat localize "STRS_civmenucheck_beendisarmed";

};


if (_loopart == "ticket") then

{

_strafe = _this select 1;
_cop    = _this select 2;
_didpay = 0;
_copplayernumber = playersNumber west;
_copticket = round(_strafe/_copplayernumber);

if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};

ctrlSetText [1, format["%1 gave you a ticket of $%2. Do you want to pay?", _cop, (_strafe call ISSE_str_IntToStr)]];

waitUntil{(not(ctrlVisible 1023))};

if (Antwort == 1) then

	{

	if ((_Mishy + bnkgeld) < _strafe) exitwith

		{

		(format ["server globalChat format [localize ""STRS_civmenu_didnotpayticket"", name %2, %3];", _cop, player, (_strafe call ISSE_str_IntToStr), (_didnotpay call ISSE_str_IntToStr)]) call broadcast;

		};

	false call TurnWantedFunc;
	player groupChat format [localize "STRS_civmenucheck_ticketself", (_strafe call ISSE_str_IntToStr)];
	(format ["server globalChat format [localize ""STRS_civmenu_didpayticket"", name %2, %3];[""Ticket"", %2, %3] spawn Isse_AddCrimeLogEntry;if (iscop) then{player groupChat ""You got $%4 because the %2 paid the ticket."";[""Mishy"", %4] call INV_AddInvItem;};kopfMishy_%2 = kopfMishy_%2 - %3; if(kopfMishy_%2 < 0)then{kopfMishy_%2 = 0};", _cop, player, (_strafe call ISSE_str_IntToStr), (_copticket call ISSE_str_IntToStr)]) call broadcast;

	if(_Mishy > _strafe) exitwith {['Mishy', -(_strafe)] call INV_AddInvItem;};
	if (bnkgeld > _strafe) exitwith {bnkgeld = bnkgeld - _strafe;};

	if ((_Mishy + bnkgeld) > _strafe) exitwith

		{

		_strafe1 = _Mishy;
		_strafe2 = _strafe - _strafe1;
		['Mishy', -(_strafe1)] call INV_AddInvItem;
		bnkgeld = bnkgeld - _strafe2;

		};

	};

if (Antwort == 2) then

	{

	(format ["server globalChat format [localize ""STRS_civmenu_didpaynothing"", name %2];", _cop, player, (_strafe call ISSE_str_IntToStr)]) call broadcast;
	player groupChat localize "STRS_civmenu_youdidnotpay";

	};

};

if (_loopart == "drugs") then {
	_checkcop = _this select 1;
	drugsvalue = 0;
	if ([] call INV_HasIllegalItems) then {
		_ItemsBusted = [];
		_Reasons = [];
		_TotalBounty = 0;
		{
			_Item = (_x select 0);
			_NumberOfIllegalItems = _item call INV_GetItemAmount;
			if (_Item call INV_getitemIsIllegal && !(_Item in _ItemsBusted) && (_NumberOfIllegalItems != 0)) then {
				_ItemInformation = _item call INV_getitemArray;
				_ItemBuyCost = _ItemInformation call INV_getitemBuyCost;
				_ItemsBusted = _ItemsBusted + [_Item];
				_IllegalValue = _NumberOfIllegalItems * _ItemBuyCost;
				_TotalBounty = _TotalBounty + _IllegalValue;
				_Reasons = _Reasons + [[(_Item call INV_getitemName), _NumberOfIllegalItems]];
			};
		} count INV_InventarArray;
		_Str = "Possession of Illegal Item(s) ";
		{
			_Str = _Str + format [" | %1 x %2", (_x select 0), (_x select 1)];
		} count _Reasons;
		(format['if(!("%3" in %1_reason))then{%1_reason = %1_reason + ["%3"]}; %1_wanted = 1; kopfMishy_%1 = kopfMishy_%1 + %2;', player, _TotalBounty, _Str]) call broadcast;
		(format ['if (player == %3) then {titleText ["%1 was searched and caught with $%2 worth of illegal items on them!", "PLAIN"];};', name player, _TotalBounty, _checkcop]) call broadcast;
		{
	     if ( ((_x select 0) call INV_getitemAmount) > 0) then
	     {
	        if ((_x select 0) call INV_getitemIsIllegal) then {[(_x select 0), 0] call INV_SetItemAmount;};
	     };
	  } count INV_InventarArray;
		player groupChat localize "STRS_civmenucheck_beendrugsearched";
	} else {
		(format ["if (player == %2) then {player groupChat localize ""STRS_civmenu_hasnodrugs"";};", player, _checkcop]) call broadcast;
	};
};

if ((_loopart == "arrest") and (player distance prisonflag <= 75))  then

{
//Emita county jail (ILG)

_prisondauer = (_this select 1)*60;
_copobj      = _this select 2;
_exitart     = "";

if (!(player call ISSE_IsVictim)) exitwith {(format ["if (rolestring == ""%1"") then {player groupchat localize ""STRS_inventory_checknohands""};", _copobj]) call broadcast;};
(format['if(rolestring == "%1")then{execVM "detach.sqf";};',_copobj]) call broadcast;

_civkopfMishy = call compile format ["kopfMishy_%1", player];

if (_civkopfMishy != 0) then

	{

	(format['if(rolestring == "%1")then{bnkgeld = bnkgeld + %2; player groupChat "This civ had a bounty of $%2! You got that bounty!"}', _copobj, _civkopfMishy]) call broadcast;

	};

(format ["server GLOBALCHAT format [localize ""STRS_civmenucheck_arrested_global"", name %1, name %3, %2]; [""PrisonIn"", %1, %3] spawn Isse_AddCrimeLogEntry; kopfMishy_%1 = (%2*10000);%1_wanted = 0;%1_arrest = 1;", player, ((_prisondauer/60) call ISSE_str_IntToStr), _copobj]) call broadcast;

_prisonarray = ["prisonspawn","prisonspawn2","prisonspawn3","prisonspawn4","prisonspawn5","prisonspawn6","prisonspawn7","prisonspawn8"];
_prispos = _prisonarray call bis_fnc_selectrandom;
player setpos getmarkerpos _prispos;

(format ["%1 switchmove ""%2"";", player, "normal"]) call broadcast;
player setVariable ["restrained",false,true];
player setVariable ["RestrainedBy", -1, true];
call INV_EntferneIllegales;
local_arrest    = 1;
["local_arrest", local_arrest] spawn ClientSaveVar;
INV_hunger      = 0;
CivTimeInPrison = (_this select 1);
player groupChat format [localize "STRS_civmenucheck_arrested_self", (CivTimeInPrison call ISSE_str_IntToStr)];
stolencash = 0;
player setDammage 0;

_counter = 0;
_tBounty = (_prisondauer/60)*10000;
_elapsed = 0;
_left = 0;
_L_m_s = "";
_E_m_s = "";

while {true} do

	{

	_freigelassen = call compile format ["%1_arrest", player];
	_bounty       = call compile format["kopfMishy_%1", player];
	_frac 	      = _bounty/_tBounty;
	_timetotake   = round(_prisondauer*_frac);
	_timeleft = _prisondauer - _counter;
	call compile format["kopfMishy_%1 = kopfMishy_%1 - (10000/60)", player];
	if (_counter > 60) then {_elapsed = floor(_counter/60); _E_M_S = "m";}else{_elapsed = _counter; _E_M_S = "s";};
	if ((_prisondauer-_counter) > 60) then {_left = ceil(_timeleft/60); _L_M_S = "m";}else{_left = _timeleft; _L_M_S = "s";};

	if (isNull(player))                      exitWith {_exitart = ""};
	if (!(alive player))                     exitWith {_exitart = "tot"};
	if (_counter >= _prisondauer)             exitWith {_exitart = "frei"};
	if (_freigelassen == 0)                   exitWith {_exitart = "freigelassen"};
	if (player Distance prison_logic >= 40) exitWith {_exitart = "ausbruch"};
	if (_bounty <= 0)			  exitwith {_exitart = "freigelassen"};
	hintSilent parsetext format
	["<t color='#FF0000' size='2.23'>** Emita Jail **<br/><t color='#ffffff' size='1.5'>Time Elapsed:<br/>%1%3<br/>Time Remaining:<br/>%2%4",_elapsed,_left,_E_M_S,_L_M_S];

	_counter = _counter + 1;
	sleep 1;

	};

if ((_exitart == "frei") or (_exitart == "freigelassen")) then

	{
		//Time up

	player setPos getMarkerPos "jail_freemarker";	player setDammage 0;
	hintSilent parsetext format ["<t color='#FF0000' size='2.23'>** Emita Jail **<br/><t color='#ffffff' size='1.5'>Sentence over"];
	(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar; player groupChat localize ""STRS_civmenucheck_free_self"";}; server GLOBALCHAT format [localize ""STRS_civmenucheck_free_global"", name %1]; [""PrisonOut"", %1] spawn Isse_AddCrimeLogEntry; %1_reason = []; kopfMishy_%1 = 0; %1_arrest = 0;", player]) call broadcast;

	};

if (_exitart == "ausbruch") then

	{
		//Escaped
		hintSilent parsetext format ["<t color='#FF0000' size='2.23'>** Emita Jail **<br/><t color='#ffffff' size='1.5'>Jail Break!<br/>The Cops are en route."];
	(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar;}; %1_arrest = 0; if(!(""escaping from jail"" in %1_reason))then{%1_reason = %1_reason + [""escaping from jail""]}; %1_wanted = 1; kopfMishy_%1 = 20000; server GLOBALCHAT format [localize ""STRS_civmenucheck_breakout"", name %1]; [""PrisonEsc"", %1] spawn Isse_AddCrimeLogEntry;", player]) call broadcast;

	};


};

if ((_loopart == "arrestcop") and (player distance prisonflag <= 75))  then

{
//Emita county jail (ILG)

_prisondauer = (_this select 1)*60;
_copobj      = _this select 2;
_exitart     = "";

if (!(player call ISSE_IsVictim)) exitwith {(format ["if (rolestring == ""%1"") then {player groupchat localize ""STRS_inventory_checknohands""};", _copobj]) call broadcast;};
(format['if(rolestring == "%1")then{execVM "detach.sqf";};',_copobj]) call broadcast;

_civkopfMishy = call compile format ["kopfMishy_%1", player];

if (_civkopfMishy != 0) then

	{

	(format['if(rolestring == "%1")then{bnkgeld = bnkgeld + %2; player groupChat "This civ had a bounty of $%2! You got that bounty!"}', _copobj, _civkopfMishy]) call broadcast;

	};

(format ["server GLOBALCHAT format [localize ""STRS_civmenucheck_arrested_global"", name %1, name %3, %2]; [""PrisonIn"", %1, %3] spawn Isse_AddCrimeLogEntry; kopfMishy_%1 = (%2*10000);%1_wanted = 0;%1_arrest = 1;", player, ((_prisondauer/60) call ISSE_str_IntToStr), _copobj]) call broadcast;


player setPos getPos CopPrison;

(format ["%1 switchmove ""%2"";", player, "normal"]) call broadcast;
player setVariable ["restrained",false,true];
player setVariable ["RestrainedBy", -1, true];
call INV_EntferneIllegales;
local_arrest    = 1;
["local_arrest", local_arrest] spawn ClientSaveVar;
INV_hunger      = 0;
CivTimeInPrison = (_this select 1);
player groupChat format [localize "STRS_civmenucheck_arrested_self", (CivTimeInPrison call ISSE_str_IntToStr)];
stolencash = 0;
player setDammage 0;

_counter = 0;
_tBounty = (_prisondauer/60)*10000;
_elapsed = 0;
_left = 0;
_L_m_s = "";
_E_m_s = "";

while {true} do

	{

	_freigelassen = call compile format ["%1_arrest", player];
	_bounty       = call compile format["kopfMishy_%1", player];
	_frac 	      = _bounty/_tBounty;
	_timetotake   = round(_prisondauer*_frac);
	_timeleft = _prisondauer - _counter;
	call compile format["kopfMishy_%1 = kopfMishy_%1 - (10000/60)", player];
	if (_counter > 60) then {_elapsed = floor(_counter/60); _E_M_S = "m";}else{_elapsed = _counter; _E_M_S = "s";};
	if ((_prisondauer-_counter) > 60) then {_left = ceil(_timeleft/60); _L_M_S = "m";}else{_left = _timeleft; _L_M_S = "s";};

	if (isNull(player))                      exitWith {_exitart = ""};
	if (!(alive player))                     exitWith {_exitart = "tot"};
	if (_counter >= _prisondauer)             exitWith {_exitart = "frei"};
	if (_freigelassen == 0)                   exitWith {_exitart = "freigelassen"};
	if (player Distance prison_logic >= 40) exitWith {_exitart = "ausbruch"};
	if (_bounty <= 0)			  exitwith {_exitart = "freigelassen"};
	hintSilent parsetext format
	["<t color='#FF0000' size='2.23'>** Emita Jail **<br/><t color='#ffffff' size='1.5'>Time Elapsed:<br/>%1%3<br/>Time Remaining:<br/>%2%4",_elapsed,_left,_E_M_S,_L_M_S];

	_counter = _counter + 1;
	sleep 1;

	};

if ((_exitart == "frei") or (_exitart == "freigelassen")) then

	{
		//Time up

	player setPos getMarkerPos "respawn_west_SOBR";	player setDammage 0;
	hintSilent parsetext format ["<t color='#FF0000' size='2.23'>** Emita Jail **<br/><t color='#ffffff' size='1.5'>Sentence over"];
	(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar; player groupChat localize ""STRS_civmenucheck_free_self"";}; server GLOBALCHAT format [localize ""STRS_civmenucheck_free_global"", name %1]; [""PrisonOut"", %1] spawn Isse_AddCrimeLogEntry; %1_reason = []; kopfMishy_%1 = 0; %1_arrest = 0;", player]) call broadcast;

	};

if (_exitart == "ausbruch") then

	{
		//Escaped
		player setPos getPos CopPrison;

	};


};

/////////////////////////////////////////////////////////////////////////////////////

if (_loopart == "inventcheck") then

{
_aktionsStarter = _this select 1;
(format ['if (rolestring == "%1") then {[0, 0, 0, ["inventorycheck", %2, %3, %4]] execVM "maindialogs.sqf";};',_aktionsStarter, INV_LizenzOwner, INV_InventarArray, player]) call broadcast;

};


if (_loopart == "licheck") then

{
_aktionsStarter = _this select 1;

(format ['if (rolestring == "%1") then {[0, 0, 0, ["licensecheck", %2, %3, %4]] execVM "maindialogs.sqf";};',_aktionsStarter, INV_LizenzOwner, INV_InventarArray, player]) call broadcast;

};

if (_loopart == "stealmoney") then
{
	_aktionsStarter = _this select 1;

	if(stolenfromtimeractive) exitwith
	{
		(format ['if (rolestring == "%1") then {hint "%2 has been stolen from recently";};',_aktionsStarter, name player]) call broadcast;
	};
	_Mishy  = 'Mishy' call INV_GetItemAmount;
	_amounttosteal = (floor(random _Mishy));
	["Mishy", -(_amounttosteal)] call INV_AddInventoryItem;
	(format ['if (rolestring == "%1") then {["Mishy", %2] call INV_AddInventoryItem;};hint "%1 stole $%2 from %3";',_aktionsStarter, _amounttosteal, name player]) call broadcast;

	stolenfromtimeractive = true;
	sleep 900;
	stolenfromtimeractive = false;
};

if ((_loopart == "arrest") and (player distance cellflag <= 40))  then

{

_prisondauer = (_this select 1)*60;
_copobj      = _this select 2;
_exitart     = "";

if (!(player call ISSE_IsVictim)) exitwith {(format ["if (rolestring == ""%1"") then {player groupchat localize ""STRS_inventory_checknohands""};", _copobj]) call broadcast;};

_civkopfMishy = call compile format ["kopfMishy_%1", player];

if (_civkopfMishy != 0) then

	{

	(format['if(rolestring == "%1")then{bnkgeld = bnkgeld + %2; player groupChat "This civ had a bounty of $%2! You got that bounty!"}', _copobj, _civkopfMishy]) call broadcast;

	};

(format ["server GLOBALCHAT format [localize ""STRS_civmenucheck_arrested_global"", name %1, name %3, %2]; [""PrisonIn"", %1, %3] spawn Isse_AddCrimeLogEntry; kopfMishy_%1 = (%2*10000);%1_wanted = 0;%1_arrest = 1;", player, ((_prisondauer/60) call ISSE_str_IntToStr), _copobj]) call broadcast;

player setpos getmarkerpos "cellspawn";

(format ["%1 switchmove ""%2"";", player, "normal"]) call broadcast;
player setVariable ["restrained",false,true];
call INV_EntferneIllegales;
local_arrest    = 1;
["local_arrest", local_arrest] spawn ClientSaveVar;
INV_hunger      = 0;
CivTimeInPrison = (_this select 1);
player groupChat format [localize "STRS_civmenucheck_arrested_self", (CivTimeInPrison call ISSE_str_IntToStr)];
stolencash = 0;
player setDammage 0;

_counter = 0;
_tBounty = (_prisondauer/60)*10000;

while {true} do

	{

	_freigelassen = call compile format ["%1_arrest", player];
	_bounty       = call compile format["kopfMishy_%1", player];
	_frac 	      = _bounty/_tBounty;
	_timetotake   = round(_prisondauer*_frac);
	call compile format["kopfMishy_%1 = kopfMishy_%1 - (10000/60)", player];

	hintsilent format["Time until release: %1 seconds\nBail left to pay: $%2", _timetotake, round(_bounty)];

	if (isNull(player))                      exitWith {_exitart = ""};
	if (!(alive player))                     exitWith {_exitart = "tot"};
	if (_counter >= _prisondauer)             exitWith {_exitart = "frei"};
	if (_freigelassen == 0)                   exitWith {_exitart = "freigelassen"};
	if (player Distance cell_logic >= 35) exitWith {_exitart = "ausbruch"};
	if (_bounty <= 0)			  exitwith {_exitart = "freigelassen"};

	_counter = _counter + 1;
	sleep 1;

	};

if ((_exitart == "frei") or (_exitart == "freigelassen")) then

	{

	player setPos getMarkerPos "jail_freemarker";	player setDammage 0;
	(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar; player groupChat localize ""STRS_civmenucheck_free_self"";}; server GLOBALCHAT format [localize ""STRS_civmenucheck_free_global"", name %1]; [""PrisonOut"", %1] spawn Isse_AddCrimeLogEntry; %1_reason = []; kopfMishy_%1 = 0; %1_arrest = 0;", player]) call broadcast;

	};

if (_exitart == "ausbruch") then

	{

	(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar;}; %1_arrest = 0; if(!(""escaping from jail"" in %1_reason))then{%1_reason = %1_reason + [""escaping from jail""]}; %1_wanted = 1; kopfMishy_%1 = 20000; server GLOBALCHAT format [localize ""STRS_civmenucheck_breakout"", name %1]; [""PrisonEsc"", %1] spawn Isse_AddCrimeLogEntry;", player]) call broadcast;

	};

};


if (_loopart == "licheck") then

{
_aktionsStarter = _this select 1;

(format ['if (rolestring == "%1") then {[0, 0, 0, ["licensecheck", %2, %3, %4]] execVM "maindialogs.sqf";};',_aktionsStarter, INV_LizenzOwner, INV_InventarArray, player]) call broadcast;

};
