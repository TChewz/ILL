/*
author: [ILG] Chewz
Desc: If Login Fails then proceeds
*/

if (playerside == WEST) then
{
	playsound "accessdenied"
	player sidechat format ["Login Failed! Please Try Again..."];
	sleep 1;
	player sidechat "Please Re-enter the usename and password";
	hint format ["Username: %1 \nPassword: CopzRox", name player];
};

if (playerside == CIVILIAN) then
{
	playsound "accessdenied"
	player sidechat format ["Login Failed! Please Try Again..."];
	sleep 1;
	closedialog 10;
};

if (playerside == INDEPENDENT) then
{
	playsound "accessdenied"
	player sidechat format ["Your ESU... Dont Even Try..."];
	sleep 1;
	closedialog 10;
};