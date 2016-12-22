if (!(createDialog "INV_ItemListDialog")) exitWith {hint "Dialog Error!";};

_ButtonAction = _this select 0;
_ButtonText = _this select 1;

buttonSetAction [5, _ButtonAction];
ctrlSetText [5, _ButtonText];

{
  _ItemInMasterArray = (_x select 0);
  _ItemInformation = (_ItemInMasterArray call INV_getitemArray);
  _AddingIndex = lbAdd [1, (_ItemInformation call INV_getitemName)];
  lbSetData [1, _AddingIndex, _ItemInMasterArray];
} count INV_AlleItemsArray;

ctrlSetText [2, ""];
ctrlSetText [3, ""];
lbSetCurSel [1, 0];
_SelectedItem = (lbCurSel 1);

while {ctrlVisible 1038} do {
  _ItemSelectedMasterArrayClassname  = lbData [1, (lbCurSel 1)];
  _ItemInformation = (_ItemSelectedMasterArrayClassname call INV_getitemArray);
  ctrlSetText [2,  format [(_ItemInformation call INV_getitemDescription2)];
  ctrlSetText [3,  format ["Weights: %1", (_ItemInformation call INV_getitemTypeKg)]];
  if (not((lbCurSel 1) == _selected)) then {
    _selected = (lbCurSel 1);
    lbClear 4;
    if (_item != "") then {
      _benoetigteItems = (_item call INV_getitemMaterials);
      {
      lbAdd [4, format["%1 - %2", ((_x select 0) call INV_getitemName), (_x select 1)]];
      } count _benoetigteItems;
    };
  };
  sleep 0.3;
};
