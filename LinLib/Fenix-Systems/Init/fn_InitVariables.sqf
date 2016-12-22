/*
	Notice: You may edit this file as you wish, I ask only that you leave the original credits.
	
	Author: Linnet (Infection)

	Description:
	Sets all your statistics to match database ones.

	Parameter(s):
	
	Returns:
	0
*/
#include "SQL_Defines.h"

DB_Packet = SEL(DB_Packet,0);

bnkgeld 			= SEL(DB_Packet,0); 
INV_InventarArray 	= SEL(DB_Packet,1);
INV_LizenzOwner		= SEL(DB_Packet,2); 
streetrep 			= SEL(DB_Packet,3);
INV_SavedVeh 		= SEL(DB_Packet,4);
INV_Fabrikowner		= SEL(DB_Packet,5);
//INV_VehicleArray	= SEL(DB_Packet,9);

if((count (SEL(DB_Packet,9))) > 0)then{
	private["_veh"];
	_veh = objNull;
	{
		_veh = missionNameSpace getVariable [_x, objNull];
		if (!(isNull _veh)) then 
		{
			INV_VehicleArray set [(count INV_VehicleArray), _veh];
		};
	}count (SEL(DB_Packet,9));
};

if(LinLib_LoadSkin)then{
	[SEL(DB_Packet,6)] call clothes;
};
if ("car" in INV_LizenzOwner) then {demerits = 15};
if(LinLib_LoadWeapons)then{

	{
		player addWeapon _x; //Todo -- Saving holstered weapons and magazines.
	}count SEL(DB_Packet,7);

	{
		player addMagazine _x;
	}count SEL(DB_Packet,8);
};
[] call selectWeapon_Juan;
LinLib_ClientLoaded = true;