while {true} do
{

sleep 300;

{
	if (count units _x==0) then
	{
		deleteGroup _x;
	};
} forEach allGroups;

};