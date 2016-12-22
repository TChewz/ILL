//Executes all the antihack scripts

["noloop"] execVM "anti-hack.sqf";//Exec's initan antihack for startup
//[] execVM "ah3.sqf";
[] execVM "antidebug.sqf";//Exec's antidebug monitor
[] execVM "JAH.sqf";
//[] execVM "anticarhack.sqf";//Prevents players getting in hacked cars


/*while {true} do
{
	sleep (random (600));//Don't make it crazy, boyo


	["loop"] execVM "anti-hack.sqf";
};*/
