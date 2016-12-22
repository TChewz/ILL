private ["_buildings"];
_buildings = [3021,3101,3093,3092,3091,3090,3089,3088,3087,3085,3084,3083,3082,3081,3080,3079];
{
	(getPos(BuildLogic) nearestobject _x) attachTo [BuildSUV, [0,0,0]];
}count _buildings;

diag_log format ["BUILDING IS: %1", typeOf (getPos(BuildLogic) nearestobject 16118)];