_coparrest = (nearestobjects [getpos cop1, ["tcg_police_officerk9","tcg_police_officer","FOX_US_SFMRW_OFFD","policeman","vilas_sira_sheriffoff","VIL_ctl_policeman_rd","vilas_sira_swat_m416","VIL_ctl_policeman","KPFS_Policeman_vest_des","KPFS_Policeman_vest_des_cap"], 3] select 1);

if (isNil "_coparrest") exitwith {};

if((animationstate _coparrest == "ILG_Restrain_Anim") and (player distance prisonflag <= 75)) then

{

player groupchat format["Arresting %1!", _coparrest];
(format ["%1 switchmove ""%2"";", player, "normal"]) call broadcast;
_coparrest setVariable ["restrained",false,true];
_coparrest setVariable ["RestrainedBy", -1, true];
_coparrest setPos getPos CopPrison;
format ["if (player == %1) then {[""arrestcop"", %2, %3] execVM ""civmenu.sqf"";};", _coparrest, 300, player] call broadcast;

}

else

{
player groupchat "You are not close enough to the jail or they are not restrained";
};

