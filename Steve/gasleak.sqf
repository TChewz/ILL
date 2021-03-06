//Written by [ILG] SideburnSteve for Island Life Gaming.

deleteMarker "GasLeak";
deleteMarker "GasLeak2";
deleteVehicle GasLeakObj;
				
Format['if (playerside == resistance) then {player sidechat "Dispatch has gotten reports of a dangerous gas leak."};'] call broadcast;
Format['if (playerside == resistance) then {player sidechat "Check your map for the location and get to it quickly!"};'] call broadcast;
Format['if (playerside == west) then {player sidechat "Dispatch has gotten reports of a dangerous gas leak. Check your map for the location."};'] call broadcast;
	
_gasLocation = ["gasspawn1","gasspawn2","gasspawn3","gasspawn4","gasspawn5","gasspawn6","gasspawn7","gasspawn8","gasspawn9","gasspawn10","gasspawn11","gasspawn12","gasspawn13","gasspawn14","gasspawn15","gasspawn16","gasspawn17","gasspawn18","gasspawn19","gasspawn20"];
_gasSelection = _gasLocation call bis_fnc_selectrandom;  
	
_gasMarker = createMarker ["GasLeak", (getMarkerPos _gasSelection)];
_gasMarker setMarkerShape "ELLIPSE";
_gasMarker setMarkerSize [80,80];
_gasMarker setMarkerColor "ColorYellow";

_gasMarker2 = createMarker ["GasLeak2", (getMarkerPos _gasSelection)];
_gasMarker2 setMarkerType "Warning";
_gasMarker2 setMarkerColor "ColorBlack";
"GasLeak2" setMarkerText "!!! GAS !!!";
		
gasIsSpawned = true;
publicVariable "gasIsSpawned";
	
while {true} do
{
	if (!(gasIsSpawned)) exitWith {};
	gasLeakObj = "SmokeShellYellow" createVehicle (getMarkerPos _gasSelection);
	gasLeakObj setVariable ["isleaking",1,true];
	sleep 25;
};