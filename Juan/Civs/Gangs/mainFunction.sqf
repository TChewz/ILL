//Gang Setup
//Jonny

if (!(createDialog "ILG_Gang_Menu")) exitWith {hint format["Dialog Error!\n\nRelog to fix!"]};

if (isCop || (player in esuslots)) then
{
	[] spawn
	{
		while {ctrlVisible 12} do
		{
			ctrlEnable [30,False];
			ctrlEnable [10,False];
			ctrlEnable [11,False];
			ctrlEnable [7, False];
			sleep (0.1);
		};
	};
};

myGangArray = [];

buttonSetAction [7,"[(gangsarray select (lbCurSel 3)) select 0,2] execVM 'Juan\Civs\Gangs\war_Declare.sqf';"];
buttonSetAction [10,"[(lbCurSel 3)] execVM 'Juan\Civs\Gangs\Gang_Leave.sqf';"];
buttonSetAction [11,"[0] execVM 'Juan\Civs\Gangs\Gang_Create.sqf';"];
ctrlEnable[30,False];

_allGangs = [];
{
	_allGangs = _allGangs + [_x select 0];
}forEach gangsarray;

_myGang = call INV_mygang;
if (_myGang == "") then {ctrlSetText [10, "Join Gang"];ctrlEnable[7,False];}else{ctrlSetText [10, "Leave Gang"]; ctrlEnable[11,False];};
ctrlSetText [8, format["%1",_myGang]];
if (isCop || (player in esuslots)) then {ctrlSetText [8, "Invalid."]};

{
	if ((_x select 0) == _myGang) then
	{
		myGangArray = _x;
	};
}forEach gangsarray;
if (((myGangArray select 1) select 0) != (name player)) then {ctrlEnable[7,False];};
if (((myGangArray select 1) select 0) == (name player)) then {ctrlSetText[11,"Kick"]; ctrlEnable[30,True];ctrlEnable[11,true]; buttonSetAction [30,"[] execVM 'Juan\Civs\Gangs\Gang_Lock.sqf';"];
if (!(myGangArray select 2)) then {ctrlSetText [30, "Unlock Gang"]};
buttonSetAction [11,"[1,(myGangArray select 1) select(lbCurSel 9)] execVM 'Juan\Civs\Gangs\Gang_Create.sqf';"];};
{
	lbAdd [9,format["%1",_x]];
}forEach (myGangArray select 1);	

{
	_r = if (_x select 2) then {"(R)"}else{""};
	_index = lbAdd [3,format ["%1%2",_x select 0,_r]];
}forEach gangsarray;

[] spawn
{
	_selectedGang = lbCurSel 3;
	while {ctrlVisible 12} do
	{
		_oldSel = _selectedGang;
		_gang = gangsarray select (lbCurSel 3);
		if (!(_oldSel == (lbCurSel 3))) then
		{
			//Members
			lbClear 2;
			{
				lbAdd [2,format["%1",_x]];
			}forEach (_gang select 1);
			
			//Areas
			lbClear 20;
			_control1 = gangarea1 getvariable "control";
			_control2 = gangarea2 getvariable "control";
			_control3 = gangarea3 getvariable "control";
			_control4 = gangarea4 getvariable "control";
			_control5 = gangarea5 getvariable "control";
			if (_control1 == (_gang select 0)) then {lbAdd [20,"Emita Castle"]};
			if (_control2 == (_gang select 0)) then {lbAdd [20,"South District"]};
			if (_control3 == (_gang select 0)) then {lbAdd [20,"Roseyard"]};
			if (_control4 == (_gang select 0)) then {lbAdd [20,"Abandoned Prison"]};
			if (_control5 == (_gang select 0)) then {lbAdd [20,"Little Havana"]};
			
			//Enemies
			lbClear 23;
			{
				lbAdd [23,format["%1",_x]];
			}forEach (_gang select 3);
		};
		
		//Button setting
		if (!((_gang select 0) in (myGangArray select 3))) then
		{
			ctrlSetText [7, "Declare War!"];
			buttonSetAction [7,"[(gangsarray select (lbCurSel 3)) select 0,2] execVM 'Juan\Civs\Gangs\war_Declare.sqf';"];
		}
		else
		{
			ctrlSetText [7, "Offer Peace!"];
			buttonSetAction [7,"[(gangsarray select (lbCurSel 3)) select 0,1] execVM 'Juan\Civs\Gangs\war_Declare.sqf';"];
		};
		sleep 0.1;
		
	};
};
