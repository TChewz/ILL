_art = (_this select 3) select 0;
if(cracking)exitwith{player groupchat "You are already cracking a safe!"};
cracking = true;

if (triggeractivated trg1) then 
{
(format ["%1 switchmove ""%2"";", player, "UnaErc_UnaErcPoslechVelitele"]) call broadcast;
sleep 5;
	if (_art == "safe1") then 
	{
	if (playersNumber west < 4) exitwith {player groupchat "There must be at least 4 cops online to rob this!"};
	(format ["%1 switchmove ""%2"";", player, "repairingkneel"]) call broadcast;
	('if(iscop) then {playsound "alarm1";}') call broadcast;
	(format ['server globalChat "A camera at the bank has seen someone cracking the safe!";']) call broadcast;
	
	(format['if(!("Attempted Bank Robbery" in %1_reason))then{%1_reason = %1_reason + ["Attempted Bank Robbery"]}; %1_wanted = 1; kopfMishy_%1 = kopfMishy_%1 + 0;', player]) call broadcast;
	
	sleep 15;
		if ((random 50) < 40) then 
		{
		(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
		player groupChat "You cracked the safe.";
		
		(format['if(!("Bank Robbery" in %1_reason))then{%1_reason = %1_reason + ["Bank Robbery"]}; %1_wanted = 1; kopfMishy_%1 = kopfMishy_%1 + 50000;', player]) call broadcast;
		
		cracking = false;
		Playsound "Unlock";
		Safecracked1 = TRUE;
		Sleep 60;
		Safecracked1 = FALSE;
		}
		else
		{
		(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
		player groupChat "You failed to crack the safe! Try Again.";
		cracking = false;
		};
	cracking = false;
	};
};
if (triggeractivated trg2) then
{
(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
player groupChat "You need a bigger Team to rob the bank!";
cracking = false;
};
/*
if (_art == "safe2") then 
{
(format ["%1 switchmove ""%2"";", player, "repairingkneel"]) call broadcast;
sleep 5;
	if ((random 100) < 40) then 
	{
	(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
	player groupChat "You cracked the safe";
	cracking = false;
	Playsound "Unlock";
	Safecracked2 = TRUE;
	}
	else
	{
	(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
	player groupChat "You did not crack the safe, try again";
	cracking = false;
	};
cracking = false;
};

if (_art == "safe3") then 

{
(format ["%1 switchmove ""%2"";", player, "repairingkneel"]) call broadcast;
sleep 5;
	if ((random 100) < 40) then 
	{
	(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
	player groupChat "You cracked the safe";
	cracking = false;
	Playsound "Unlock";
	Safecracked3 = TRUE;
	}
	else
	{
	(format ["%1 switchmove ""%2"";", player, ""]) call broadcast;
	player groupChat "You did not crack the safe, try again";
	cracking = false;
	};
cracking = false;
};
*/