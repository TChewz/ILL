#include "policePC\dialog\login.hpp";

_username = name player;
_password = "CopzRox";

if (ctrltext ((ctrlParent (_this select 0)) displayCtrl 6) = _password && ctrltext ((ctrlParent (_this select 0)) displayCtrl 4) == _username) then
{
	execVM "policePC\loginaccepted.sqf";
}
else
{
	execVM "policePC\loginfailed.sqf";
};
