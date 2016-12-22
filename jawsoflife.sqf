/*
_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);
_PlayerTeam = str(playerSide);
if (_PlayerTeam != "GUER") then {
player groupChat "You must be ESU to use this item";

}else{
if(player distance _vcl < 5 and count (crew _vcl) > 0 and (_vcl call Is_Player_Veh)) then {

(_vcl) execVM "pullout.sqf;
};};
*/

_PlayerTeam = str(playerSide);
if (_PlayerTeam != "GUER") exitWith {hint "You need to be ESU to use this item";};

_NearestVehicle = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);

if (((player distance _NearestVehicle) < 4) && ((count (crew _NearestVehicle) > 0))) then {
  (_NearestVehicle) execVM "pullout.sqf";
};
