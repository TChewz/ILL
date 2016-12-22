private["_class", "_cfg"];
_class = _this select 0;

_cfg = (configFile >> "CfgMagazines" >> _class);

if(!(isNumber(_cfg >> "count")))exitWith{0};
	
(getNumber(_cfg >> "count"))
