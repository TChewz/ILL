_array = _this select 3;
_art   = _array select 0;
_Mishy  = 'Mishy' call INV_GetItemAmount;_zusatzString = "";

_lbAdd =
{
	private ["_element","_text","_this"];

	_element = _this select 0;
	_text = _this select 1;
	if (!(ctrlVisible _element)) exitWith {};
	_ret = lbAdd[_element,_text];
	_ret
};



if ((count _array)>1) then
{
	_zusatzString = _array select 1;
};

if (_art == "bail") then
{
	if (!(createDialog "baildialog")) exitWith {hint "Dialog Error!";};
	sliderSetRange [2, 100, 250000];		sliderSetSpeed [2, 1, 50];

	while {(ctrlVisible 1008)} do
	{
		ctrlSetText [1, format["$%1", ((round(sliderPosition 2)) call ISSE_str_IntToStr)]];
		sleep 0.3;
	};
};

if (_art == "civcam") then
{
	if (!(createDialog "civcamdialog")) exitWith {hint "Dialog Error!";};
	[2, 1, true, false] call DialogSpielerListe;
	lbSetCurSel    [1, 0];
	sliderSetRange [2, 5, 30];
	sliderSetSpeed [2, 1, 5];

	while {ctrlVisible 1002} do
	{
		ctrlSetText [3, format["$%1", (((round(sliderPosition 2))*100) call ISSE_str_IntToStr)]];
		ctrlSetText [5, format["%1s", ((round(sliderPosition 2)) call ISSE_str_IntToStr)]];

		sleep 0.3;
	};
};

if (_art == "wantedrelease") then
{
	if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
	[2, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, 0];
	[2, 11, true, false] call DialogSpielerListe;
	lbSetCurSel [11, 0];

	while {ctrlVisible 1007} do
	{
		sleep 0.3;
	};
};


