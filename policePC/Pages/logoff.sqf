/*
author: [ILG] Chewz
Desc: Logs off system
*/

//policepc_loggedon = false;
//publicvariable "policepc_loggedon"
player sidechat "Please wait while we log you off the system...";
sleep 1;
player sidechat "Logging Off...";
sleep 3;
closedialog 0;
createdialog "ILG_policepc_login";
