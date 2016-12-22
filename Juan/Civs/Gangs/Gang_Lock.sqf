for "_c" from 0 to (count gangsarray - 1) do 
{
	_gangarray = gangsarray select _c;
	_gang	   = _gangarray select 0;
	_members   = _gangarray select 1;
	_lock = _gangarray select 2;
	_name	   = name player;
	if(_name in _members)then
	{
		if (_lock) then {_lock = false}else{_lock = true};
		_gangarray set[2, _lock];
		format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;
		if(_lock)then{player groupchat "civilians can now join your gang"}else{player groupchat "civilians can no longer join your gang"};
		closeDialog 0;
	};
};