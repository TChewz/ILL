//By Jon

waitUntil {isNull (findDisplay 63)};
uiSleep (0.5);
setViewDistance 800;
titleText["","black in"];
playSound "Black";
Spawn_Cam_ = "CAMERA" camCreate [2416.26,5360.43,80];
Spawn_Cam_ cameraEffect ["Internal","Back"];
Spawn_Cam_ camSetTarget (jonfocus);
[] spawn
{
	uisleep 4;
	titleText[format["Welcome To Island Life Liberation\nislandlifeliberation.net"],"plain"];
	uisleep 4;
	titleText[format["You must be on Teamspeak3\nILL.TS3PRO.COM"],"plain"];
	uisleep 4;
	titleText["Have fun!","plain"];
};
Spawn_Cam_ camSetPos [2249.83,4758.37,50];
Spawn_Cam_ camCommit 5;
Spawn_Cam_ camSetFOV .70;
Spawn_Cam_ camSetFocus [50, 0];
showCinemaBorder false;
waitUntil {camCommitted Spawn_Cam_};
Spawn_Cam_ camSetPos [2266.49,4420.49,70];
Spawn_Cam_ camCommit 7;
waitUntil {camCommitted Spawn_Cam_};
Spawn_Cam_ camSetPos [2150.99,3796.82,60];
Spawn_Cam_ camCommit 7;

waitUntil {camCommitted Spawn_Cam_};
Spawn_Cam_ cameraEffect ["TERMINATE","BACK"];
camDestroy Spawn_Cam_;
intro_Ran = true;
titleText ["","black in"];