if (_art == "spielerliste") then
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_trennlinie = "=================================================================================";
	_sub_trennlinie = "-----------------------------------------------------------------------------------------------------------------------";
	if (!ILG_Has_Modpack) then
	{
		{
			_ind = lbAdd [1,_x];
			lbSetColor [1,_ind,[1,0,0,1]];
		}foreach ["You don't have the @ILG Modpack!",
		"The @ILG Modpack gives you access to our latest content,",
		"While ensuring your game is opimised with our mission file!",
		"Please download the @ILG Modpack as soon as possible!",
		"More details on our website: IslandLifeLiberation.net"];

		_ind = lbAdd [1, _trennlinie/*newv1*/];
		lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	};
	[1, format ["Date:     %3.%2.%1", (date select 0), (date select 1), (date select 2)]] call _lbAdd;
	[1, pub_runtime_var] call _lbAdd;
	_ind = lbAdd [1, _trennlinie/*newv1*/];
	lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	[1, localize "STRS_statdialog_playerinfo"] call _lbAdd;
	[1, format ["Money: $%2", localize "STRS_statdialog_health", (('Mishy' call INV_GetItemAmount) call ISSE_str_IntToStr)]] call _lbAdd;
	[1, format ["Savings: $%2", localize "STRS_statdialog_health", bnkgeld call ISSE_str_IntToStr]] call _lbAdd;
	[1, format ["Whitelist UID: %1",(getplayeruid player)]] call _lbAdd;
	if (isciv) then {[1, (format ["Street Reputation:  %1", streetrep])] call _lbAdd;};
	[1, format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_Tragfaehigkeit]] call _lbAdd;
	 [1, format ["%1: %2",    localize "STRS_statdialog_copkills", CopsKilled]]call _lbAdd;
	 [1, format ["%1: %2",    localize "STRS_statdialog_civkills", CivsKilled]]call _lbAdd;
	 [1, format ["%1: %2",    localize "STRS_statdialog_selfkills", SelfKilled]]call _lbAdd;
	 [1, format ["%1: %2",    localize "STRS_statdialog_deaths", deadtimes]]call _lbAdd;
	 [1, format ["%1: %2 seconds",    "Respawn time", round(DeadWaitSec+extradeadtime)]]call _lbAdd;
	if(isciv)then{ [1, format ["%1: %2",    "Demerit points", demerits]]call _lbAdd;};
	 [1, format ["Players: 	%1",pub_playercount]]call _lbAdd;
	 [1, format ["Cops: 	%1",pub_copcount]]call _lbAdd;
	 [1, format ["Civs: 	%1",pub_civcount]]call _lbAdd;
	 [1, format ["ESU: 	%1",pub_esucount]]call _lbAdd;

	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, localize "STRS_statdialog_licenselist"]call _lbAdd;
	for [{_i=0}, {_i < (count INV_Lizenzen)}, {_i=_i+1}] do
	{
		if (((INV_Lizenzen select _i) select 0) call INV_HasLicense) then
		{
			 [1, ((INV_Lizenzen select _i) select 2)];
		};
	};
	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	[1, "I L G	GOVERNOR"]call _lbAdd;
	if (not(MayorNumber == -1)) then
	{
		 [1, (playerstringarray select MayorNumber)]call _lbAdd;
		 [1, format["%1",name(call compile(playerstringarray select MayorNumber))]] call _lbAdd;
	};
	if (ILG_Voting_Enable) then
	{
		 [1, "Governor Elections are: Open"]call _lbAdd;
	}
	else
	{
		 [1, "Governor Elections are: Closed"]call _lbAdd;
	};
	//_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	//lbAdd [1, "I L G Chief of Police"];
	//if (not(chiefNumber == -1)) then
	//{
	//	lbAdd [1, (playerstringarray select chiefNumber)];
	//};
	//Internal Affairs do it now
	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, "Mafia Members:"]call _lbAdd;
	{[1,_x] call _lbAdd}foreach pub_maflist;
	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, "GANGS:"]call _lbAdd;
	for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do

	{
	_ind = lbAdd [1, _sub_trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];

	_gangarray = gangsarray select _i;
	_gangname  = _gangarray select 0;
	_members   = _gangarray select 1;
	_territory = "None";

	_control1 = gangarea1 getvariable "control";
	_control2 = gangarea2 getvariable "control";
	_control3 = gangarea3 getvariable "control";
	_control4 = gangarea4 getvariable "control";
	_control5 = gangarea5 getvariable "control";

	if(_control1 == _gangname)then{if(_territory == "None")then{_territory = "Emita Castle"}else{_territory = _territory + ", Emita Castle"};};
	if(_control2 == _gangname)then{if(_territory == "None")then{_territory = "South District"}else{_territory = _territory + ", South District"};};
	if(_control3 == _gangname)then{if(_territory == "None")then{_territory = "Roseyard"}else{_territory = _territory + ", Roseyard"};};
	if(_control4 == _gangname)then{if(_territory == "None")then{_territory = "Abandoned Prison"}else{_territory = _territory + ", Abandoned Prison"};};
	if(_control5 == _gangname)then{if(_territory == "None")then{_territory = "Little Havana"}else{_territory = _territory + ", Little Havana"};};

	 [1, format["%1", _gangarray select 0]]call _lbAdd;
	 [1, format["Territory: %1",_territory]]call _lbAdd;
	 [1, format["Members:"]]call _lbAdd;
	private "_j"; /// BUG FIX
	for [{_j=0}, {_j < (count _members)}, {_j=_j+1}] do {if(_j == 0)then{ [1, format["%1 (leader)", _members select _j]]call _lbAdd;}else{ [1, format["%1", _members select _j]]call _lbAdd;};};
	};

	_ind =  [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, "Emita Bank Funds:"]call _lbAdd;
	 [1, (format ["Est. total funds in the main bank safe: $%1", robpoolsafe1])]call _lbAdd;
	 [1, "Goodfella's Safe Funds:"]call _lbAdd;
	 [1, (format ["Est. total funds in the Goodfellas bank safe: $%1", mafiabank])]call _lbAdd;
	if(!local_useBankPossible)then{ [1, (format ["Bank lockout time remaining: %1 seconds.", round rblock])]call _lbAdd;};

	if(!local_useBankPossible)then{_ind =  [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, (format ["Bank lockout time remaining: %1 seconds.", round rblock])]call _lbAdd;};

	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];


	 [1, localize "STRS_statdialog_laws"]call _lbAdd;
	_i = 0;
	{
		if (not(_x == "")) then
		{
			_i = _i + 1;
			 [1, (format ["%1: %2", _i, _x])]call _lbAdd;
		};
	}
	forEach GesetzArray;
	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, localize "STRS_statdialog_taxes"]call _lbAdd;
	{
		if ((_x select 2) > 0) then
		{
			lbAdd [1, format["%1: %2", (_x select 1), (_x select 2)]];
		};
	}
	foreach INV_ItemTypenArray;
	 [1, format["Transfer: %1", bank_steuer] ]call _lbAdd;

	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];

	 [1, "D E M A N D (Oil):"];
	_demand = (((tankencost - 100)/200)*100);
	 [1, format["Oil Barrel Trader: %1", _demand ]]call _lbAdd;

	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	 [1, localize "STRS_statdialog_playerlist"]call _lbAdd;
	private "_i"; /// ADDED TO FIX BUG

	/*for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do
	{
		_spieler = playerarray select _i;
		if (!isnull _spieler and isPlayer _spieler) then {lbAdd [1, (format ["%1: %2", _spieler, name _spieler])];};
	};*/
	//Better method?

	{
		private ["_x","_esu","_cop","_civ"];
		_index = nil;
		if (_x in [Civ51,Civ52,Civ53,Civ54,Civ55]) then {_esu = "(ESU)";} else {_esu = ""};
		if (_x in coparray) then {_cop = "(COP)";}else{_cop = ""};
		if (_x in (civarray-[Civ51,Civ52,Civ53,Civ54,Civ55])) then {_civ = "(CIV)";}else{_civ = ""};
		if (!isNull _x && isPlayer _x) then {_index =  [1, (format ["%1: %2 %3%4%5", _x, name _x,_esu,_cop,_civ])]call _lbAdd;};
		if (_x in coparray) then {lbSetColor [1,_index,[0,0,0.7,1]];};
		if (_x in esuslots) then {lbSetColor [1,_index,[1,1,0,1]];};
		_playerWanted = call compile format ["%1_wanted",_x];
		if ((_playerWanted == 1) && (_x in (civarray-[Civ51,Civ52,Civ53,Civ54,Civ55]))) then {lbSetColor [1,_index,[1,0,0,1]];};
	} forEach playerarray;


	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	[1, "W A N T E D:"] call _lbAdd;
	_ind = lbAdd [1, _sub_trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	for [{_i=0}, {_i < (count civarray)}, {_i=_i+1}] do
	{

	_civ	  = civarray select _i;

	if(!isnull _civ and isPlayer _civ)then

		{

		_wanted = call compile format ["%1_wanted", _civ];
		_reason = call compile format ["%1_reason", _civ];
		_bounty = call compile format ["kopfMishy_%1", _civ];

		if(_wanted == 1) then

			{

			 [1, (format ["%1 (Bounty: %3): %2 is wanted for:", _civ, name _civ, _bounty])]call _lbAdd;
			_str = "";
			//{if(_str == "")then{_str = _str + _x}else{_str = _str + ", "; _str = _str + _x;};} foreach _reason;
			//lbAdd [1, (format ["%1.", _str])];
			{
				 [1,format ["%1",_x]]call _lbAdd;
			}forEach _reason;
			_ind = lbAdd [1, _sub_trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
			};

		};

	};
	if (!isnil "CheatInfo") then {
	 [1, "Hacker Logs:"]call _lbAdd;
	 [1, (format ["%1", CheatInfo])]call _lbAdd;
	_ind = lbAdd [1, _trennlinie/*newv1*/]; lbSetColor [1,_ind,[1, 0.50196078431372549019607843137255, 0, 0.5]];
	};
	lbAdd [1,""];
};

if (_art == "inventorycheck") then
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_licensearray  = (_array select 1);
	_inventararray = (_array select 2);
	_civobj        = (_array select 3);
	_waffenarray   = weapons _civobj - nonlethalweapons;
	_magazinarray  = magazines _civobj;
	_trennlinie = "---------------------------------------------";
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	private "_i"; //// ADD to fix bug
	for [{_i=0}, {_i < (count _licensearray)}, {_i=_i+1}] do
	{
		_lizenz = (_licensearray select _i);
		lbAdd [1, format ["%1", (_lizenz call INV_GetLicenseName)]];
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_inventarlist"];
	for [{_i=0}, {_i < (count _inventararray)}, {_i=_i+1}] do
	{
		_objekt     = ((_inventararray select _i) select 0);
		_objektname = (_objekt call INV_getitemName);
		_anzahl     = ((_inventararray select _i) select 1);
		if (_anzahl > 0) then
		{
			lbAdd [1, format ["%1: %2", _objektname, _anzahl]];
		};
	};

	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_waffen"];
	for [{_i=0}, {_i < (count _waffenarray)}, {_i=_i+1}] do
	{
		_objekt     = _waffenarray select _i;
		_scriptname = _objekt call INV_GetScriptFromClass_Weap;
		_objektname = (_scriptname call INV_getitemName);
		lbAdd [1, format ["%1", _objektname]];
	};
	lbAdd [1, _trennlinie];
	_index = lbAdd [1, localize "STRS_statdialog_magazine"];
	for [{_i=0}, {_i < (count _magazinarray)}, {_i=_i+1}] do
	{
		_objekt     = _magazinarray select _i;
		_scriptname = _objekt call INV_GetScriptFromClass_Mag;
		_objektname = (_scriptname call INV_getitemName);
		lbAdd [1, format ["%1", _objektname]];
	};
	lbAdd [1, _trennlinie];
};

if (_art == "licensecheck") then
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_licensearray  = (_array select 1);

	_trennlinie = "---------------------------------------------";
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	private "_i"; //// ADD to fix bug
	for [{_i=0}, {_i < (count _licensearray)}, {_i=_i+1}] do
	{
		_lizenz = (_licensearray select _i);
		lbAdd [1, format ["%1", (_lizenz call INV_GetLicenseName)]];
	};
	lbAdd [1, _trennlinie];

};

