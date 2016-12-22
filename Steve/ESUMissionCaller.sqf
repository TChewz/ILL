// Used to randomly call one of the ESU missions. Written by [ILG] SideburnSteve for Island Life Gaming.

while {true} do {

	waitUntil {!(fireIsSpawned)};
	waitUntil {!(gasIsSpawned)};
	waitUntil {!(wreckIsSpawned)};
	waitUntil {playersNumber resistance >=1};

	uiSleep (15 * 60);
	
	_num = floor (random (3));	
	
	if (_num == 0) then
	{
		execVM "Steve\gasleak.sqf";
	};
	
	if (_num == 1) then
	{
		execVM "Steve\randomfire.sqf";
	};
	
	if (_num == 2) then
	{
		execVM "Steve\wrecks.sqf";
	};
	
	uiSleep 10;
	
};