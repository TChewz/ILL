_num     = ((_this select 3) select 0);
_fabname = ((INV_ItemFabriken select _num) select 1);
_cost    = ((INV_ItemFabriken select _num) select 6);
_Mishy    = 'Mishy' call INV_GetItemAmount;

if (_fabname in INV_Fabrikowner) exitWith {player groupChat localize "STRS_inv_alreadygotshop";};
if (_Mishy < _cost) 		 exitWith {player groupChat localize "STRS_inv_kein_Mishy";};

INV_Fabrikowner = INV_Fabrikowner + [ _fabname ];
['Mishy', -(_cost)] call INV_AddInvItem;
[player, [["factories", INV_Fabrikowner]]] call LinLib_fnc_ClientUpdate;

player groupChat format[localize "STRS_inv_gotshop", player, (_cost call ISSE_str_IntToStr)];
