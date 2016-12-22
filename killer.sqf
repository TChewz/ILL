_killer 		= _this select 0;
_killedbyvehicle 	= _this select 1;
_license 		= _this select 2;
_self			= player;

if (player == _killer and !iscop and !suicided) exitWith {};

if (player == _killer and !iscop and suicided) exitWith 
{

player groupChat localize "STRS_handlerdeadpub_suicide"; 
SelfKilled = SelfKilled + 1;
extradeadtime = extradeadtime + suicidepenalty;
["extradeadtime", extradeadtime] spawn ClientSaveVar;


};


if (player == _killer and iscop) exitWith {};

_text = parseText format ["<t size='0.9'>Killers Name: %6 - %8<br/>Dead Players Name: %7 - %9<br/>Server Uptime: %1<br/>Killers Position: %2<br/>Dead Players Position: %3<br/>Distance: %4<br/>Killer Weapon: %5</t>",[] call serverUptime,[player] call Emita_GetGridRef,[_killer] call Emita_GetGridRef,round((getPos player) distance (getPos _killer)),lastWeaponShot,name player,name _killer,str(side player),str(side _killer)];
[format["%1 kill %2",name player,name _killer],_text] call addToLogs;

if (_killer in civarray) then 

{
if (isciv) then
{
	_varJon = false;
	if (_killer call INV_unitArmed) then
	{
		streetrep = streetrep + 0.25;
		player groupchat "You just gained 0.25 Street Reputation for killing an armed civilian! Tony will be happy.";
	};
	if (((call INV_mygang) != "") && ((_killer call INV_Unitmygang) != (call INV_mygang)) && ((_killer call INV_Unitmygang) != "")) then
	{
		streetrep = streetrep + 0.25;
		player groupchat "You just gain 0.25 street reputation for killing a rival gang member!";
		_varJon = true;
	};
	if (!(_killer call INV_unitArmed) && !_varJon) then
	{
		streetrep = streetrep - 0.5;
		player groupchat "You lost 0.5 street reputation for killing an unarmed civ! Tony isnt impressed.";
	};
	if (((typeOf _killer) == "Functionary1") && ((_killer call INV_Unitmygang) == "") && ("mafial" call INV_HasLicense)) then
	{
		streetrep = streetrep - 5;
		INV_LizenzOwner = INV_LizenzOwner - ["mafial"];
		player groupchat "You lost your mafia license for killing a fellow mafia member.";
		["Citizen4"] call Clothes;
	};
	[player, [["streetrep", streetrep]]] call LinLib_fnc_ClientUpdate;
	
};
CivsKilled = CivsKilled + 1;
_gesucht = 0; 
call compile format ["_gesucht = %1_wanted;", _killer];

if (iscop) then 

	{
	
	
	_civkopfMishy = call compile format ["kopfMishy_%1", _killer];
	
	_civkopfMishy = _civkopfMishy / 3;
	
	_civkopfMishy = ceil _civkopfMishy;

	if (_civkopfMishy != 0) then 

	{

	(format['if (player == %3)then{bnkgeld = bnkgeld + %2; player groupChat "You got 1/3 of the civs bounty totaling $%2"}', player, _civkopfMishy, _self]) call broadcast;

	};
	extradeadtime = extradeadtime;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	

//	if (_gesucht == 0) then {player groupChat format [localize "STRS_handlerdeadpub_civkilled", _killer, (killstrafe call ISSE_str_IntToStr)];};
	if (_gesucht == 0) then {};
	} 
	else 
	{	

	extradeadtime = extradeadtime;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	true call TurnWantedFunc;
	
		
	if(_killedbyvehicle)then

		{

		INV_LizenzOwner = INV_LizenzOwner - ["car","truck","bus_license","boat"];
		[player, [["license", INV_LizenzOwner]]] call LinLib_fnc_ClientUpdate; 
		player groupchat "you have lost your vehicle license for reckless driving!";
		demerits = 0;
		
		
		}else{

		player groupchat "You are now wanted, and lost your gun licenses!";
		INV_LizenzOwner = INV_LizenzOwner - ["Pistollicense","bomb","riflelicense"];
		[player, [["license", INV_LizenzOwner]]] call LinLib_fnc_ClientUpdate;
		

		};

	};

sleep 1;
if (_killedbyvehicle) then 
	{
	(format ["[""KilledCiv"", %1] spawn Isse_AddCrimeLogEntry; if(%1 in civarray)then{if(!(""Vehicular Manslaughter"" in %1_reason))then{%1_reason = %1_reason + [""Vehicular Manslaughter""]}; kopfMishy_%1 = kopfMishy_%1 + 30000};", player]) call broadcast;
	titleText[format["VDM is against the rules!\nVDM is against the rules!\nVDM is against the rules!\nVDM is against the rules!\nVDM is against the rules!\nVDM is against the rules!"],"PLAIN",5];
	} 
	else 
	{
	(format ["[""KilledCiv"", %1] spawn Isse_AddCrimeLogEntry; if(%1 in civarray)then{if(!(""Murder"" in %1_reason))then{%1_reason = %1_reason + [""Murder""]}; kopfMishy_%1 = kopfMishy_%1 + 30000};", player]) call broadcast;
	};


};



