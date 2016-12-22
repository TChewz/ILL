if (!(createDialog "ILG_MONEYCHECK")) exitWith {hint "Dialog Error!";};
lbAdd [1, "IslandLifeGaming Player Stat Checker"];
lbAdd [1,"N A M E     B A N K     C A S H     I N V     L I C E N S E"];
lbAdd [1," - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"];
lbAdd [1, ""];
lbAdd [1,"GATHERING INFO"];
lbAdd [1,format ["PLEASE WAIT %1",name player]];
format ['[] call Juan_SetStatVars;'] call broadcast;
sleep 2.5;
lbClear 1;
lbAdd [1, "IslandLifeGaming Player Stat Checker"];
lbAdd [1,"N A M E     B A N K     C A S H     I N V     L I C E N S E"];
lbAdd [1," - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"];
lbAdd [1, ""];
{
	_Array = [];
	_Array2 = [];
	if (_x call ISSE_UnitExists) then
	{
		lbAdd [1,format ["%4 %1 -- $%2 -- $%3",name _x,((_x getVariable "PlayerStats") select 0) call ISSE_str_IntToStr,((_x getVariable "PlayerStats") select 1) call ISSE_str_IntToStr,_x]];
		{
			if ((_x select 1) != 0) then
			{
				if ((count _Array) < 7) then
				{
					_Array = _Array + [(_x select 0) call INV_getitemName];
				}
				else
				{
					_Array2 = _Array2 + [(_x select 0) call INV_getitemName];
				};
			};
		}Foreach ((_x getVariable "PlayerStats") select 2);
		_Array = _Array - ["Money"];
		if ((count _Array) != 0) then {lbAdd [1,format ["%1",_Array]];};
		if ((count _Array2) != 0) then {lbAdd [1,format ["%1",_Array2]];};
		lbAdd [1, ""];
	};
}forEach playerarray;
lbAdd [1,""];lbAdd [1,""];