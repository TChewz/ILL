_targetPlayer = ((nearestObjects [player, ["Man"], 5]) select 1);
_targetVehicle = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);
if (animationState _targetPlayer != "CivilSitting01") exitWith {player groupchat "He's not ziptied";};
if !(_targetVehicle in INV_ServerVclArray) exitWith {player groupchat "This aint yo car, fool."};
if (isNull _targetPlayer) exitWith {player groupchat "player not found";};
if (isNull _targetVehicle) exitWith {player groupchat "Vehicle not found";};

[_targetPlayer,[_targetVehicle,_targetPlayer],"ClientArrest.sqf"] execVM "CB.sqf";