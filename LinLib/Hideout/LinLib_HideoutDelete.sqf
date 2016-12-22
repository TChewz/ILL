if((_this getVariable ["LinLib_HideoutOwner", 0]) == getPlayerUID player)then{
	private["_array"];
	_array = _this getVariable ["LinLib_HideOutArray", []];
	if((count _array) > 0)then{
		["DB_HideoutRemove", [_this, (getPlayerUID player)]] call LinLib_fnc_ClientToServer;
		['hideout', 1] call INV_AddInvItem;
		server setVariable [(getPlayerUID player), false, true];
	};
}else{
	systemChat "You don't own this.";
};
