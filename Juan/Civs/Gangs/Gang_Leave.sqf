if(!((call INV_myGang) == "")) then
{

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
			closeDialog 9082;
		};
	};
}
else
{
	_gang = _this select 0;
	_name = name player;
	_id   = _this select 0;
	if((call INV_mygang) != "")exitwith{player groupchat "you are already in a gang!"};
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
	player groupchat format["you have joined %1!", _gangarray select 0];
	closeDialog 9082;
	
};
