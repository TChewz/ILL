//player groupchat format["%1", _text];

_this = _this select 3;
_art  = _this select 0;

if(_art == "create") then

{

_text = _this select 1;
_name = name player;
_Mishy = 'Mishy' call INV_getitemamount;
_exitvar=false;
_disallowedName = ["cops","fuck","nigger"];

if(_text in _disallowedName)exitwith{player groupchat "you can't use that name"};

if((call INV_mygang) != "")exitwith{player groupchat "you are already in a gang!"};

for "_c" from 0 to (count gangsarray - 1) do {if (((gangsarray select _c) select 0) == _text) exitWith {_exitvar = true;};};

if(_exitvar)exitwith{player groupchat "a gang with the same name already exists!"};

if ((_text call ISSE_str_Length) > 15 or (_text call ISSE_str_Length) < 3) exitWith {player groupChat "the entered text is either too long or too short";};

if(_Mishy < gangcreatecost)exitwith{player groupchat "You don't have enough money to create this gang!"};

['Mishy', -gangcreatecost] call INV_addinventoryitem;

gangsarray = gangsarray + [[_text,[_name],true,[]]];
publicVariable "gangsarray";

player groupchat format["you have created a new gang called %1!", _text];

};

if(_art == "join") then

{

_gang = _this select 1;
_name = name player;
_id   = -1;

if((call INV_mygang) != "")exitwith{player groupchat "you are already in a gang!"};

for "_c" from 0 to (count gangsarray - 1) do {if (((gangsarray select _c) select 0) == _gang) exitWith {_id = _c;};};

if(_id == -1)exitwith{player groupchat "this gang no longer exists!"};

_gangarray = gangsarray select _id;
_members   = _gangarray select 1;
_canjoin   = _gangarray select 2;

_count = count (_members);

if (_count >= 15) exitwith {player groupchat "Only 15 people are allowed in a gang";};

if(!_canjoin)exitwith{player groupchat "You are not able to join this gang because the leader of this gang is not currently not recruiting"};

_members   = _members + [_name];
_gangarray set[1, _members];

format['gangsarray set[%1, %2]', _id, _gangarray] call broadcast;

player groupchat format["you have joined %1!", _gang];

};

if(_art == "leave") then

{

if(!gangmember)exitwith{player groupchat "you are not in a gang!"};

for "_c" from 0 to (count gangsarray - 1) do

	{

	_gangarray = gangsarray select _c;
	_gang	   = _gangarray select 0;
	_members   = _gangarray select 1;
	_name	   = name player;

	if(_name in _members)then

		{

		_members = _members - [_name];
		_gangarray set[1, _members];
		format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;
		player groupchat "you left your gang!";
		gangmember=false;

		};

	};

};

if(_art == "kick") then

{

//if((_this select 1) == "notingame")exitwith{player groupchat "you cannot kick members unless they are ingame!"};

_civ = call compile format["%1", _this select 1];

if(player == _civ)exitwith{player groupchat "you can't kick yourself, silly!"};

for "_c" from 0 to (count gangsarray - 1) do

	{

	_gangarray = gangsarray select _c;
	_gang	   = _gangarray select 0;
	_members   = _gangarray select 1;
	_name	   = name player;

	if(_name in _members)then

		{

		_members = _members - [(name _civ)];
		_gangarray set[1, _members];
		format['if(player == %3)then{player groupchat "You have been kicked out of your gang!"; gangmember = false;}; gangsarray set[%1, %2]', _c, _gangarray, _civ] call broadcast;

		};

	player groupchat format["you kicked %1 from your gang!", name _civ];

	};

};

if(_art == "allowjoin") then

{

if(_this select 1 == "")exitwith{player groupchat "you must select either yes or no!"};

_bool = call compile format["%1", _this select 1];

for "_c" from 0 to (count gangsarray - 1) do

	{

	_gangarray = gangsarray select _c;
	_gang	   = _gangarray select 0;
	_members   = _gangarray select 1;
	_name	   = name player;

	if(_name in _members)then

		{

		_gangarray set[2, _bool];
		format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;
		if(_bool)then{player groupchat "civilians can now join your gang"}else{player groupchat "civilians can no longer join your gang"};

		};

	};

};

if(_art == "clientloop") then {
	sleep 10;
	private ["_mygang", "_mymembers", "_enmembers"];
	startgroup = group player;
	for "_c" from 0 to (count gangsarray - 1) do {
		_gangarray = gangsarray select _c;
		_gang	   = _gangarray select 0;
		_members   = _gangarray select 1;
		_name	   = name player;
		if(_name in _members and iscop)then
			{
			_members = _members - [_name];
			_gangarray set[1, _members];
			format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;
		};
	};
	while {isciv} do {
		for "_c" from 0 to (count gangsarray - 1) do {
			_gangarray = gangsarray select _c;
			_gang	   = _gangarray select 0;
			_members   = _gangarray select 1;
			if(count _members > 0) then {
				_leader    = _members select 0;
				_lunit	   = [_leader, civarray] call INV_findunit;
				if(isnull _lunit and !(player in (units startgroup)))then{[player] joinsilent startgroup};
				if(isnull _lunit)exitwith{};
				_group	   = group _lunit;
				_name      = name player;
				if(leader _group != _lunit)then{_group selectleader _lunit};
				if(player == _lunit and !gangleader)then{gangleader = true; [player] joinsilent startgroup;};
				if(gangleader and player != _lunit and _name in _members)then{gangleader = false};
				if(_name in _members and !gangmember)then{gangmember = true};
				if(_name in _members and gangmember)then{_mygang = _gang; _mymembers = _members};
				if(_name in _members and player != _lunit and !(player in (units _group))) then {[player] joinsilent _group;};
			};
		};

		if(!gangmember and !(player in (units startgroup)))then{[player] joinsilent startgroup};

		for "_c" from 0 to (count gangareas - 1) do {

			_gangarea = gangareas select _c;
			_control  = _gangarea getvariable "control";
			if (!(isNil "_control") && !(isNil "_gangarea")) then {
				if(player distance _gangarea < 10 and (getpos _gangarea select 2) < 0 and _control == (call INV_mygang))then{_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, (getpos _gangarea select 2) + 0.1];};
			};
		};
		sleep 1;
	};
};

if(_art == "serverloop") then

{

_counter = 0;

while {true} do

	{

	for "_c" from 0 to (count gangsarray - 1) do

		{

		_gangarray = gangsarray select _c;
		_members   = _gangarray select 1;

		if(_counter >= gangdeltime and count _members == 0)exitwith{format['gangsarray set[%1, 0]; gangsarray = gangsarray - [0];', _c] call broadcast};

		_lname	   = _members select 0;

		if(isnull ([_lname, playerarray] call INV_findunit))then

			{

			_members = _members - [_lname];
			_gangarray set[1, _members];
			format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;

			};

		};

	if(_counter >= gangdeltime)then{_counter = 0};

	_counter = _counter + 60;

	sleep 60;

	};

};