if (_art == "inventorysteal") then

{

};

if (_art == "gesetz") then
{
	if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
	{
		_index = lbAdd [1, _x];
		lbSetData [1, _index, _x];
	}
	forEach GesetzArray;
	while {ctrlVisible 1020} do
	{
		_selected = lbCurSel 1;
		ctrlSetText [2, lbText [1, _selected]];
		waitUntil {((not(_selected == lbCurSel 1)) or (not(ctrlVisible 1020)))};
	};
};

if (_art == "coplog") then
{
	createDialog "Jon_ThemedList";
	ctrlSetText [1000,"Wanted List"];
	_trennlinie = "---------------------------------------------";

	private "_k"; /// ADDED TO FIX BUG
	lbAdd [1500, _trennlinie];
	for [{_k=0}, {_k < (count civarray)}, {_k=_k+1}] do
	{

	_civ	  = civarray select _k;

	if(!isnull _civ and isPlayer _civ)then

		{

		_wanted = call compile format ["%1_wanted", _civ];
		_reason = call compile format ["%1_reason", _civ];
		_bounty = call compile format ["kopfMishy_%1", _civ];

		if(_wanted == 1) then

			{

			lbAdd [1500, (format ["%1 (Bounty: %3): %2 is wanted for:", _civ, name _civ, _bounty])];
			_str = "";
			//{if(_str == "")then{_str = _str + _x}else{_str = _str + ", "; _str = _str + _x;};} foreach _reason;
			//lbAdd [1, (format ["%1.", _str])];
			{
				lbAdd [1500,format ["%1",_x]];
			}forEach _reason;
			lbAdd [1500, _trennlinie];
			};

		};

	};


};

