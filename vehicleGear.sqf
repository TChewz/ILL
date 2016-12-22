//Prevents players getting in the gears of vehicles they dont own

GearLoopRunning = true;//Incase it breaks
while {GearLoopRunning} do
{
	waitUntil {!IsNull (FindDisplay 106)};
	_nObject = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 75] select 0);
	if (!(cursortarget call Own_This_Vehicle) && (vehicle player == player) && (cursortarget isKindOf "LandVehicle") && ((player distance cursortarget) < 15)) then 
	{
		closeDialog 106; closeDialog 106; closeDialog 106; closeDialog 106; closeDialog 106;
		player groupchat "You can't access that vehicle! You don't have the keys.";
	};
	sleep 0.15;
};