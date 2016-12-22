if(typename _this == "ARRAY") exitwith

	{

	_id	 = _this select 3;	
	_arr 	 = (INV_ItemFabriken select _id);
	_queue	 = (_arr select 8);
	_fqueue  = call compile format["%1", _queue];
	_Mishy 	 = "Mishy" call INV_getitemamount;
	_workers = call compile format['%1workers', _queue];

	if(_workers >= maxfacworkers2)exitwith{server globalChat "max factory workers reached!"};
	if(_Mishy < (facworkercost*10))exitwith{server globalChat "you do not have enough money"};
	
	["Mishy", - (facworkercost*10)] call INV_AddInvItem;

	call compile format['%1workers = %1workers + 10;["%1workers", %1workers] spawn ClientSaveVar;', _queue];

	//player groupchat "10 Factory workers hired!";
	server globalChat format ["10 Factory Worker's Hired %1/150", _workers + 10];

	if(count _fqueue > 0)then{call compile format['%1eta = %1eta - (%1eta/maxfacworkers);', (_fqueue select 0)];};

	};