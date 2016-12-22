//Written by [ILG] SideburnSteve for Island Life Gaming.

deleteMarker "Fire";
deleteMarker "Fire2";
deleteVehicle FireObj;
			
Format['if (playerside == resistance) then {player sidechat "Multiple 911 calls have come in reporting a large fire!"};'] call broadcast;
Format['if (playerside == resistance) then {player sidechat "Check your map for the location and get to it quickly!"};'] call broadcast;
Format['if (playerside == west) then {player sidechat "Multiple 911 calls have come in reporting a large fire. Check your map for the location."};'] call broadcast;
	
_fireLocation = ["firespawn1","firespawn2","firespawn3","firespawn4","firespawn5","firespawn6","firespawn7","firespawn8","firespawn9","firespawn10","firespawn11","firespawn12","firespawn13","firespawn14","firespawn15","firespawn16","firespawn17","firespawn18","firespawn19","firespawn20"];
_fireSelection = _fireLocation call bis_fnc_selectrandom;  
	
_fireMarker = createMarker ["Fire", (getMarkerPos _fireSelection)];
_fireMarker setMarkerShape "ELLIPSE";
_fireMarker setMarkerSize [80,80];
_fireMarker setMarkerColor "ColorRed";

_fireMarker2 = createMarker ["Fire2", (getMarkerPos _fireSelection)];
_firemarker2 setMarkerType "Warning";
_fireMarker2 setMarkerColor "ColorBlack";
"Fire2" setMarkerText "!!! FIRE !!!";

fireObj = "HeliHEmpty" createVehicle (getMarkerPos _fireSelection);
fireObj setVehicleInit "i=[this,15,time,false,false] spawn BIS_Effects_Burn"; processInitCommands;
fireObj setVariable ["isonfire",1,true];

fireIsSpawned = true;
publicVariable "fireIsSpawned";