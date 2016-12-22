private ["_gate"];

_gate = _this select 0;
_gate setPos [(getPos _gate select 0),(getPos _gate select 1),-5];
sleep 20;
_gate setPos [(getPos _gate select 0),(getPos _gate select 1),0];