if (_killer in coparray) then 

{

CopsKilled = CopsKilled + 1;
if (isciv) then
{
	streetrep = streetrep + 0.5;
	player groupChat "You've gained +0.5 street reputation. Tony thanks you for your hard work, keep it up.";
	[player, [["streetrep", streetrep]]] call LinLib_fnc_ClientUpdate;
};
if (iscop) then 

	{

	extradeadtime = extradeadtime + killedplayerinc;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	player groupChat format [localize "STRS_handlerdeadpub_copkilledbycop", _killer];
	
	if ((_killer distance copbase1 <= 80) and (CopsKilled > 5)) then 

		{

		[] execVM "copprison.sqf";

		};

	} 
	else 
	{

	extradeadtime = extradeadtime + killedplayerinc;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	player groupChat format [localize "STRS_handlerdeadpub_copkilled", _killer];
	true call TurnWantedFunc;
	

	if(_killedbyvehicle)then

		{

		INV_LizenzOwner = INV_LizenzOwner - ["car","truck","bus_license","boat"];
		[player, [["license", INV_LizenzOwner]]] call LinLib_fnc_ClientUpdate;
		player groupchat "you have lost your vehicle licenses for reckless driving!";
		demerits = 0;
		
		
		}else{
		if (_killer call INV_unitArmed) then
		{
			player groupchat "You lost no weapon licenses as the target was armed.";
		}
		else
		{
		player groupchat "You are now wanted, and lost your gun licenses!";
		INV_LizenzOwner = INV_LizenzOwner - ["Pistollicense","bomb","riflelicense"];
		[player, [["license", INV_LizenzOwner]]] call LinLib_fnc_ClientUpdate;
		};
		

		};

	};

sleep 1;

if (_killedbyvehicle) then 
	{
	(format ["[""KilledCop"", %1, ""%2""] spawn Isse_AddCrimeLogEntry; if(%1 in civarray)then{if(!(""Vehicular Manslaughter"" in %1_reason))then{%1_reason = %1_reason + [""Vehicular Manslaughter""]}; kopfMishy_%1 = kopfMishy_%1 + 30000};", player,  _killer]) call broadcast;
	}
	else
	{
	(format ["[""KilledCop"", %1, ""%2""] spawn Isse_AddCrimeLogEntry; if(%1 in civarray)then{if(!(""Murder"" in %1_reason))then{%1_reason = %1_reason + [""Murder""]}; kopfMishy_%1 = kopfMishy_%1 + 30000};", player,  _killer]) call broadcast;	
	};


};

