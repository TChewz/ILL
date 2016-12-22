_art = _this select 0;
_item   = _this select 1;
_anzahl = _this select 2;

if (!(createDialog "handydialog")) exitWith {hint "Dialog Error!";};
[2, true, false] call INV_DialogPlayers;
lbSetCurSel [99, 0];
ctrlSetText [4, format[localize "STRD_description_handy_cost", INV_smscost]];
buttonSetAction [3, "[""handy2"", ctrlText 1, call compile lbData [2, lbCurSel 2]] execVM ""handy3.sqf""; closedialog 0;"];