if (_art == "wahlen") then
{
	if (!(createDialog "wahldialog")) exitWith {hint "Dialog Error!";};
	_array = [0, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, _array select 1];
};

if (_art == "chief") then
{
	if (!(createDialog "chiefdialog")) exitWith {hint "Dialog Error!";};
	_arrayc = [0, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, _arrayc select 1];
};

if (_art == "steuern") then
{
	if (!(createDialog "steuerdialog")) exitWith {hint "Dialog Error!";};
	sliderSetSpeed [12, 1, 5];
	sliderSetRange [12, 0, 30];
	sliderSetPosition [12,((INV_ItemTypenArray select 0) select 2)];
	sliderSetSpeed [22, 1, 5];		sliderSetRange [22, 1, 30];
	sliderSetPosition [22,((INV_ItemTypenArray select 1) select 2)];
	sliderSetSpeed [32, 1, 5];				sliderSetRange [32, 1, 30];
	sliderSetPosition [32,((INV_ItemTypenArray select 2) select 2)];
	sliderSetSpeed [42, 1, 5];
	sliderSetRange [42, 0, 30];
	sliderSetPosition [42,((INV_ItemTypenArray select 3) select 2)];
	sliderSetSpeed [52, 1, 5];
	sliderSetRange [52, 0, 30];
	sliderSetPosition [52,bank_steuer];
	while {ctrlVisible 1032} do
	{

		ctrlSetText [11, format["Item Tax: %1%2",((round(sliderPosition 12)) call ISSE_str_IntToStr),"%"]];
		ctrlSetText [21, format["Vehicle Tax: %1%2",((round(sliderPosition 22)) call ISSE_str_IntToStr),"%"]];
		ctrlSetText [31, format["Magazine Tax: %1%2",((round(sliderPosition 32)) call ISSE_str_IntToStr),"%"]];
		ctrlSetText [41, format["Weapon Tax: %1%2",((round(sliderPosition 42)) call ISSE_str_IntToStr),"%"]];
		ctrlSetText [51, format["Bank Transfer Tax: %1%2",((round(sliderPosition 52)) call ISSE_str_IntToStr),"%"]];
		sleep 0.05;
	};
};

