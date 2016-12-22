private["_class", "_cfg_class", "_cfg"];
_class = _this select 0;
_cfg_class = _this select 1;
_cfg = (configFile >> (_this select 1) >> _class);

if(!(isText(_cfg >> "picture")))exitWith{""};
	
(getText(_cfg >> "picture"))
