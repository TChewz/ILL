_lotto     = (_this  select 0) call GetLottoArray;
_lottocost = (_lotto select 2);
_lottowin  = random(_lotto select 3);
_chance    = (_lotto select 4);
_winner    = round(random 30);
_geld      = 'geld' call INV_GetItemAmount;
_win = (_lottowin > _lottocost);

if (playing_lotto == 1 ) exitWith {role groupChat "Woah, slow down! You still need to scratch the one you have!";};
if (_geld < _lottocost) exitWith {role groupChat "You need more money to play the lottery!";};
['geld', -(_lottocost)] call INV_AddInventoryItem;
player groupChat "Wait 20 seconds for your result.";
playing_lotto = 1; 
sleep 20; 
playing_lotto = 0;

if (_winner < _chance) then 

{ 

player groupChat format ["You lost on the ticket - (%1)",_lotto select 1];

[lottobuy,"lottolose"] call fn_netSay3D;



} 
else 
{

if(_win) then {	

['geld', _lottowin] call INV_AddInventoryItem;	
//player groupChat format[localize "STRS_lotto_winner", (_lottowin call ISSE_str_IntToStr)];
player groupchat format ["You won: $%1 on the ticket (%2)!", _lottowin, _lotto select 1];

if (_lottowin < 2500) then {nul = [lottobuy,"lottowin"] call fn_netSay3D;
};

if (_lottowin > 2500) then {nul = [format ["%1 won over $2500 from the lottery!", (name player)] ] call fn_netChat; [lottobuy,"lottojackpot"] call fn_netSay3D;
};
}

else {player groupChat format ["You lost on the ticket - (%1)", _lotto select 1];

[lottobuy,"lottolose"] call fn_netSay3D;
};

};

