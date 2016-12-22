private["_unit","_id"];
_unit = ((nearestObjects [player, ["Man"], 3]) select 1);
if (isnil "imcarryingaguylol") then {imcarryingaguylol = false;};
if (imcarryingaguylol) exitWith {player groupchat "You're already escorting someone!"};
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a 'Man'
//if(!isPlayer _unit) exitWith {}; //Not a human player
if(side _unit != civilian) exitWith {}; //Not a civ
if (player distance _unit > 3 ) exitWith {};
_unit attachTo [player, [0,1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
imcarryingaguylol = true;