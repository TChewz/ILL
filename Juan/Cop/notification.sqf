/*
	Police Notifications (Mostly hints w/ images)
*/
copNotify911 =
{
	private ["_civ","_text"];
	if (!iscop) exitWith {};
	_civ = _this select 0;
	_text = parseText format ["<t size='2.75' color='#0000CC'>911 Report<t color='#FFFFFF' size='1.25'><br /><img size='13' image='jonnycool\JonTex\ilg-BADGE.paa'/><br />%1 (%2) has just called 911.<br />Respond immediately!<br />Location:%3",_civ,name _civ,[_civ] call Emita_GetGridRef];   
	hint _text;
	playSound "beepsimple";
};

copNotify_Hostage =
{
	private ["_text","_civ"];
	if (!iscop) exitWith {};
	_civ = _this select 0;
	_text = parseText format ["<t size='2.75' color='#0000CC'>Hostage Alert<t color='#FFFFFF' size='1.25'><br /><img size='13' image='jonnycool\JonTex\ilg-BADGE.paa'/><br />%1 (%2) has just taken a hostage.<br />Respond and save the hostage.<br />If you're successful you will be rewarded.<br />Location: Hostage Area",_civ,name _civ]; 
	hint _text;
	playSound "beepsimple";
};

copNotify_bankRobbery =
{
	private ["_text","_civ"];
	if (!iscop) exitWith {};
	_civ = _this select 0;
	_text = parseText format ["<t size='2.75' color='#0000CC'>Bank Robbery<t color='#FFFFFF' size='1.25'><br /><img size='13' image='jonnycool\JonTex\ilg-BADGE.paa'/><br />%1 (%2) is robbing the bank.<br />Respond and eliminate the threat.<br />Location: Emita Bank",_civ,name _civ];   
	hint _text;
	playSound "beepsimple";
};

copNotify_bankTruck =
{
	private ["_text"];
	if (!iscop) exitWith {};
	_text = parseText format ["<t size='2.75' color='#0000CC'>Bank Truck<t color='#FFFFFF' size='1.25'><br /><img size='13' image='jonnycool\JonTex\ilg-BADGE.paa'/><br />The Government Convoy has arrived at Emita<br />Respond and protect the convoy.<br />Location: Bank Truck"];   
	hint _text;
	playSound "beepsimple";
};

copNotify_safeHouse =
{
	private ["_text"];
	if (!iscop) exitWith {};
	_text = parseText format ["<t size='2.75' color='#0000CC'>Safe House Alert<t color='#FFFFFF' size='1.25'><br /><img size='13' image='jonnycool\JonTex\ilg-BADGE.paa'/><br />Civilians have joined forces and are holding out at the safehouse.<br />If you're successful you will recieve a bonus.<br />Respond and Eliminate the threat.<br />Location: Safe House"];   
	hint _text;
	playSound "beepsimple";
};