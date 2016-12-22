private["_dialog", "_idc"];
_dialog = _this select 0;
_idc = _this select 1;

if(typeName _idc != "ARRAY")exitWith{diag_log "ON LOAD ERROR: NO ARRAY"};

{
	ctrlShow [_x, false];
}count _idc;
