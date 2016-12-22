_toDeclareOn = _this select 0;
_PoW = _this select 1;

if (_toDeclareOn == (call INV_myGang)) exitWith {player groupchat "Your own gang!"};

if (_PoW == 2) then
{
	for "_c" from 0 to (count gangsarray - 1) do 
	{
		_gangarray = gangsarray select _c;
		_gang	   = _gangarray select 0;
		_members   = _gangarray select 1;
		_name	   = name player;	
		if(_name in _members)then
		{
			if (_toDeclareOn in (_gangarray select 3)) exitWith {player groupchat "War is already declared!"};
			_wars = (_gangarray select 3) + [_toDeclareOn];
			_gangarray set[3, _wars];
			format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;
			player groupchat format ["You declared war on %1",_toDeclareOn];
			format ['server Globalchat "%1 declared war on %2";',(call INV_mygang),_toDeclareOn] call broadcast;
			closeDialog 9082;
		};
	};
}
else
{
	player groupchat format ["Offer Peace"];
	closeDialog 9082;
	
	for "_c" from 0 to (count gangsarray - 1) do 
	{
		_gangarray = gangsarray select _c;
		_gang	   = _gangarray select 0;
		_members   = _gangarray select 1;
		_name	   = name player;	
		if(_name in _members)then
		{
			_wars = (_gangarray select 3) - [_toDeclareOn];
			_gangarray set[3, _wars];
			format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;
			player groupchat format ["You offered peace to %1",_toDeclareOn];
			format ['server Globalchat "%1 offered peace to %2";',(call INV_mygang),_toDeclareOn] call broadcast;
			closeDialog 9082;
		};
	};
	
	
};