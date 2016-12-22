//Created by [ILG]SideburnSteve for IslandLifeLiberation.net .

_var = _this select 0;

if (_var == 1) then 
{
	if (still1on) exitWith {player sideChat "This still is already on."};
	still1on = true; publicVariable "still1on";
	
/*
	still1smoke = "HeliHEmpty" createVehicle (getPos still1smokeobj);
	still1smoke attachTo [still1smokeobj, [0, 0, -0.5] ];
	[still1smoke,4,time,false,false] spawn BIS_Effects_Burn;
*/

	_still1turnon = execVM "Steve\moonshine\still1on.sqf";
	player sideChat "You have started the still.";
};

if (_var == 2) then 
{
	if (!(still1on)) exitWith {player sideChat "This still is already off."};
	still1on = false; publicVariable "still1on";
	
	_still1turnoff = execVM "Steve\moonshine\still1off.sqf";		
	//deleteVehicle still1smoke;
	
	player sideChat "You have stopped the still.";
};

if (_var == 3) then 
{
	if (still2on) exitWith {player sideChat "This still is already on."};
	still2on = true; publicVariable "still2on";
	
	{
	still2smoke = "HeliHEmpty" createVehicle (getPos still2smokeobj);
	still2smoke attachTo [still2smokeobj, [0, 0, -0.5] ];
	[still2smoke,4,time,false,false] spawn BIS_Effects_Burn;
	} forEach allPlayers;
	
	player sideChat "You have started the still.";
};

if (_var == 4) then {
	if (!(still2on)) exitWith {player sideChat "This still is already off."};
	still2on = false; publicVariable "still2on";
	
	{
	deleteVehicle still2smoke;
	} forEach allPlayers;
	
	player sideChat "You have stopped the still.";
};

if (_var == 5) then 
{
	if (still3on) exitWith {player sideChat "This still is already on."};
	still3on = true; publicVariable "still3on";
	still3smoke = "HeliHEmpty" createVehicle (getPos still3smokeobj);
	still3smoke attachTo [still3smokeobj, [0, 0, -0.5] ];
	[still3smoke,4,time,false,false] spawn BIS_Effects_Burn;
	player sideChat "You have started the still.";
};

if (_var == 6) then 
{	
	if (!(still3on)) exitWith {player sideChat "This still is already off."};
	still3on = false; publicVariable "still3on";
	deleteVehicle still3smoke;
	player sideChat "You have stopped the still.";
};