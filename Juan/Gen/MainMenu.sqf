	mainMenuDLG =
	{
		createDialog "Jon_MainMenu";
		buttonSetAction [1205,"closeDialog 0;"];
		buttonSetAction [1701,"[] call playerInformationDLG;"];//Player Information Button
		buttonSetAction [1702,"[] call playerLicenseDLG;"];//Player License Button
		buttonSetAction [1703,"[] call governorDLG;"];//Governor Information Button
		buttonSetAction [1704,"[] call playerInventoryDLG;"];//Player inventory Button
		buttonSetAction [1705,"[] call MafGangDLG;"];//Gang Button
		buttonSetAction [1706,"[] call playerSettingsDLG;"];//Player settings Button
	};

	playerMenuDLG =
	{
		private ["_x","_i","_Pic"];
		createDialog "Jon_ThemedList";
		ctrlSetText [1000,format["Player List | %1 Online",pub_playercount]];
		_i = lbAdd [1500,format["Civilians (%1 Online):",pub_civcount]];
		lbSetColor [1500,_i,[0,1,1,1]];
		{
			if ((_x call ISSE_UnitExists) && (isPlayer _x)) then
			{
				_i = lbAdd [1500,format["%1 - %2",_x,name _x]];
				if ((call compile format ["%1_wanted",_x]) == 1) then {lbSetColor [1500,_i,[1,0,0,1]]};
				_Pic = getText (configFile >> "CfgVehicles" >> (typeOf (_x)) >> "portrait");
				lbSetPicture [1500,_i,_Pic];
			};

		}count (civarray - esuslots);
		_i = lbAdd [1500,format["Emergency Service Unit (%1 Online):",pub_esucount]];
		lbSetColor [1500,_i,[0,1,1,1]];
		{
			if ((_x call ISSE_UnitExists) && (isPlayer _x)) then
			{
				_i = lbAdd [1500,format["%1 - %2",_x,name _x]];
				_Pic = getText (configFile >> "CfgVehicles" >> (typeOf (_x)) >> "portrait");
				lbSetPicture [1500,_i,_Pic];
				lbSetColor [1500,_i,[1,1,0,1]]
			};

		}count esuslots;
		_i = lbAdd [1500,format["Police Department (%1 Online):",pub_copcount]];
		lbSetColor [1500,_i,[0,1,1,1]];
		{
			if ((_x call ISSE_UnitExists) && (isPlayer _x)) then
			{
				_i = lbAdd [1500,format["%1 - %2",_x,name _x]];
				_Pic = getText (configFile >> "CfgVehicles" >> (typeOf (_x)) >> "portrait");
				lbSetPicture [1500,_i,_Pic];
				lbSetColor [1500,_i,[0,0,0.7,1]]
			};

		}count coparray;
		lbAdd [1500,""];
	};

	playerInformationDLG =
	{
		private ["_mins","_hours","_wanted","_i"];
		createDialog "Jon_ThemedList";
		buttonSetAction [1205,"closeDialog 0;"];
		ctrlSetText [1000,format["%1's Information",name player]];
		lbAdd [1500, format["Date:     %3.%2.%1", (date select 0), (date select 1), (date select 2)]];
		_mins = floor (time/60);
		_hours = 0;
		if (_mins >= 60) then {_hours = floor (_mins/60); _mins = _mins - (_hours * 60);};
		lbAdd [1500, format ["Runtime: %1 Hours %2 Minutes",_hours,_mins]];
		lbAdd [1500, format ["Money: $%2", localize "STRS_statdialog_health", (('Mishy' call INV_GetItemAmount) call ISSE_str_IntToStr)]];
		lbAdd [1500, format ["Savings: $%2", localize "STRS_statdialog_health", bnkgeld call ISSE_str_IntToStr]];
		if (isCiv && !(player in esuslots)) then
		{
			_wanted = (call compile(format["%1_wanted",player]));
			if (_wanted == 1) then //Wanted
			{
				_i = lbAdd [1500,"You're wanted for the following reasons:"];
				lbSetColor [1500,_i,[0.9,0.1,0,1]];
				_reasons = call compile(format["%1_reason",player]);
				_str = "";
				_amountOfCrimes = count (_reasons);
				_i = 0;
				{
					_i = _i + 1;
					if (_i == _amountOfCrimes) then
					{
						_str = _str + (format["%1",_x]);
					}
					else
					{
						_str = _str + (format["%1, ",_x]);
					};
				}count _reasons;
				_i = lbAdd [1500,_str];
				lbSetColor [1500,_i,[0.9,0.1,0,1]];
			}else{lbAdd[1500,"You are not wanted."];};
			if (isNil "_wanted") then {lbAdd[1500,"You are not wanted."];};
		};
		lbAdd [1500, format ["Whitelist UID: %1",(getplayeruid player)]];
		if (isciv && !(player in esuslots)) then {lbAdd [1500, (format ["Street Reputation:  %1", streetrep])]};
		lbAdd [1500, format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_Tragfaehigkeit]];
		lbAdd [1500, format ["%1: %2",    localize "STRS_statdialog_copkills", CopsKilled]];
		lbAdd [1500, format ["%1: %2",    localize "STRS_statdialog_civkills", CivsKilled]];
		lbAdd [1500, format ["%1: %2",    localize "STRS_statdialog_selfkills", SelfKilled]];
		lbAdd [1500, format ["%1: %2",    localize "STRS_statdialog_deaths", deadtimes]];
		lbAdd [1500, format ["%1: %2 seconds",    "Respawn time", round(DeadWaitSec+extradeadtime)]];
		if(isciv && !(player in esuslots))then{lbAdd [1500, format ["%1: %2",    "Demerit points", demerits]]};
		lbAdd [1500, format["Oil Barrel Trader: %1",(((tankencost - 100)/200)*100)]];
		lbAdd [1500, format ["Players: 	%1",pub_playercount]];
		lbAdd [1500,""];
	};

	playerLicenseDLG =
	{
		private ["_anylicenses"];
		createDialog "Jon_ThemedList";
		_anylicenses = false;
		ctrlSetText [1000,format["%1's Licenses",name player]];
		{
			_anylicenses = true;
			lbAdd [1500,(_x call getLicenseDispName)];
		}forEach INV_LizenzOwner;
		if (!_anylicenses) then {lbAdd [1500,"You have no licenses."]};
		lbAdd [1500,""];
	};

	governorDLG =
	{
		private ["_i"];
		createDialog "Jon_ThemedList";
		ctrlSetText [1000,"Government Information"];
		if (not(MayorNumber == -1)) then
		{
			 lbAdd [1500, format["Governor: %1",(playerstringarray select MayorNumber)]];
			 lbAdd [1500, name(call compile(playerstringarray select MayorNumber))];
		} else {lbAdd [1500,"There is currently no elected governor."]};

		if (ILG_Voting_Enable) then{lbAdd [1500, "Governor Elections are open."]}
		else{lbAdd [1500, "Governor Elections are closed."]};

		lbAdd [1500,""];
		lbAdd [1500,"Laws."];
		_i = 0;
		{
			if (not(_x == "")) then
			{
				_i = _i + 1;
				lbAdd [1500, (format ["%1: %2", _i, _x])]
			};
		}
		forEach GesetzArray;
		lbAdd [1500,""];
		lbAdd [1500,"Taxes."];
		{
			lbAdd [1500, format["%1: %2%3", (_x select 1), (_x select 2),"%"]];
		}
		foreach INV_ItemTypenArray;
		lbAdd [1500,format["Bank Transfer: %1%2",bank_steuer,"%"]];
		lbAdd [1500,""];
	};

	playerInventoryDLG =
	{
		disableSerialization;
		private [];
		createDialog "Jon_PInventory";
		_item_info = (uiNamespace getVariable "jon_inventorymenu") displayCtrl 1100;
		_item_info_add = (uiNamespace getVariable "jon_inventorymenu") displayCtrl 1101;
		buttonSetAction [1600,"['use',  lbData [1500, (lbCurSel 1500)], ctrlText 1339, lbData [2100, (lbCurSel 2100)]] execVM 'INVactions.sqf';"];
		buttonSetAction [1601,"['drop', lbData [1500, (lbCurSel 1500)], ctrlText 1339, lbData [2100, (lbCurSel 2100)]] execVM 'INVactions.sqf';"];
		buttonSetAction [1602,"['give', lbData [1500, (lbCurSel 1500)], ctrlText 1339, lbData [2100, (lbCurSel 2100)]] execVM 'INVactions.sqf';"];
		ctrlSetText [1339,"1"];
		{
			if ((_x select 1) > 0) then
			{
				_item = (_x select 0);
				_index = lbAdd [1500,(_x select 0) call INV_getitemName];
				lbSetData [1500,_index,_item];
			};
		}foreach INV_InventarArray;
		for [{_c=0}, {_c < (count INV_PLAYERSTRINGLIST)}, {_c=_c+1}] do
		{

			_spieler = INV_PLAYERSTRINGLIST select _c;
			_unitVarname = (call compile _spieler);
			if (_spieler call ISSE_UnitExists && (player distance _unitVarname < 5)) then
			{
				_index = lbAdd [2100, format ["%1 - (%2)", _spieler, name _unitVarname]];
				lbSetData [2100, _index, format["%1", _c]];
				if (player == _unitVarname) then {lbSetColor [2100,_index,[0, 1, 0, 0.5]];};
				lbSetColor [2100,_index,[0, 0.7, 0.5, 0.5]];
			};
		};

		lbSetCurSel [2100, 0];
		lbSetCurSel [1500, 0];

		[_item_info,_item_info_add] spawn
		{
			while {ctrlVisible 1339} do
			{
				_item   = lbData [1500, (lbCurSel 1500)];
				_amount = _item  call INV_GetItemAmount;
				_array  = _item call INV_getitemArray;
				(_this select 0) ctrlSetStructuredText parseText format["%1",_array call INV_getitemDescription2];//Long Description
				_newStr = format["<t size='0.9'>Item: %1<br/>Amount: %2<br/>Item Weight: %3<br/>Total Weight: %4",_array call INV_getitemName,(_amount call ISSE_str_IntToStr),(_array call INV_getitemTypeKg),(((_array call INV_getitemTypeKg)*(_amount)) call ISSE_str_IntToStr)];
				(_this select 1) ctrlSetStructuredText parseText _newStr;

				uiSleep 0.1;
			};
		};
	};

	playerSettingsDLG =
	{
		private [];
		createDialog "Jon_SettingsMenu";
		buttonSetAction [1600,"[] call settingsSaveButton;"];

		{
			_ind = lbAdd [1500,_x select 0];
			lbSetData [1500,_ind,_x select 1];
		}foreach [
			["ILG Phone Action","ilgphone"],
			["GUI","gui"],
			["View Distance","vdis"]
		];
		lbSetCurSel [1500, 0];

		[] spawn
		{
			while {ctrlVisible 762} do
			{
				resetSettingDLG = false;
				_setting = lbData [1500, (lbCurSel 1500)];
				lbClear 762;
				_toAdd = [];
				switch (_setting) do
				{
					case "ilgphone":
					{
						_toAdd = [
							["Yes","yes"],
							["No","no"]
						];
					};

					case "gui":
					{
						_toAdd = [
							["Modern","mod"],
							["Old","old"]
						];
					};

					case "vdis":
					{
						_toAdd = [
							["100","100"],
							["200","200"],
							["300","300"],
							["400","400"],
							["500","500"],
							["750","750"],
							["1000","1000"],
							["1250","1250"],
							["1500","1500"],
							["2000","2000"],
							["2500","2500"],
							["3000","3000"],
							["4000","4000"],
							["5000","5000"]
						];

					};
				};

				{
					_ind = lbAdd [762,_x select 0];
					lbSetData [762,_ind,_x select 1];
				}foreach _toAdd;

				waitUntil {_setting != (lbData [1500, (lbCurSel 1500)]) || resetSettingDLG};
			};
		};
	};

	settingsSaveButton =
	{
		private ["_setting","_option","_settingEdited"];

		_setting = lbData [1500, (lbCurSel 1500)];
		_option = lbData [762, (lbCurSel 762)];
		_settingEdited = true;
		switch (_setting) do
		{
			case "ilgphone":
			{
				switch (_option) do
				{
					case "yes":{ILG_Phone_Action_Enable = true};
					case "no":{ILG_Phone_Action_Enable = false};
					default {_settingEdited = false};
				};
			};
			case "gui":
			{
				switch (_option) do
				{
					case "mod":{HUD = "modern"};
					case "old":{HUD = "classic"};
					default {_settingEdited = false};
				};
			};
			case "vdis":
			{
				if (isNil "_option") then {_settingEdited = false}
				else {
					GFX_ArmaViewDistance = call compile(_option);
					setViewDistance GFX_ArmaViewDistance;
				};
			};
		};
		if (!_settingEdited) exitWith {systemchat "No changes made."};
		lbClear 762;
		_lb = lbAdd [762,"Settings Saved."];
		lbSetColor [762,_lb,[0,1,0.16470588235294117,1]];
		lbSetData [762,_lb,"debug"];
		lbSetCurSel [762,0];
		[] spawn
		{
			sleep 1;
			if ((lbData [762, (lbCurSel 762)]) == "debug") then
			{
				resetSettingDLG = true;
			};
		};
	};

	MafGangDLG =
	{
		[] spawn
		{
			private [];
			createDialog "Jon_MafiaGangMenu";
			buttonSetAction [1600,"execVM 'Juan\Civs\Gangs\mainFunction.sqf';"];
			ctrlSetText [1000,"Gang and Mafia Information"];
			//ctrlEnable [1600,false];
			//if (isciv && !(player in esuslots)) then {ctrlEnable [1600,true]};
			lbAdd [1500, "Mafia Members:"];
			{lbAdd [1500,_x];}foreach pub_maflist;
			if ((count (pub_maflist)) == 0) then {lbAdd [1500,"No mafia members online."]};
			lbAdd [1500,""];
		};
	};
