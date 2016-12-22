private ["_buildings", "_cur_build"];
_buildings = [
	["Land_A_Stationhouse_ep1", Linnet_Mansion],
	["Land_brana02", Linnet_Mansion_1]
];
{
	_cur_build = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	_cur_build setDir getDir (_x select 1);
	_cur_build setPosATL getPos (_x select 1);
	_cur_build AllowDamage False;
}count _buildings;