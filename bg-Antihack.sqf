/*****************************************************\
/*Antihack + Logs*************\
/*A2L.enjin.com****************************************\
/*****************************************************\
_Kick
_Hacker
_Nothacking
_Disable
_A2L
_Admin
/////////////////////////////////////////////////////////////
This _Disable "Loky_lost_key.pbo", This set logs "A2L-Log.sqf",
This _Disable "Prodayz", This set logs "A2L-log.sqf",
This Send all Log "A2L-log.sqf",
_A2L _Nothacking hint "Welcome Thanks for not using Hacks",
_A2L _Hacker hint "Clearly you're an idiot as our Anti-Hack has picked you up!",
_Kick this Kick if Sign False;
_Kick Globalchat "%1 Got kicked for hacking report this to an Admin!",
}
//Welcome to Admins
{
	If _Admin Hint "Welcome to Island Life Liberation, Admin",
	If _Admin Hint "Welcome Jeff or Kraken, you're an admin!",
}
//wen an admin are checking logs
{
	If _Admin "A2L-Log.sqf", Then Hint "You are now checking the logs",
	On _Hacker "A2L-Log.sqf", Then _Admin hint "%1 Are hacking ban him now and tell someone about this!",
	If no _Hacker "A2L-Log.sqf", Then _Admin hint "No hackers are online that's good!",
}
//DO NOT EDIT!
{
	-1
	-3
	-9
	+750
	+750
	_Kick if KeyPress Leftshift + P
}
//Player ID for Admins
{
	Admin_uid ["10009286"];
}




	





