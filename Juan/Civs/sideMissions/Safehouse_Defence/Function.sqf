//Made by Jonny (Juan) for IslandLifeLiberation.net. Modified by [ILG]SideburnSteve.

while {true} do
{
	uiSleep (25 * 60);

	_Safehousearray = ["SafehouseMissionMain","SafehouseMission2"];
	_SafehouseSelection = _Safehousearray call bis_fnc_selectrandom;
	diag_log format ["Safehouse Check: %1", _SafehouseSelection];
	Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "Quick! Civilians! Arm up and work together!"};'] call broadcast;
	if (_SafehouseSelection == "SafehouseMissionMain") then
	{
	Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "Go to Safehouse #1 and fend off the cops! Make sure you go to the correct one!"};'] call broadcast;
	}
	else
	{
	Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "Go to Safehouse #2 and fend off the cops! Make sure you go to the correct one!"};'] call broadcast;
	};
	Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "Hold it for 30 minutes and you all get $350,000. (Providing you are in the vicinity.)"};'] call broadcast;
	Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "You have 5 minutes to get armed and reach the Safehouse!"};'] call broadcast;
	uiSleep (5 * 60);
	diag_log "Safehouse Check Initiated";
	_civsOnScene = 0;
	{
		if ((((side _x) == CIVILIAN) && isPlayer _x)) then {
			if ((_x distance (getMarkerPos _SafehouseSelection)) <= 200) then {
				_civsOnScene = _civsOnScene + 1;
			};
		};
		diag_log format ["Civilians on Scene: %1", _civsOnScene];
		diag_log format ["Unit: %1 | Distance: %2 | Within Area: ", _x, _x distance (getMarkerPos _SafehouseSelection), ((_x distance (getMarkerPos _SafehouseSelection)) <= 200)];
	} forEach playableUnits;
	
	diag_log format ["Civilian Check Complete: Returned %1 Civilians in Area", _civsOnScene];
	
	if (_civsOnScene == 0) then
	{
		Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "None of you made it to the Safehouse! Mission has been cancelled.";};'] call broadcast;
		Format['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "You must now wait until the next Safehouse opportunity arises.";};'] call broadcast;
	}
	else
	{
		_AreaMarker = createMarker ["AreaOrKillingSafehouse", (getMarkerPos _SafehouseSelection)];
		_AreaMarker setMarkerShape "ELLIPSE";
		_AreaMarker setMarkerSize [200,200];
		_AreaMarker setMarkerColor "ColorBlack";
		Format ['[] call copNotify_Safehouse;'] call broadcast;
		Format ['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "The cops have been notified!"};'] call broadcast;
		Format ['if ((isciv) && !(player in [civ51,civ52,civ53,civ54,civ55])) then {player sidechat "Defend the Safehouse with your life!"};'] call broadcast;
		_Server_Counter = 0;
		while {true} do
		{
			_civsOnScene = 0;
			{
				if ((((side _x) == CIVILIAN) && isPlayer _x)) then {
					if ((_x distance (getMarkerPos _SafehouseSelection)) <= 200) then {
						_civsOnScene = _civsOnScene + 1;
					};
				};
				diag_log format ["Civilians on Scene: %1", _civsOnScene];
				diag_log format ["Unit: %1 | Distance: %2 | Within Area: ", _x, _x distance (getMarkerPos _SafehouseSelection), ((_x distance (getMarkerPos _SafehouseSelection)) <= 200)];
			} forEach playableUnits;
			if (_Server_Counter == (10 * 30)) then {Format['player sidechat "20 Minutes remain on the safehouse mission!";'] call broadcast};
			if (_Server_Counter == (20 * 60)) then {Format['player sidechat "10 Minutes remain on the safehouse mission!";'] call broadcast};
			if (_Server_Counter == (25 * 60)) then {Format['player sidechat "5 Minutes remain on the safehouse mission!";'] call broadcast};
			if (_Server_Counter == (26 * 60)) then {Format['player sidechat "4 Minutes remain on the safehouse mission!";'] call broadcast};
			if (_Server_Counter == (27 * 60)) then {Format['player sidechat "3 Minutes remain on the safehouse mission!";'] call broadcast};
			if (_Server_Counter == (28 * 60)) then {Format['player sidechat "2 Minutes remain on the safehouse mission!";'] call broadcast};
			if (_Server_Counter == (29 * 60)) then {Format['player sidechat "1 Minute remain on the safehouse mission!";'] call broadcast};
			if (_civsOnScene == 0) exitWith
			{
				format['
				SERVER globalChat "No civilians present in the safehouse! Cops have successfully secured the area!";
				if (playerside == west) then
				{
					player sidechat "Well done! Threat eliminated!";
					player sidechat "Generously, the government has sent you $100,000";
					bnkgeld = bnkgeld + 100000;
					player sidechat format ["Spend it wisely, officer %1",name player];
				};
				if (playerside == civilian) then
				{
					player sidechat "Shit! The cops took us all out.";
					player sidechat "Better luck next time....";
				};
				'] call broadcast;
				deleteMarker _AreaMarker;
			};
			if (_Server_Counter == (30 * 60)) exitWith
			{
				format['
				if (playerside == civilian) then
				{

					if (player distance (getMarkerPos "AreaOrKillingSafehouse") <= 350) then
					{
						player sidechat "Well done! You defended the safehouse!";
						player sidechat "As a reward, you are being sent $350,000";
						bnkgeld = bnkgeld + 350000;
						player sidechat "Keep it up.";
					}
					else
					{
						player sidechat "You were not at the safehouse so you did not receive the $350,000, unlucky!";
					};
				};

				if (playerside == west) then
				{
					player sidechat "You failed!";
					player sidechat "The civilians held the safehouse for 30 minutes!";
				};
				'] call broadcast;
				deleteMarker _AreaMarker;
			};
			_Server_Counter = _Server_Counter + 1;
			uiSleep 1;
		};
	};
};
