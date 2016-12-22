_camp_fur = "Land_Fire_burning" createVehicle position player;
//_camp_fur setVehicleInit 'BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf"; nul = [this, 4, time, false, true] spawn BIS_Effects_Burn;';
//processInitCommands;
_Barrol_fun = "Land_Barrel_water" createVehicle position player;
_Barrol_fun attachTo [_camp_fur, [0, 0, .75] ]; 
_Barrol_fun setVariable ["IsStill", true, true];
_Barrol_fun setVariable ["applecount", 0, true];
["Still", -1] call INV_AddInvItem;
