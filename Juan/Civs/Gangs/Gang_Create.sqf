_type = _this select 0;



if (_type == 0) then//Create
{
	closeDialog 9082;	
	if (!(createDialog "gilde_gruenden")) exitWith {hint "dlg error"};
}
else//Kick
{
	_civ = _this select 1;
	if (isNil "_civ") exitWith {player groupchat "you didnt select anyone!"};
	//	if(player == _civ)exitwith{player groupchat "you can't kick yourself, silly!"};
	for "_c" from 0 to (count gangsarray - 1) do 
	{
		_gangarray = gangsarray select _c;
		_gang	   = _gangarray select 0;
		_members   = _gangarray select 1;
		_name	   = name player;	
		if(_name in _members)then
		{
			_members = _members - [(_civ)];
			_gangarray set[1, _members];
			player groupchat format["you kicked %1 from your gang!", _civ];
			format['if(NAME player == %3)then{player groupchat "You have been kicked out of your gang!"; gangmember = false;}; gangsarray set[%1, %2]', _c, _gangarray, _civ] call broadcast;
		};
		closeDialog 9082;
	};	
};