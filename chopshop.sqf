/*
	By: [ILG] Jonny
	Filename: chopshop.sqf
	Desc: Finds closest vehicle to NPC and if is in cop car array will sell for cash
	
	Made for Island Life Liberation
*/

Private ["_npc","_copcararray","_dice1","_dice","_money","_rmoney","_nearestobject","_badday","_sold"];
if(isnil "chopshopinuse") then {chopshopinuse = false; publicvariable "chopshopinuse";};
if(chopshopinuse) exitWith {hint "The chop shop is in use! This is to prevent glitching...";};
if (playerside != civilian) exitwith {hint "This is only for civilians to use.";};
chopshopinuse = true; publicvariable "chopshopinuse";
_npc = chopshop1;
_sold = false;
_copcararray = 
[
"MMT_USMC",
"M1030_US_DES_EP1",
"cl_quadcarbonlight",
"ilpd_beat_f101",
"ilpd_slick_b40_npb",
"ilpd_slick_b40_PBG",
"ilpd_slick_b40_pb",
"il_charger_pd",
"ilpd_charger_white",
"tcg_taurus_pb_2",
"tcg_taurus",
"tcg_taurus_wopb",
"suburban_pd","tahoe_pd",
"vil_lublin_AMBU",
"jailbus",
"MMT_USMC",
"cl_quadcarbonlight",
"M1030_US_DES_EP1",
"tcg_hrlycop",
"ilpd_beat_f101_sh",
"pd_cvpi","pd_cvpi_hub",
"ilpd_slick_f220_npb",
"ilpd_slick_f220_PBG",
"tcg_taurus_shpb",
"tcg_taurus_sh",
"suburban_pd_sheriff",
"tahoe_sh",
"il_f350sheriff",
"HMMWV_TOW",
"MH60S",
"ilpd_scu_black",
"ilpd_scu_grey",
"ilpd_scu_maroon",
"suburban_pd_black",
"tcg_suburban_uc_black",
"tcg_suburban_uc_white",
"tcg_suburban_uc_grey",
"tahoe_uc_black",
"tahoe_uc_white",
"ilf350swat",
"il_bearcat",
"HMMWV_Armored",
"MMT_USMC",
"cl_quadcarbonlight",
"Volha_1_TK_CIV_EP1",
"Volha_2_TK_CIV_EP1",
"Car_hatchback",
"LandRover_TK_CIV_EP1",
"civic",
"il_fordcv_taxi",
"tcg_taurus_taxi",
"tcg_taurus_uc",
"tahoe_uc_1_black",
"tahoe_uc_1_grey",
"tahoe_uc_1_blue",
"tahoe_uc_1_green",
"tahoe_uc_1_white",
"tahoe_uc_1_maroon",
"ilpd_unmarked_black",
"ilpd_unmarked_sandstone",
"ilpd_unmarked_maroon",
"ilpd_unmarked_darkblue",
"ilpd_unmarked_grey",
"m5_pd_traffic",
"ilpd_traffic_t101",
"ilpd_Traffic_black",
"ilpd_Traffic_white",
"tcg_suburban_patrol",
"suburban_pd_stealth",
"suburban_pd_k9"
];
_dice1 = random (5000);
_dice = random (45000);
_money = _dice - _dice1;
_rmoney = round _money;
if(_rmoney < 5000) then {_rmoney = 5000; _badday = true;} else {_badday = false;};
_nearestobject = (nearestobjects [getpos player,_copcararray, 15] select 0);
if !(_nearestobject isKindOf "car") exitWith {hint "Jesus fuck! We're not rich! We can ony buy your cars..."};
if(_nearestobject distance _npc > 20) exitWith {hint "no vehicle in range";};
if(alive _nearestobject) then 
{
	_sold = true;
	hint "Vehicle Found, Selling..";
	sleep 2;
	deleteVehicle _nearestobject;
	['Mishy',_rmoney] call INV_AddInventoryItem;
	if (_badday) then
	{
		hint format ["You sold this cop vehicle for $15000. The dealer is in a bad mood! The type of vehicle is no factor in how much money is earned"];
	}
	else
	{
		hint format ["You sold this cop vehicle for $%1. The type of car is no factor in this price, simply how the vendor is feeling today!",_rmoney];
	};
	format [" if(!(""Chop Shopping"" in %1_reason))then{%1_reason = %1_reason + [""Chop Shopping""]}; %1_wanted = 0; kopfMishy_%1 = kopfMishy_%1 + 15000; ",name player] call broadcast;
	}
else
{
	hint "Vehicle alive?";
};
if (!_sold) exitWith {hint "The vehicle wasn't found. Try moving it a little closer.";chopshopinuse = false; publicvariable "chopshopinuse";};
chopshopinuse = false; publicvariable "chopshopinuse";