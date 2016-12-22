_fireobject = nearestObject [player, "HeliHEmpty"];

if (_fireobject getVariable "isonfire" == 1) then
{

	if (fixingfire) exitWith {player groupChat "Someone else is already extinguishing the fire."};

	fixingfire = true;
	publicVariable "fixingfire";
	
	titleText ["You are extinguishing the fire...","PLAIN DOWN"]; titleFadeOut 6;
	
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	
	if (!(alive player)) exitWith {fixingfire = false; publicVariable "fixingfire";};
	
	deleteVehicle _fireobject;
	deleteMarker "Fire";
	deleteMarker "Fire2";
	bnkgeld = bnkgeld + 15000;
	player groupChat "You have been paid $15,000 for putting out a fire! Good work!";
	fireIsSpawned = false;
	publicVariable "fireIsSpawned";
	fixingfire = false;
	publicVariable "fixingfire";
};