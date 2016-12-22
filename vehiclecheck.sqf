_arr = _this select 0;
_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);
_vclTune = _vcl getVariable "tuning";
_vclAlarm = _vcl getVariable "Car_Alarm";
if (not(isNil "_arr")) then {_arr = call compile _arr;} else {_arr = [];};
if (!(createDialog "INV_list")) exitWith {hint "Dialog Error!";};
lbAdd [1, "Items in the Storage:"];
lbAdd [1, "---------------------"];

switch _vclTune do
{
	case 1:{lbAdd [1, "Speed Upgrade 1 (Tuned)"];};
	case 2:{lbAdd [1, "Speed Upgrade 2 (Tuned)"];};
	case 3:{lbAdd [1, "Speed Upgrade 3 (Tuned)"];};
	case 4:{lbAdd [1, "Speed Upgrade 4 (Tuned) (Illegal)"];};
	case 5:{lbAdd [1, "Speed Upgrade 5 (Tuned) (Illegal)"];};
};

if (_vclAlarm) then {lbAdd [1, "This vehicle has a car alarm installed"];};

for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do 

{

_item        = (_arr select _i) select 0;
_anzahl      = (_arr select _i) select 1;
_anzeigename = _item call INV_getitemName;

if (_anzahl > 0) then 

	{	

	lbAdd [1, format ["%1 - %2x", _anzeigename, _anzahl]];

	};

};

