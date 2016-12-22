_RestrainedBy = (civmenuciv getVariable ["RestrainedBy", -1]);
_Restrained = civmenuciv getVariable ["restrained", false];

if (_Restrained) then {
  if (!(_RestrainedBy == -1)) then {
    if (_RestrainedBy == 1) then {
      civmenuciv setVariable ["restrained", false, true];
	    civmenuciv setVariable ["RestrainedBy", -1, true];
      if (true) exitWith {};
    } else {
      systemChat format ["%1 is trying to uncuff you but they don't have the proper tools!", name (_this select 0)];
    };
  };
} else {
  if (!(civmenuciv call ISSE_IsVictim)) exitwith {player groupchat localize "STRS_inventory_checknohands"};
  _Amount = ("ziptie" call INV_GetItemAmount);
  if (_Amount == 0) exitWith {};
  civmenuciv setVariable ["restrained", false, true];
  civmenuciv setVariable ["RestrainedBy", -1, true];

  (format ["%1 switchMove """";",civmenuciv]) call broadcast;
  
  (format ['if (player == %1) then {[%2] spawn ziptie;};', civmenuciv, player]) call broadcast;
  ["ziptie", -1] call INV_AddInvItem;
};