if (_art == "copmenu") then
{
_type = typeof vehicle player;
_type1 = ["police_bell206","MH6J_EP1","OH58g","UH1H_TK_GUE_EP1","MH60S","HH65C","ibr_as350_civ","tcg_taurus_pb_2","tcg_taurus_uc","tcg_taurus","tcg_taurus_wopb","tcg_taurus_shpb","tcg_taurus_sh","il_charger_pd","ilpd_charger_black","ilpd_charger_white","jailbus","il_bearcat","patrol","patrol_pb","patrol_np","patrol_slick","sheriff","whiteuc","blackuc","whited","greyd","whited","blackd","tcg_suburban_uc_black","tcg_suburban_uc_grey","tcg_suburban_uc_white","ilpd_beat_f101","ilpd_beat_f101_sh","ilpd_scu_black","ilpd_scu_white","ilpd_unmarked_scu","ilpd_unmarked_sandstone","ilpd_unmarked_maroon","ilpd_unmarked_darkblue","ilpd_unmarked_black","ilpd_unmarked_grey","ilpd_unmarked_white","ilpd_slick_b40_npb","ilpd_slick_f220_npb","ilpd_slick_b40_PBG","ilpd_slick_f220_PBG","ilpd_Traffic_black","ilpd_Traffic_white","tcg_suburban_patrol","tcg_suburban_sheriff","suburban_pd_k9","suburban_pd","suburban_pd_sheriff","suburban_pd_stealth","suburban_pd_black","ilpd_scu_darkblue","ilpd_scu_grey","ilpd_scu_maroon","ilpd_scu_sandstone","ilpd_Traffic_sandstone","ilpd_Traffic_maroon","ilpd_Traffic_grey","ilpd_Traffic_darkblue","il_fordcv_taxi","tahoe_pd","tahoe_sh","tahoe_uc_black","tahoe_uc_grey","tahoe_uc_1_grey","tahoe_uc_1_blue","tahoe_uc_1_green","ilpd_slick_b40_pb","ilpd_traffic_t101","pd_cvpi_hub","pd_cvpi","tahoe_uc_maroon","tahoe_uc_white","tahoe_uc_1_maroon","tahoe_uc_1_white","tahoe_uc_1_black","ilf350swat","il_f350sheriff"];
	if (player == vehicle player) then
	{player groupchat "You need to be in a police car or at the precinct";}
	else
	{
		if (_type in _type1) then
		{
			if (!(createDialog "CopMenu")) exitWith {hint "Dialog Error!";};
		}
		else {player groupchat "Your car is not equipped with a police computer";};
	};
};

