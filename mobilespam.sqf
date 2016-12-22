while {true} do
{
	_amount = 'handy' call INV_GetItemAmount;
	waituntil {_amount > 1 || !alive player};
	if (!alive player) then
	{
		["handy", 0] call INV_SetItemAmount;
		waitUntil {alive player};
		["handy", 1] call INV_SetItemAmount;
	};
	if (_amount > 1) then
	{
		["handy", 1] call INV_SetItemAmount;
	};
};