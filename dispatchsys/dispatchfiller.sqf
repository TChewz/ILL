#define coplist 6294

{
	if (_x call ISSE_UnitExists) then
	{
		lbAdd [coplist, format ["%1 - %2",_x, name _x]];
	}
	else
	{
		lbAdd [coplist, "UNIT OFFLINE"];
	};
}forEach coparray;
 