if (_art == "copmenulite") then
{

	if (player distance copdispatch <= 3) then
	{
		if (!(createDialog "CopMenuLite")) exitWith {hint "Dialog Error!";};
	}
	else {player groupchat "You must be in a cop car or at dispatch";};

};

if (_art == "distribute") then

{

if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
private "_j";   /// BUG FIX
for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do

	{

	if (!(isNull(INV_VehicleArray select _j))) then

		{

		_vehicle = (INV_VehicleArray select _j);
		_index = lbAdd [1, format["%1 (%2)", _vehicle, typeof _vehicle] ];
		lbSetData [1, _index, format["%1", _vehicle] ];

		};

	};

buttonSetAction [2, "[lbData [1, (lbCurSel 1)]] execVM ""choosecity.sqf"";"];

};

if (_art == "impound") then {
	if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
	private "_j"; /// BUG FIX
	ctrlSetText [3, format["Retrieve impounded vehicle ($%1)", impoundpay]];
	_Car = false;
	_Air = false;
	_Boat = false;
	{
		if ((player distance _x) < 15) then {
			_Car = true;
		};
	} count [copcar,copcar1,copswat,copfbicars,impoundbuy];
	if (!_Car) then {
		{
			if ((player distance _x) < 15) then {
				_Air = true;
			};
		} count [airatm, copair];
		if (!_Air) then {
			{
				if ((player distance _x) < 15) then {
					_Boat = true;
				};
			} count [civ_boat];
		};
	};
	{
		if (((_x distance impoundarea1) < 70) && (_x call Own_This_Vehicle)) then {
			switch (true) do {
				case (_Car): {
					if (((typeOf _x) isKindOf "Car") || (typeOf _x) isKindOf "Motorcycle") then {
						_index = lbAdd [1,format["%1 (%2)", _x, typeof _x]];
						lbSetData [1,_index, format["%1", _x]];
					};
				};

				case (_Air): {
					if ((typeOf _x) isKindOf "Air") then {
						_index = lbAdd [1,format["%1 (%2)", _x, typeof _x]];
						lbSetData [1,_index, format["%1", _x]];
					};
				};

				case (_Boat): {
					if ((typeOf _x) isKindOf "Ship") then {
						_index = lbAdd [1,format["%1 (%2)", _x, typeof _x]];
						lbSetData [1,_index, format["%1", _x]];
					};
				};
			};
		};
	} count vehicles;
	buttonSetAction [2, "[lbData [1, (lbCurSel 1)],""buy""] execVM ""impound.sqf"";"];
};

if (_art == "gangmenu") then

{

if (!(createDialog "gang_menu")) exitWith {hint "Dialog Error!";};
private "_i";
for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do

	{

	_gangarray = gangsarray select _i;
	_index = lbAdd [202, format ["%1 - Memberlist: %2", (_gangarray select 0), (_gangarray select 1)]];
	lbSetData [202, _index, format ["%1", (_gangarray select 0)]];

	};

};

if (_art == "gildenverwaltung") then

{

if(!gangleader)exitwith{player groupchat "you are not the gang leader!"};

closedialog 0;

if (!(createDialog "gilde_verwaltung")) exitWith {hint "Dialog Error!";};

_members = [];
private "_i";
for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do {if ((name player) in ((gangsarray select _i) select 1)) exitWith {_members = ((gangsarray select _i) select 1)};};

_index = lbAdd [201, localize "STRS_hints_ja"];
lbSetData [201, _index, "true"];
_index = lbAdd [201, localize "STRS_hints_nein"];
lbSetData [201, _index, "false"];

for [{_i=0}, {_i < (count _members)}, {_i=_i+1}] do

	{

	_member = (_members select _i);
	_obj 	= [_member, civarray] call INV_findunit;

	if(isnull _obj)then{_obj = "notingame"};

	_index = lbAdd [102, (format ["%1 (%2)", _member, _obj])];
	lbSetData [102, _index, (format ["%1", _obj])];

	};

};

