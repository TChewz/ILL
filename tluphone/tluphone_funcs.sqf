
TLU_OpenMobilePhone = {
	if (TLU_MOBILEPHONE_DISABLED) exitWith {player groupChat "Your phone has been disabled";};
	
	createDialog "TLUPhone";
	
	if ( (!isciv) && (!TLU_Debug911) ) then {
		ctrlEnable [1201, false];
		ctrlEnable [1601, false];
		ctrlShow [1201, false];
		ctrlShow [1601, false];
	};
};

TLU_MobilePhone_CallEmerg = {
	[] spawn ILG_Open911CivMenu;
};

TLU_MobilePhone_GOSMS = {
	call interact_mobile_use;
};

TLU_MobilePhone_PMCContracts = {
	call TLU_cl_PMCContractsMain_OpenMenu;
};

if (isNil "TLU_MOBILEPHONE_INITED") then {
	TLU_MOBILEPHONE_DISABLED = false;
	TLU_MOBILEPHONE_INITED = true;
};