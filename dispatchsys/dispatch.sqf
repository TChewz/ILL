/*
	Waypoint creator for desired unit
*/
closedialog 0;
_mapClicked = false;
_unit = _this select 0;
if (!alive _unit) exitWith {player groupchat "This cop number either isn't ingame or is dead!";};
_wpAllowed = _unit getVariable "wpavalible";
if (!_wpAllowed) exitWIth {player groupchat "This player has disalowed the dispatch system!";};
groupa = group _unit;

hint format ["Select a position to send %1",_unit];
if (visiblemap) then
{
	[] spawn JuansCopMarkers;
}
else
{
	openMap [true, false];
	[] spawn JuansCopMarkers;
};

onMapSingleClick "
_wp = groupa addWaypoint [_pos, 1];
_wp setWaypointType ""MOVE"";
_wp setWaypointCompletionRadius 50;
mapClicked = true;
onMapSingleClick """";
";
waitUntil {mapClicked};
player sidechat "Waypoint set!";
format ['if (player == %1) then {player sideChat "You have been assigned a location to dispatch to. Follow the waypoint.";};',_unit] call broadcast;
mapClicked = false;