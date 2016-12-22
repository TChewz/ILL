// Calls functions in a loop to keep the server clean.
if (!isServer) exitWith {};
while {isServer} do
{
	sleep 900;
	Format ['systemChat "ILL Server Cleanup: Initiating...";'] call broadcast;
	sleep 5;
	[] execVM "Juan\Gen\Fixer\mostThings.sqf";
	[] execVM "Juan\Gen\Fixer\buildingsOnly.sqf";
	sleep 7.5;
	Format ['systemChat "ILL Server Cleanup: Finished, map fixed.";'] call broadcast;
};
