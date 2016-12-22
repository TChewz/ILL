/*
Author: [ILG] Chewz
Desc: Accepts the login and excutes a couple of stuff
*/
if (playerside == WEST) then
{
	playsound "accessgranted"; // plays accessgranted soundfile
	sleep 5; // waits until the found has finished
	closedialog 10; // closes login dialog
	waitUntil {isnull (findDisplay 10)}; // checks if closed
	sleep 0.1;
	player Sidechat format ["Welcome To The Emita PD Computer System, Officer %1", name player];
	sleep 0.5;
	player sidechat "Please Hold While We Collect The Infomation From Our Police Database...";
	sleep 1;
	player sidechat "Please Wait 5 Seconds...";
	sleep 1;
	player sidechat "Please Wait 4 Seconds...";
	sleep 1;
	player sidechat "Please Wait 3 Seconds...";
	sleep 1;
	player sidechat "Please Wait 2 Seconds...";
	sleep 1;
	player sidechat "Please Wait 1 Second...";
	sleep 1;
	createdialog "ILG_policepc_main"; // opens main menu
	waitUntil {!isnull (findDisplay 501)}; //error checking and wait until the main menu is opened then prcceeds (501 needs to be idd  number.) 
	player sidechat format ["You have successfully logged into the police computer, Officer %1", name player];
	waituntil {isnull (501)};// waits until the player closes the main menu dialog
	//policepc_loggedon = true;
	//publicvariable "policepc_loggedon"
	hint format ["Username: %1 \nPassword: CopzRox", name player];
};

if (playerside == CIVILIAN) then
{
	playsound "accessdenied";
	sleep 5;
	closedialog 10;
	waituntil {isnull (findDisplay 10)};
	sleep 0.1;
	player sidechat format ["Hello %1,you cannot access the computer system as civilian. As this device is new, The hackers Of Emita Need To Develop A Special Hacking Tool, This Will Be Released In The Following Days/Weeks", name player];
};	
/*
if (playerside == CIVILIAN && policepc_loggedon) then
{
	playsound "accessgranted"
	sleep 5;
	createdialog "ILG_policepc_main";
	sleep 0.1;
	player sidechat format ["Hello %1, You were able to access the police computer system... here you have access to the police computer..", name player];
};	
*/

if (playerside == INDEPENDENT) then
{
	playsound "accessdenied";
	sleep 5;
	closedialog 10;
	waituntil {isnull (findDisplay 10)};
	sleep 0.1;
	player sidechat format ["Your ESU and your trying to access the Police computer system... good try buddy!", name player];
};