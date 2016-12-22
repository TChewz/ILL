//When you alter _MARKERS ensure you edit burgler.sqf

_house  = ((_this select 3) select 0);
_housename = ((_this select 3) select 1);
_uid = getPlayerUID vehicle player;

_unit = _this;
_dist = 10;
_marker = "";
{_range = ((getMarkerPos _x) distance (player));
if (_range < _dist) then 
{_dist = _range; _marker = _x};	
} foreach Homearray;

switch true do
{
case (_marker == "AdminCompoundUKG"):{if(_uid == "234410054") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by JayF8514";};};
case (_marker == "MrRYGamingHouse1"):{if(_uid == "108721286") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by MrRYGaming";};};
case (_marker == "MrRYGamingHouse2"):{if(_uid == "108721286") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by MrRYGaming";};};
case (_marker == "BambisFriend1"):{if(_uid == "108721286") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by Bambis Friend";};};
case (_marker == "BambisFriend2"):{if(_uid == "108721286") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by Bambis Friend";};};
case (_marker == "xEu4n_1"):{if(_uid == "116626182") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by xEu4n";};};
case (_marker == "xEu4n_2"):{if(_uid == "116626182") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by xEu4n";};};
case (_marker == "TerryTheTaliban_1"):{if(_uid == "93979974") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by TerryTheTaliban";};};
case (_marker == "TerryTheTaliban_2"):{if(_uid == "93979974") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by TerryTheTaliban";};};
case (_marker == "TerryTheTaliban_3"):{if(_uid == "93979974") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by TerryTheTaliban";};};
case (_marker == "Cpt.Simpson_1"):{if(_uid == "135055238") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by Cpt.Simpson";};};
case (_marker == "CopKilla_1"):{if(_uid == "139649350") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by CopKilla";};};
case (_marker == "Shonsquad_1"):{if(_uid == "105836678") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by Shonsquad";};};
case (_marker == "ThomasTheDankEngine_1"):{if(_uid == "107728518") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by ThomasTheDankEngine";};};
case (_marker == "ThomasTheDankEngine_2"):{if(_uid == "107728518") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by ThomasTheDankEngine";};};
case (_marker == "Dere_DeviL_1"):{if(_uid == "22146182") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by Dere_DeviL";};};
case (_marker == "[UKG]tom"):{if(_uid == "110654982") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by [UKG]tom";};};
case (_marker == "[UKG]tom1"):{if(_uid == "110654982") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by [UKG]tom";};};
case (_marker == "[UKG]tom2"):{if(_uid == "110654982") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by [UKG]tom";};};
case (_marker == "i5gamer"):{if(_uid == "155621958") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by i5gamer";};};
case (_marker == "i5gamer1"):{if(_uid == "155621958") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by i5gamer";};};
case (_marker == "i5gamer2"):{if(_uid == "155621958") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is owned by i5gamer";};};





//case (_marker == ""):{if(_uid == "") then {[_house,_housename] execVM "maphouse.sqf";} else {player groupchat "This is not owned by you";};};
default {[_house,_housename] execVM "maphouse.sqf";};
};

