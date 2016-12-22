/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Opens the vehicle saving menu.

	Parameter(s):
	
	
	Returns:
	0
*/
private["_index"];

if (!(createDialog "veh_menu")) exitWith {hint "Dialog Error!";};
{
	if (!(isnull _x) && (_x isKindOf "LandVehicle") && (_x call Own_This_Vehicle))then{
		if(!(typeOf _x in INV_SavedVeh))then{
			_index = lbAdd [153433, typeOf _x];
			 lbSetData [153433, _index, Str(_x)];
		};
	};
}count vehicles;

{
	if (_x isKindOf "LandVehicle")then{
		_index = lbAdd [153450, format ["%1 (SAVED)", _x]];
		lbSetData [153450, _index, _x];
	};
}count INV_SavedVeh;