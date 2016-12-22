_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;
_safedoor = _this select 2;
Bank_Ready = 0;

if (_art == "ausrauben") then 

{	

if (playersNumber west < 4) exitwith {player groupchat "There must be at least 4 cops online to rob this!"};

call compile format["local_cash = robpool%1", _safe];

if(local_cash < 21000)exitwith{player groupchat "this safe has recently been stolen from and is empty"};

if(!robenable)exitwith{player groupchat "you are already robbing the bank"};
if(!(call INV_isArmed) and !debug)exitWith{player groupChat localize "STRS_bank_rob_noweapon";};
robenable = false;
call compile format["robpool%1 = 0;publicvariable ""robpool%1"";", _safe];			
player groupChat format[localize "STRS_bank_rob_info", (robb_money call ISSE_str_IntToStr)];

format['[0,1,2,["opfer", %1, %2]] execVM "bankrob.sqf";', _safe, local_cash] call broadcast;

if (_safedoor == "safe1") then
{
safe1 animate ["Safe_Door",1];
player playmove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
player playmove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
safe1 animate ["Safe_Door",0];
Safecracked1 = FALSE;
};

[] spawn Bank_Time_Check;								
waituntil {Bank_Ready == 1};

stolencash = stolencash + local_cash;
('if((isciv) and (player distance mainbank < 50)) then {local_useBankPossible = false;};') call broadcast;
robenable = true;
rblock = rblock + ((local_cash/50000)*60);
_rblock = rblock;

sleep 300;

if(_rblock != rblock)exitwith{};

for [{rblock}, {rblock > -1}, {rblock=rblock-1}] do {sleep 1;};												

('local_useBankPossible = true') call broadcast;
stolencash = 0;
rblock	   = 0;


};


if (_art == "opfer") then 

{

_robpool = _this select 2;

_percentlost = _robpool/2000000;
															
//titleText [localize "STRS_bank_rob_titlemsg", "plain"];

Safe1 say "alarmbell";
copbase1 say "Bankalarm";
dmv say "Bankalarm";

sleep 8;

//["Bank", "civilian", _robpool] spawn Isse_AddCrimeLogEntry;
//server globalchat format["The thief stole $%1!", _robpool];

sleep 4;


};





Bank_Time_Check = {
	
	_counter = 300;
	timeleftforbankrobbery = _counter;
	publicVariable "timeleftforbankrobbery";
	Format ['[%1] call copNotify_bankRobbery;',player] call broadcast;
	
	
	while {true} do 
	{
		
		
		//Checks if he's been there the full 300 Secs.
		if (timeleftforbankrobbery < 1) exitWith 
		{
			server globalchat "The recent bank robbery was successful, the robber have taken the money.";
			titleText [format["BANK ROBBERY SUCCESSFUL!\nYOU GOT $%1 FOR ROBBING IT",local_cash],"plain"];
			
			"
			if (iscop) then
			{
				titleText [""BANK ROBBERY WAS SUCCESSFUL. YOU'VE FAILED."",""plain""];
			};
			" call broadcast;
			
			//Finishing touches 
			_cash = local_cash + 350000;
			['dirtymoneh', _cash] call INV_AddInvItem;
			player groupChat format[localize "STRS_bank_rob_success"];
			[local_cash] spawn Bank_Rob_End_Script;
			streetrep = streetrep + 2.5;
			[player, [["streetrep", streetrep]]] call LinLib_fnc_ClientUpdate;
			player groupChat "You've managed to rob the bank successfully! Get out of here!";
			player groupchat "You've earned +2.5 Street Reputation for a successful bank heist! Tony will be very pleased.";
			
			["Bank", "civilian", local_cash] spawn Isse_AddCrimeLogEntry;
			server globalchat format["The thief stole $%1!", _cash];
			
			/*
			isbankrobber = true;
			"
			//Bank insurance checking
			if (isnil ""isbankrobber"") then {isbankrobber = false};
			if (!isbankrobber) then
			{
				if(_percentlost > Maxbankrobpercentlost)then{_percentlost == Maxbankrobpercentlost};
				_verlust = round(bnkgeld*_percentlost); 			
				if ((bnkgeld <= _verlust) and (bnkgeld >= 1) and (('bankversicherung' call INV_GetItemAmount) == 0)) then 
				{
					bnkgeld = 0;
					player groupChat localize ""STRS_bank_rob_allmoneylost"";
				};					
				if ((bnkgeld >  _verlust) and (('bankversicherung' call INV_GetItemAmount) == 0)) then 
				{ 
					bnkgeld = bnkgeld - _verlust;
					player groupChat format[localize ""STRS_bank_rob_somemoneylost"", (_verlust call ISSE_str_IntToStr), (bnkgeld call ISSE_str_IntToStr)];
				};														
				if (('bankversicherung' call INV_GetItemAmount) > 0) then 
				{		
					player groupChat localize ""STRS_bank_rob_lostnomoney"";
					['bankversicherung', -(1)] call INV_AddInvItem;				
				};
			};
			" call broadcast;	
			*/
		};
		
		//Checks if the robber is still alive.
		if (!alive player) exitwith
		{
			player groupchat format ["You died! you had to wait %1 seconds longer to complete the job.",_counter];
			server globalchat "The bank robber has died!"; 
			
			"
			if (iscop) then
			{
				titleText [""THE BANK ROBBER HAS BEEN KILLED! YOU'VE RECIEVED $25,000 FROM THE GOVERNMENT. YOU WOULD HAVE RECIEVED MORE IF THE BANK ROBBER WAS TAZED AND ARRESTED."",""PLAIN""];
				bnkgeld = bnkgeld + 25000;
			};
			" call broadcast;
		};
		
		//Check is player has been tazed.
		if ((player getVariable ["isTazed",false])) exitWith
		{
			titleText ["ROBBERY FAILED! YOU WERE TAZED!","PLAIN"];
			" 
			if (iscop) then
			{
				titleText ['BANK ROBBER TAZED! WELL DONE! YOU RECIEVE $50,000','PLAIN'];
				bnkgeld = bnkgeld + 50000;
			};
			" call broadcast;
			server globalchat "The bank robber has been tazed!";
		};
			
		
		if (player distance (getMarkerPos "MAINBAINK") > 28) exitWith
		{
			titleText ["You've left the bank before the cash was ready! Idiot!","PLAIN"];
			"
			if(iscop) then
			{
				titleText [""THE BANK ROBBER HAS FLED THE SCENE! THREAT TO BANK REMOVED."",""PLAIN""];
			};
			" call broadcast;
			server globalchat "The bank robber has fled the bank area!";
		};
		
		//Print a message to robbers screen for info on time left etc
		titleText [format ["ROBBING BANK\nTime Remaining: %1",_counter], "plain down"];
		
		//Print a message to cop side for info on time left etc
		"
		if (iscop) then
		{
			titleText [format [""BANK ROBBERY IN PROGRESS\nTime Remaining: %1"",timeleftforbankrobbery],""plain down""];
		};
		" call broadcast;
		
		_counter = _counter - 1;
		timeleftforbankrobbery = _counter;
		publicVariable "timeleftforbankrobbery";
		sleep 1;
	};
};
