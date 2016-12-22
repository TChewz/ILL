_NearestPlayers = nearestObjects [player, [], 5];

_P = objNull;

{
  if (isPlayer _x) then {
    if (_x getVariable ["restrained", false]) exitWith {
      _P = _x;
    };
  };
} count _NearestPlayers;

if !(isNull _P) then {
  (format ['if (player == %1) then {[%2] call Blindfold_User};', _P, player]) call broadcast;
} else {
  systemChat "There are currently no nearby players who are restrained to blindfold";
};
