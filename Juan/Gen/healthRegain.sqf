/*
	Desc:
		Basically it builds
		the players health
		over time
*/

while {true} do
{
	waitUntil {((getDammage player) > 0) && ((getDammage player) < 0.6) && (alive player)};
	while {true} do
	{
		sleep ((random (10) + 10));
		if (alive player) then {player setDammage ((getDammage player) - 0.01);};
		if ((getDammage player) == 0) exitWith {/*	Exits loop, to original waitUntil loop	*/};
		if (!alive player) exitWith {/*	Exits loop, to original waitUntil loop	*/};
	};
};