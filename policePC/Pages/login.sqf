/*
[AP] Chewz
Creates the dialog for Police PC login
*/

//policepc_loggedon = true;
//publicvariable "policepc_loggedon"
player groupchat "To Login To The System You Require A username And Password Caps, Spaces And Characters MUST be the same";
sleep 0.5;
player groupchat "Loading Up Island Life Liberation Police Department Computer Login System...";
sleep 0.1;
player groupchat "Please Wait...";
hint format ["Username: %1 \nPassword: CopzRox", name player];
sleep 3;
createdialog "ILG_policepc_login";
