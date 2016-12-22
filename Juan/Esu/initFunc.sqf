//General ESU functions

ESU_Clothing = 
{
	switch (player) do
	{
		case Civ51:	{["KPFS_THW_Press"] call clothes};
		case Civ52:	{["KPFS_THW_Worker"] call clothes};
		case Civ53:	{["KPFS_THW_Worker_helmet"] call clothes};
		case Civ54:	{["KPFS_THW_Worker"] call clothes};
		case Civ55:	{["KPFS_THW_Press"] call clothes};
	};
};


ESU_Repair = 
{
	private ["_veh","_damage","_vehT"];
	_veh = _this select 0;
	_damage = damage _veh;
	_vehT = typeOf _veh;
	
	if (isNull _veh) exitWith {};
	if (_damage < 0.01) exitWith {titleText[format["The %1 isn't damaged!",getText (configFile >> "cfgVehicles" >> _vehT >> "displayName")],"PLAIN"]};
	if (_damage >= 0.99) exitWith {titleText[format["The %1 is too damaged!",getText (configFile >> "cfgVehicles" >> _vehT >> "displayName")],"PLAIN"]};
	if (!alive _veh) exitWith {titleText[format["The %1 is too damaged!",getText (configFile >> "cfgVehicles" >> _vehT >> "displayName")],"PLAIN"]};
	
	_this spawn
	{
		private ["_veh","_Action","_damage","_timeLeft"];
		_veh = _this select 0;
		Juan_Rep_Veh_ESU = true;
		_Action = player addAction ["<t color='#FF0000'>Cancel Repair</t>","noscript.sqf",'Juan_Rep_Veh_ESU = false;'];
		format ['%1 switchMove "AinvPknlMstpSlayWrflDnon_medic";',player] call broadcast;
		while {Juan_Rep_Veh_ESU} do
		{
			if (damage _veh < 0.01) exitWith {};
			if ((animationState player) != "AinvPknlMstpSlayWrflDnon_medic") then {format ['%1 switchMove "AinvPknlMstpSlayWrflDnon_medic";',player] call broadcast};
			_damage = damage _veh;
			_timeLeft = floor(_damage * 10);
			_veh setDammage (_damage - 0.1);
			hintSilent format ["Progess: %1%3\nTime Remaining: %2s",(1-_damage)*100,_timeLeft,"%"];
			sleep 1;
		};
		format ['%1 switchMove "normal";',player] call broadcast;
		player removeAction _Action;
		if (!Juan_Rep_Veh_ESU) then {titleText ["You cancelled repairing this vehicle.","plain"];hint " ";};
		if (Juan_Rep_Veh_ESU) then {titleText ["Vehicle repaired!","plain"];hintSilent format ["Progess: %1%3\nTime Remaining: %2s","100","0","%"];};
	};
};

ESU_Refuel = 
{
	private ["_veh","_fuel","_vehT"];
	_veh = _this select 0;
	_fuel = fuel _veh;
	_vehT = typeOf _veh;
	
	if (isNull _veh) exitWith {};
	if (_fuel > 0.95) exitWith {titleText[format["The %1's tank is full!",getText (configFile >> "cfgVehicles" >> _vehT >> "displayName")],"PLAIN"]};
	if (!alive _veh) exitWith {};
	
	_this spawn
	{
		private ["_veh","_Action","_damage","_timeLeft"];
		_veh = _this select 0;
		Juan_Fuel_Veh_ESU = true;
		_Action = player addAction ["<t color='#FF0000'>Cancel Refuel</t>","noscript.sqf",'Juan_Fuel_Veh_ESU = false;'];
		format ['%1 switchMove "AinvPknlMstpSlayWrflDnon_medic";',player] call broadcast;
		while {Juan_Fuel_Veh_ESU} do
		{
			if (fuel _veh > 0.97) exitWith {};
			if ((animationState player) != "AinvPknlMstpSlayWrflDnon_medic") then {format ['%1 switchMove "AinvPknlMstpSlayWrflDnon_medic";',player] call broadcast};
			_fuel = fuel _veh;
			_timeLeft = round((1 - _fuel)*10);
			format ['%1 setFuel %2;',_veh,(_fuel + 0.1)] call broadcast;
			hintSilent format ["Progess: %1%3\nTime Remaining: %2s",(_fuel)*100,_timeLeft,"%"];
			sleep 1;
		};
		format ['%1 switchMove "normal";',player] call broadcast;
		player removeAction _Action;
		if (!Juan_Fuel_Veh_ESU) then {titleText ["You cancelled refuelling this vehicle.","plain"];hint " ";};
		if (Juan_Fuel_Veh_ESU) then {titleText ["Vehicle refuelled!","plain"];hintSilent format ["Progess: %1%3\nTime Remaining: %2s","100","0","%"];};
	};
};