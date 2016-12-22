still1smoke = "HeliHEmpty" createVehicle (getPos still1smokeobj);
still1smoke attachTo [still1smokeobj, [0, 0, -0.5] ];
[still1smoke,4,time,false,false] spawn BIS_Effects_Burn;