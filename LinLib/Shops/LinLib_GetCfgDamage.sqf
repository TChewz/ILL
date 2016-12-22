private["_class", "_cfg", "_ammo"];
_class = _this select 0;

_ammo = getText(configFile >> "cfgMagazines" >> _class >> "ammo");

_cfg = (configFile >> "cfgAmmo" >> _ammo);

if(!(isNumber(_cfg >> "hit")))exitWith{0};
	
(getNumber(_cfg >> "hit"))
