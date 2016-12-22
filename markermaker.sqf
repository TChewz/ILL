/*
	Filename: markermaker.sqf
	By; [ILG] Jonny
	Desc: If player is in the UID var's then will create a marker.
	Made for Island Life Liberation
*/
sleep 5;
//================DONATOR MARKERS===============
if ((GetplayerUID player) in vipdonators || (call Tier1_Unlocked)) then
{
	_marker = createMarkerLocal ["donatorlevelmarker", (getmarkerpos "donatorstatusmarker")];
	_marker setMarkerColorlocal "ColorBlue";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Donator Level : Tier 1";
};

sleep 1;

if ((GetplayerUID player) in vipdonators2 || (call Tier2_Unlocked)) then
{
	deleteMarkerlocal "donatorlevelmarker";
	_marker = createMarkerLocal ["donatorlevelmarker", (getmarkerpos "donatorstatusmarker")];
	_marker setMarkerColorlocal "ColorBlue";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Donator Level : Tier 2";
};

sleep 1;

if ((GetplayerUID player) in vipdonators3 || (call Tier3_Unlocked)) then
{
	deleteMarkerlocal "donatorlevelmarker";
	_marker = createMarkerLocal ["donatorlevelmarker", (getmarkerpos "donatorstatusmarker")];
	_marker setMarkerColorlocal "ColorBlue";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Donator Level : Tier 3";
};

sleep 1;

if ((GetplayerUID player) in donatorlevel4 || (call Tier4_Unlocked)) then
{
	deleteMarkerlocal "donatorlevelmarker";
	_marker = createMarkerLocal ["donatorlevelmarker", (getmarkerpos "donatorstatusmarker")];
	_marker setMarkerColorlocal "ColorRed";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Donator Level : Tier X";
};

sleep 1;

if !((GetplayerUID player) in vipdonators || ((call Tier1_Unlocked) || (call Tier2_Unlocked) || (call Tier3_Unlocked) || (call Tier4_Unlocked))) then
{
	deleteMarkerlocal "donatorlevelmarker";
	_marker = createMarkerLocal ["donatorlevelmarker", (getmarkerpos "donatorstatusmarker")];
	_marker setMarkerColorlocal "ColorYellow";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Donator Level : Not Yet Unlocked a Donator Level";
};

sleep 1;


//================ADMIN MARKERS===============
sleep 1;
if ((getplayerUID player) in mod) then
{
	_marker = createMarkerLocal ["adminlevelmarker", (getmarkerpos "adminstatusmarker")];
	_marker setMarkerColorlocal "Colorwhite";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Staff Level: Moderator";
};

sleep 1;

if ((getplayerUID player) in admin) then
{
	_marker = createMarkerLocal ["adminlevelmarker", (getmarkerpos "adminstatusmarker")];
	_marker setMarkerColorlocal "Colorwhite";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Staff Level: Administrator";
};

sleep 1;

if ((getplayerUID player) in superadmin) then
{
	_marker = createMarkerLocal ["adminlevelmarker", (getmarkerpos "adminstatusmarker")];
	_marker setMarkerColorlocal "Colorwhite";
	_marker setMarkerTypelocal "Mil_dot";
	_marker setMarkerTextlocal "Staff Level: Super Administrator";
};
