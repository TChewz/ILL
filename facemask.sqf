if ((_this select 0) == "use") then
{
	_Item = _this select 1;
	_Var = player getVariable "FaceMaskOn";
	if (!alive player) exitWith {};
	if (iscop) exitWith {};
	if ((animationState player) == "civillying01") exitWith {};
	if (_Var) exitWith {player groupchat "You already have a gas mask on!"};
	
	[_item, -1] call INV_AddInventoryItem;
	player setVariable ["FaceMaskOn",true,true];
	player groupchat "You have put on a face mask.";
};