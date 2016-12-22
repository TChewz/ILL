class ILG_policepc_main
{
	idd=501;
	movingEnable=true;

	class controls {
		class ILG_PC_Homepagebackground: RscBackground
		{
			idc = 1800;
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.737344 * safezoneW;
			h = 0.649 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "jonnycool\JonTex\ILG_policepc_backgroundpicturemain.paa";
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.737344 * safezoneW;
			h = 0.649 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			action = "closedialog 0; [0,1,2,[""wantedrelease""]] execVM ""maindialogs.sqf"";";
			idc = 1600;
			text = "Wanted/Prison Release"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			button = "";
			idc = 1601;
			text = "Jail Camera"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0; [0,1,2,[""jailcam""]] execVM ""copcams.sqf"";";

		};
		class RscButton_1602: RscButton
		{
			button = "";
			idc = 1602;
			text = "Satalite Camera"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0; [ [(getPos player select 0), (getPos player select 1), 200] ] execVM ""satcam.sqf"";";

		};
		class RscButton_1603: RscButton
		{
			button = "";
			idc = 1603;
			text = "Crime Log"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0; [0,1,2,[""coplog""]] execVM ""maindialogs.sqf"";";

		};
		class RscButton_1604: RscButton
		{
			button = "";
			idc = 1604;
			text = "Cop Markers [On/Off]"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0; [] execVM ""copmarkers.sqf"";";

		};
		class ILG_PC_reqback: RscButton
		{
			button = "";
			idc = 1605;
			text = "Request Backup"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
		    action = "closedialog 0; [] call Activate_Backup_Button;"";";

		};
		class ILG_PC_logoff: RscButton
		{
			button = "";
			idc = 1609;
			text = "Log Off"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
			action = "execVM ""policePC\pages\logoff.sqf"";";
		};
		class ILG_Toggle_Dispatch: RscButton
		{
			action = "[] execVM ""dispatchsys\wptoggle.sqf"";";
			idc = 1600;
			text = "Toggle Dispatch"; //--- ToDo: Localize;
			x = 0.47 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class ILG_Delete_Waypoints: RscButton
		{
			action = "[] execVM ""dispatchsys\deleteallwp.sqf"";";
			idc = 1600;
			text = "Delete Waypoints"; //--- ToDo: Localize;
			x = 0.47 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};
