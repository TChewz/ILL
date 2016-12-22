if(pickingup)exitwith{};

pickingup=true;

_this 		= _this select 3;
_gangarea 	= _this select 0;
_type		= _this select 1;


if ((player distance gangbox1) < 100) then {gatext123 = "Emita Castle";};
if ((player distance gangbox2) < 100) then {gatext123 = "South District";};
if ((player distance gangbox3) < 100) then {gatext123 = "Roseyard";};
if ((player distance gangbox4) < 100) then {gatext123 = "Abandoned Prison";};
if ((player distance gangbox5) < 100) then {gatext123 = "Little Havana";};



player playmove "AinvPknlMstpSlayWrflDnon_medic";

if(!debug)then{
sleep 5;
waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
};

if(_type == "neutralise")then

{
	_random = random (100);
	if (_random > 90) then
	{
		format["hint ""Intruder alert at %1"";", gatext123] call broadcast_civ;
	};

_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, (getpos _gangarea select 2) - 1];

if(getpos _gangarea select 2 <= -7)then

	{

	_mygang  = call INV_mygang;
	_control = _gangarea getvariable "control";

	if(_mygang != "" and !isnil "_control")then

		{

		_gangarea setvariable["control", nil, true];
		format["hint ""%1 has been neutralised by %2!"";", gatext123, _mygang] call broadcast_civ;

		};

	};

};

if(_type == "capture")then

{
	_random = random (100);
	if (_random > 90) then
	{
		format["hint ""Intruder alert at %1"";", gatext123] call broadcast_civ;
	};

_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, (getpos _gangarea select 2) + 1];

if(getpos _gangarea select 2 >= 0)then

	{

	_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, 0];

	_mygang  = call INV_mygang;
	_control = _gangarea getvariable "control";

	if(_mygang != "" and isnil "_control")then

		{

		_gangarea setvariable["control", _mygang, true];
		format["hint ""%1 has been captured by %2!"";", gatext123, _mygang] call broadcast_civ;

		};

	};

};

pickingup=false;