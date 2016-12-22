_smstext         = _this select 1;
_smsplayernumber = _this select 2;
_smsplayer       = INV_PLAYERLIST select _smsplayernumber;
_moneh = 'Mishy' call INV_GetItemAmount;
if (_smstext == "") exitWith {player groupChat localize "STRS_inv_item_handy_leermsg";};
if (not((format["%1", (_smsplayer)]) call ISSE_UnitExists)) exitWith {player groupChat localize "STRS_inv_item_handy_noplayer";};
if (_moneh < INV_smscost)  exitWith {player groupChat format ["You don't have $%1 to send the sms.",INV_smscost];};
if ((_smstext call ISSE_str_Length) > 175)     exitWith {player groupchat format ["The entered text is too long! %1 maximum chars.","175"];};
['Mishy', -(INV_smscost)] call INV_AddInventoryItem;
player groupChat format [localize "STRS_inv_item_handy_gesendet", _smsplayer];

//Enter the functions here Jon for the reciever to recieve the text w/ adding to sms array ect
/*
format ['_mobile = ("handy" call INV_GetItemAmount);
if ((%2 == player) and (_mobile > 0)) then {titletext [format [localize "STRS_inv_item_handy_nachricht", "%1", %3], "plain"];};
if ((%2 == player) and (_mobile == 0)) then {"if(player == %3)then{player groupChat format [localize ""STRS_inv_item_handy_nichterreicht"", %2]}" call broadcast;};
', _smstext, _smsplayer, player] call broadcast;*/

//if (player == _smsplayer) then {hint "Suc";};
//Improvements by Jonny
_s_smstext = str(format ["%1(%2):   %3",name player,player,_smstext]);

format ['
_mobile = ("handy" call INV_GetItemAmount);
if (player == %1) then {
	if (_mobile != 0) then {[%3] call ILG_SMS_Recieve; SMS = SMS + [%2]; ILG_SMS_Recieved = true;};
};
',_smsplayer,_s_smstext,player] call broadcast;