if (_art == "penalcode") then
{
	createDialog "Jon_ThemedList";
	ctrlSetText [1000,"ILPD Penal Code"];
	_trennlinie = "---------------------------------------------";
	lbAdd [1500, "CRIME DESCRIPTION -- MIN TIME || MAX TIME"];
	lbAdd [1500, " "];
	lbAdd [1500, "Minor Offences -- 1 Minute || 2 Minutes"];
	lbAdd [1500, "Attempted Murder -- 2 Minutes || 4 Minutes"];
	lbAdd [1500, "Murder (including Vehicular Manslaughter) -- 4 Minutes || 6 Minutes"];
	lbAdd [1500, "Criminal Threats -- 1 Minute || 2 Minutes"];
	lbAdd [1500, "Hostage Taking/Kidnapping --	3 Minutes || 5 Minutes"];
	lbAdd [1500, "Robbery/Theft (excluding Bank/Convoy) -- 3 Minutes || 4 Minutes"];
	lbAdd [1500, "Bank Robbery --	4 Minutes || 5 Minutes"];
	lbAdd [1500, "Convoy Robbery -- 4 Minutes || 5 Minutes"];
	lbAdd [1500, "Attempted/Successful Grand Theft Auto -- 3 Minutes || 4 Minutes"];
	lbAdd [1500, "Bribery -- 1 Minute || 2 Minutes"];
	lbAdd [1500, "Jailbreak (including assisting) -- Original time + 5"];
	lbAdd [1500, "Escape from Police Custody --	2 Minutes || 3 Minutes"];
	lbAdd [1500, "Illegal Item Trafficking/Selling -- 3 Minutes || 5 Minutes"];
	lbAdd [1500, "Evasion -- 2 Minutes || 3 Minutes"];
	lbAdd [1500, "Having an Illegal/Unlicensed Firearm -- 2 Minutes || 3 Minutes"];
	lbAdd [1500, "Terrorism -- 10 Minutes || 12 Minutes"];
	lbAdd [1500, "Discharging a Firearm in Public -- 2 Minutes || 3 Minutes"];
	lbAdd [1500, "Assassin -- 5 Minutes || 8 Minutes"];
	lbAdd [1500, " "];
	lbAdd [1500, _trennlinie];
	lbAdd [1500, _trennlinie];
	lbAdd [1500, " "];
	lbAdd [1500, "TICKET DESCRIPTION -- MAX FINE || MIN FINE"];
	lbAdd [1500, " "];
	lbAdd [1500, "Reckless Operation of a Motor Vehicle -- $2,500 || $5,000"];
	lbAdd [1500, "Speeding (depending on how fast) -- $2,500 || $15,000"];
	lbAdd [1500, "Obstructing Traffic Flow -- $1,500 || $2,500"];
	lbAdd [1500, "Failure to Yield to an Emergency Vehicle --	$5,000 || $7,500"];
	lbAdd [1500, "Driving Without Valid License -- $3,500 || $5,000"];
	lbAdd [1500, "Reckless Operation of an Aerial Vehicle -- $7,500 || $10,000"];
	lbAdd [1500, "Flying an Aerial Vehicle w/o a Valid License -- $5,000 || $7,500"];
	lbAdd [1500, "Illegal Parking -- $1,500 || $2,500"];
	lbAdd [1500, "Use of Illegal Speed Upgrade (Speed 4-5) - $5,000 || $7,500"];
	lbAdd [1500, "Misuse of an Emergency Hotline -- 	$3,500 || $5,000"];
	lbAdd [1500, "Unholstered Licensed Weapon In City Limits -- $3,000 || $5,500"];
	lbAdd [1500, "Obstruction of a Peace Officer -- $3,500 || $5,000"];
	lbAdd [1500, "Landing an Aerial Vehicle Within City Limits -- $5,000 || $8,500"];
};
