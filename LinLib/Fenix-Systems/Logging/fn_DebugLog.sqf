if(!(isNil "LinLib_Logging"))then{
	if(LinLib_Logging)then{	
		if((isNil "_this"))exitWith{diag_log "ERROR: NO VARIABLE TO LOG";};
		
		diag_log format["%1:%2 %3", _this select 0, _this select 1, _this select 2];
	};
};
