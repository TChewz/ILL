private["_class", "_cfg"];
_class = _this select 0;

_cfg = (configFile >> "cfgVehicles" >> _class);

if(!(isNumber(_cfg >> "maxSpeed")))exitWith{0};
	
(getNumber(_cfg >> "maxSpeed"))
