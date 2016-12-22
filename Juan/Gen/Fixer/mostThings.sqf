{
	if ((typeOf _x == "") && (damage _x > 0)) then
	{
		_x setDammage 0;
	};
} forEach (nearestObjects [BuildSUV,[], 7500]);

sleep 1;

/*

{
	if (count units _x==0) then
	{
		deleteGroup _x;
	};
} forEach allGroups;

*/