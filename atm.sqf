if (isNil "local_robbsperre") then {local_robbsperre = 0;};
if (local_robbsperre == 1)  exitWith {player groupChat format [localize "STRS_bank_dialoge_robbsperre",(local_robbsperre_zeit call ISSE_str_IntToStr)]};
if (!(createDialog "ILG_ATM_Menu")) exitWith {hint "Dialog Error!";};
_liste = [2100, true, false] call INV_DialogPlayers;
if ((_liste select 1) >= 0) then {lbSetCurSel [2100, (_liste select 1)];};
_Mishy = 'Mishy' call INV_GetItemAmount;
CtrlSetText [1006,format ["$%1",(_Mishy call ISSE_str_IntToStr)]];
CtrlSetText [1004, format["$%1",(bnkgeld call ISSE_str_IntToStr)]];
CtrlSetText [1401,"0"];
CtrlSetText [1400,"0"];
CtrlSetText [1601,"Withdraw"];
CtrlSetText [1600,"Deposit"];

buttonSetAction [1600, "
[lbData [2100, lbCurSel 2100],(ctrlText 1400),'deposit'] execVM 'transact.sqf';
"];
buttonSetAction [1601, "
[(ctrlText 1401),0,'withdraw'] execVM 'transact.sqf';
"];

while {ctrlVisible 2100} do
{
	_Money = 'Mishy' call INV_GetItemAmount;
	_Bank = bnkgeld call ISSE_str_IntToStr;
	_Bank_Str = format["$%1",_Bank];
	_Money_STr = format["$%1",_Money];
	_Sel = call compile (lbData [2100, lbCurSel 2100]);
	_Player_Sel = INV_PLAYERLIST select _Sel;
	if (_Player_Sel == player) then {CtrlSetText [1600,"Deposit"]}else{CtrlSetText [1600,"Transfer"]};

	if (((ctrlText 1006) != _Money_STr) ||  ((ctrlText 1004) != _Bank_Str)) then
	{
		CtrlSetText [1006,format ["$%1",(_Money call ISSE_str_IntToStr)]];
		CtrlSetText [1004, format["$%1",_Bank]];
	};
	sleep 0.15;
};
