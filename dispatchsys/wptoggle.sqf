_var = player getVariable "wpavalible";

if (_var) then
{
	player setVariable ["wpavalible",false,true];
	player groupchat "Logged out from dispatch.";
}
else
{
	player setVariable ["wpavalible",true,true];
	player groupchat "Logged back into dispatch";
};
