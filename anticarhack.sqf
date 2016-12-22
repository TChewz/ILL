//Checks if vehicle the player is in the server vehicle array

while {true} do
{
	waitUntil {vehicle player != player};
	
	if !((vehicle player) in INV_ServerVclArray) then
	{
		(format["server globalchat ""%1 HAS ENTERED A HACKED VEHICLE! ALERT AN ADMIN!"";", name player]) call broadcast;
		(format["server globalchat ""%1 HAS ENTERED A HACKED VEHICLE! ALERT AN ADMIN!"";", name player]) call broadcast;
		(format["server globalchat ""%1 HAS ENTERED A HACKED VEHICLE! ALERT AN ADMIN!"";", name player]) call broadcast;
		hackerjustloggedin = true;
		publicvariable "hackerjustloggedin";
		//disableUserInput true;
		player groupchat format ["%1, nice try mate.",name player];
		player groupchat format ["%1, nice try mate.",name player];
		player groupchat format ["%1, nice try mate.",name player];
		player groupchat format ["%1, nice try mate.",name player];
		sleep 180;
		endmission "end3";
	}
	else
	{
		player groupchat "Vehicle check done.";
	};
	
	waitUntil {vehicle player == player};
};	