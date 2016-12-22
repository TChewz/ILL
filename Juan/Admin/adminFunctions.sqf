admin_menu =
{
	private [];
	_staffLevel = _this select 0;
	systemchat _staffLevel;
	_tools = [];
	switch (_staffLevel) do
	{
		case "SA":
		{
			_tools =	[
				"Heal/Repair (3m)",
				"Spectate (F3 to Quit)",
				"Stat Checker",
				"Log System",
				"Teleport",
				"Delete",
				"Carmageddon (50 meters)",
				"GPS/NV/Binocs",
				"World Heal",
				"Masterkey",
				"Inventory Money",
				"Tags",
				"Satellite",
				"Repair Kit",
				"Refuel Can",
				"Medkit",
				"Fix My Ride",
				"Infinite Ammo",
				"Infinite Fuel",
				"PGSpawn",
				"Teleport Player To Me"
			];
		};
		case "A":
		{
			_tools =	[
				"Heal/Repair (3m)",
				"Spectate (F3 to Quit)",
				"Stat Checker",
				"Log System",
				"Teleport",
				"Delete",
				"Carmageddon (50 meters)",
				"GPS/NV/Binocs",
				"World Heal",
				"Masterkey"
			];
		};
		case "M":
		{
			_tools =	[
				"Heal/Repair (3m)",
				"Spectate (F3 to Quit)",
				"Stat Checker",
				"Log System"
			];
		};
	};
	
	createDialog "Main";
	{
		_lb = lbAdd [1000,_x];
		lbSetData [1000,_lb,_x];
	}count _tools;
	
};