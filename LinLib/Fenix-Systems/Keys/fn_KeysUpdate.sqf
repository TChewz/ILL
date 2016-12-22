/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Updates the keys array. (Fix for any bug)

	Parameter(s):
	
	Returns:
	0
*/
private["_keys"];
_keys = [];
{
	if (!(isnull _x)) then 
	{
		_keys set [(count _keys), str(_x)];
	};
} count INV_VehicleArray;

[player, [["carkeys", _keys]]] call LinLib_fnc_ClientUpdate;