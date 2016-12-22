if (iscop) then
{
	player groupchat format["You have requested backup. Your location has been marked on the map."];
	_civ = player;
	deleteMarker "Backup";
	_markerobj = createMarker ["Backup",[0,0]];
	_markerobj setMarkerShape "ICON";
	_markerobj setMarkerType "Warning";
	"Backup" setMarkerColor "ColorBlue";
	"Backup" setMarkerText format ["%1 (%2) Requested Backup Here!", name _civ, _civ];
	"Backup" setMarkerPos getPos _civ;
	format['if (iscop) then {player sidechat "%1 (%2) Is requesting immediate backup! His location has been marked on the map via a map marker (GRID:%3)."; playSound "beepSimple";};',name _civ, _civ, [_civ] call Emita_GetGridRef] call broadcast;
};
