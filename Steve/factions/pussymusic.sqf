private ["_car"];
_car = vehicle player;

_car removeaction pussyAction;
clearvehicleinit _car;
_car setVehicleInit "this say 'pussycat'"; processInitCommands;
sleep 122;
pussyAction = _car addAction ["Play Music","Steve\factions\pussymusic.sqf",[],1,false,true,"","_this in _target"];
