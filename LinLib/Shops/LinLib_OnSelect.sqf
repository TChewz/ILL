private["_idc", "_item", "_item_array", "_type", "_name", "_price", "_stock"];

lbClear 44442;

_idc = _this select 1;

{
	if(!(ctrlVisible _x))then{
		ctrlShow [_x, true];
	}
}count _idc;

_item = _this select 0;

if(typeName _item != "STRING")exitWith{diag_log "ON SELECT ERROR: NO STRING"};


_item_array        = _item call INV_getitemArray;
_type 		  		= _item_array call INV_getitemType;
_name         = (_item_array call INV_getitemName);
_price        = _item_array call INV_getitemSteuer;
_stock        = [_item, INV_ActiveShopNumber] call INV_getstock;

if(_stock == -1)then{_stock = "Unlimited"};

switch _type do {

		case "Item": {
			lbAdd [44442, format ["Item: %1", _name]]; 
			lbAdd [44442, format ["Price: $%1", _price]]; 
			lbAdd [44442, format ["Weight: %1kg", (_item_array call INV_getitemTypeKg)]]; 
			lbAdd [44442, format ["Stock: %1", _stock]]; 
		};
		
		case "Vehicle": {
			lbAdd [44442, format ["Name: %1", _name] ];
			lbAdd [44442, format ["Top Speed: %1",([(_item_array call INV_getitemClassName)] call LinLib_GetCfgspeed)] ];
			lbAdd [44442, format ["Price: $%1", (_price call ISSE_str_IntToStr)] ];
			lbAdd [44442, format ["Stock: %1", _stock] ];
			ctrlSetText [44441, ([(_item_array call INV_getitemClassName), "cfgVehicles"] call LinLib_GetCfgImage)];
		};
		
		case "Waffe": {
			_index = lbAdd [44442, format ["Name: %1", _name]];
			_index = lbAdd [44442, format ["Price: $%1",(_price call ISSE_str_IntToStr)]];
			_index = lbAdd [44442, format ["Stock: %1", _stock]];
			ctrlSetText [44441, ([(_item_array call INV_getitemClassName), "cfgWeapons"] call LinLib_GetCfgImage)];
		};
		
		case "Magazin": {
			_index = lbAdd [44442, format ["Name: %1", _name]];
			_index = lbAdd [44442, format ["Price: $%1", (_price call ISSE_str_IntToStr)]];
			_index = lbAdd [44442, format ["Stock: %1", _stock]];
			_index = lbAdd [44442, format ["Rounds: %1",[(_item_array call INV_getitemClassName)] call LinLib_GetCfgMagCount]];
			_index = lbAdd [44442, format ["Damage: %1",[(_item_array call INV_getitemClassName)] call LinLib_GetCfgDamage]];
			ctrlSetText [44441, ([(_item_array call INV_getitemClassName), "cfgMagazines"] call LinLib_GetCfgImage)];
		};
};