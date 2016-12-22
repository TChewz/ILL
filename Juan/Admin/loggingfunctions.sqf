jon_adminlogs =
{
	disableSerialization;
	private [];	
	createDialog "Jon_adminlogs";
	buttonSetAction [1600,"[] call buttonSearchLogs;"];
	_information = (uiNamespace getVariable "jon_adminlog") displayCtrl 1100;
	{
		_lb = lbAdd [1500,_x select 0];
		lbSetValue [1500,_lb,_x select 2];
	}count adminLogs;
	lbSetCurSel [1500,0];
	_curSel = lbCurSel 1500;
	_oldSel = -1;
	while {ctrlVisible 1382} do
	{
		_curSel = lbCurSel 1500;
		_lbValue = lbValue [1500,_curSel];
		if (_curSel != _oldSel) then
		{
			_information ctrlSetStructuredText (_lbValue call ret_logDetails);
		};
		
		uiSleep 0.1;
		_oldSel = _curSel;
	};
};

buttonSearchLogs =
{
	private ["_query","_numberArray","_i","_val","_title","_arrayToAdd"];
	_query = ctrlText 1382;
	_val = _x select 2;
	_title = _x select 0;
	_result = false;
	_arrayToAdd = [];
	_numberArray = toArray(toLower(_query));
	{
		_eventTitle = _x select 0;
		_eventTitleNum = toArray(toLower(_eventTitle));
		_i = 0;
		{
			if (_x in _eventTitleNum) then
			{
				_i = _i + 1;
			};
			
		}count _numberArray;//Run through search query
		if (_i == count _numberArray) then
		{
			_result = true;
			_arrayToAdd = _arrayToAdd + [_x];
		};
	}count adminLogs;
	if (_result) then 
	{
		lbClear 1500;
		{
			_lb = lbAdd [1500,_x select 0];
			lbSetValue [1500,_lb,_x select 2];
		}count _arrayToAdd;
	};
};

ret_logDetails =
{
	private ["_ret","_x"];
	_ret = -1;
	{
		if (_x select 2 == _this) then
		{
			_ret = _x select 1;
		};
	}count adminLogs;
	
	_ret;
};

addToLogs =
{
	private ["_EventTitle","_EventInfo","_logLen"];
	_EventTitle = _this select 0;
	_EventInfo = _this select 1;
	_logLen = count adminLogs;
	
	//removed temporarily
	//adminLogs = adminLogs + [[_EventTitle,_EventInfo,(_logLen+1)]];
	//publicVariable "adminLogs";
};