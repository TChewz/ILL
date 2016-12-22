if (!isciv) exitWith {};
while {true} do
{
	waitUntil {ismayor};
	thereIsaMayor = (rolenumber - 1);
	publicVariable "thereIsaMayor";
	sleep 2;
	removeAllWeapons player;
	["LIN_ElPresidente"] call clothes_gov;

	player sideChat "Congratulations on your victory Governor! Here is your new Golden AK-47 and Desert Eagle.";
	player sideChat "You now have the option to rule democraticly or become a dictator feared by your own people .";
	
	
	
	player addWeapon "RH_aks47g";
	player addWeapon "RH_Deagleg";
	
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "RH_7Rnd_50_AE";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	player addMagazine "30Rnd_762x39_AK47";
	
	waitUntil {!ismayor OR !alive player};
	ILG_Voting_Enable = true;
	publicVariable "ILG_Voting_Enable";
	if (isnil "badgov") then {badgov = false;};
	if (badgov) then
	{	
		"server globalchat ""THE GOVERNOR IS DEAD! EMITA IS NO LONGER A LEAD BY A DICTATOR! ELECTIONS ARE RE-OPENED!"";" call broadcast;
		"server globalchat ""THE GOVERNOR IS DEAD! EMITA IS NO LONGER A LEAD BY A DICTATOR! ELECTIONS ARE RE-OPENED!"";" call broadcast;
		"server globalchat ""THE GOVERNOR IS DEAD! EMITA IS NO LONGER A LEAD BY A DICTATOR! ELECTIONS ARE RE-OPENED!"";" call broadcast;
	}
	else
	{
		"server globalchat ""THE GOVERNOR HAS DIED!"";" call broadcast;
		"server globalchat ""THE GOVERNOR HAS DIED!"";" call broadcast;
		"server globalchat ""THE GOVERNOR HAS DIED!"";" call broadcast;
	};

	//Reset Taxes and laws
	format ['
	(INV_ItemTypenArray select 0) SET [2, 5]; 
	(INV_ItemTypenArray select 1) SET [2, 5]; 
	(INV_ItemTypenArray select 2) SET [2, 5]; 
	(INV_ItemTypenArray select 3) SET [2, 5];						
	bank_steuer = 5; 
	GesetzArray SET [0,"Always Drive on the RIGHT side of the road."];
	GesetzArray SET [1,"Always Holster weapons in Towns."];
	GesetzArray SET [2,"Speed limits 60 in town 90 out."];
	GesetzArray SET [3,"Governor and Gaurds May have any weapon unlicensed."];
	GesetzArray SET [4,"Governor is immune to traffic laws."];
	GesetzArray SET [5,""];
	GesetzArray SET [6,""];
	GesetzArray SET [7,""];
	GesetzArray SET [8,""];
	GesetzArray SET [9,""];
	GesetzArray SET [10,""];
	GesetzArray SET [11,""];
	GesetzArray SET [12,""];
	GesetzArray SET [13,""];
	GesetzArray SET [14,""];
	GesetzArray SET [15,""];
	'] call broadcast;
		
	player sidechat "You're no longer the Governor because you died.";
	mayorPayAtGov = 0;
	
	waitUntil {alive player};
	MayorNumber = -1;
	thereIsaMayor = nil;
	PUBLICVARIABLE "MayorNumber";
	false call TurnMayorFunc;
	INV_LizenzOwner = INV_LizenzOwner - ["mayorlic"];
	format["civ%1_mayor = 0;", player] call broadcast;
	removeAllWeapons player;
	["CITIZEN4"] call clothes_gov;
	
};
	