_bail    = _this select 0;

if (!(_bail call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_inv_no_valid_number"};

_bail    = _bail call ISSE_str_StrToInt; 

if (_bail <= 0) exitWith {};

_copplayernumber = playersNumber west;

_copbail = round(_bail/_copplayernumber);

_Mishy    = 'Mishy' call INV_GetItemAmount; 

if (_Mishy > _bail) exitwith 

{

['Mishy', -(_bail)] call INV_AddInvItem;
player groupChat format [localize "STRS_bail_self", (_bail call ISSE_str_IntToStr)];
format ["if (iscop) then {[""Mishy"", %2] call INV_AddInvItem; player groupChat format [localize ""STRS_bail_addbail"", %2, ""%3""];}; titletext [format[localize ""STRS_bail_payed"",%3, %1], ""plain""]; kopfMishy_%4 = kopfMishy_%4 - %1; if(kopfMishy_%4 < 0)then{kopfMishy_%4 = 0};", (_bail call ISSE_str_IntToStr), (_copbail call ISSE_str_IntToStr), rolenumber, player] call broadcast;

};


if (bnkgeld > _bail) exitWith 

{

bnkgeld = bnkgeld - _bail;
player groupChat format [localize "STRS_bail_self", (_bail call ISSE_str_IntToStr)];
format ["if (iscop) then {[""Mishy"", %2] call INV_AddInvItem; player groupChat format [localize ""STRS_bail_addbail"", %2, ""%3""];}; titletext [format[localize ""STRS_bail_payed"",%3, %1], ""plain""]; kopfMishy_%4 = kopfMishy_%4 - %1; if(kopfMishy_%4 < 0)then{kopfMishy_%4 = 0};", (_bail call ISSE_str_IntToStr), (_copbail call ISSE_str_IntToStr), rolenumber, player] call broadcast;

}; 

player groupChat localize "STRS_bail_cantpay";
