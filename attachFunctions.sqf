_type = typeOf (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);
_vehicle = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);
_jetSkis = ["tcg_wave_black","tcg_wave_sky","tcg_wave_red2","tcg_wave_red3","tcg_wave_red","tcg_wrun"];
_client = player;



if(_type in _jetSkis) then {

hint "JETSKI!";
player attachTo [_vehicle,[0,-1.5,1]];
player setDir 180;
getOff = player addaction ["Get off","noscript.sqf"];

action224 = player addaction ["Shoot off Back","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "attachFunctions.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Ship"], 3] select 0);player distance _vcl < 5 and _vcl in INV_ServerVclArray'];

};