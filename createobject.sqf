_art = _this select 0;
if (_art == "use") then 
{

	_item    = _this select 1;
	_class	 = _item call INV_getitemClassName;

	if(_item call INV_GetItemAmount < 1) exitwith {};

	[_item, -1] call INV_AddInvItem;	

	_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
	_obj = _class createvehicle [0, 0, 0];
	_obj setdir getdir player;
	_obj setpos _pos;
	_time = round time;
	call compile format['_obj setvehicleinit "this setvehiclevarname ""%1%2%3""; %1%2%3 = this"; processinitcommands', player, _class, _time];
	
	if (_class == "ZavoraAnim") then
	{
		_obj setVehicleInit "this addEventHandler [""HandleDamage"", {false}];";
		processInitCommands;
	};
	
	if (_class == "il_barrier") then
	{
		_obj setPos [(position player select 0) + (sin(getdir player)*4), (position player select 1) + (cos(getdir player)*4), 0];
	};
	
	if (_class == "Barrel4") then
	{
		_obj setVariable ["StillIsOn",false,true];
		_obj setVehicleInit "this allowDamage false;";
		processInitCommands;
	};
};
