class ILG_policepc_login
{	
	idd=10;
	movingEnable=true;
	
	class controls {
		class ILG_PC_loginbackground: RscBackground  
		{
			idc = 1;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,1};
			colorBackgroundActive[] = {0.5,0.5,0.5,1};
		};
		class ILG_PC_usernametext: RscText
		{
			idc = 3;
			text = "Username:"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx=0.03
		};
		class ILG_PC_usernamebox: RscEdit
		{
			idc = 4;
			text = "Type Your Name Here"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx=0.03
		};
		class ILG_PC_passwordtext: RscText
		{
			idc = 5;
			text = "Password:"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx=0.03
		};
		class ILG_PC_passwordbox: RscEdit
		{
			idc = 6;
			text = "Type Your Password Here"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx=0.03
		};
		class ILG_PC_loginbutton: RscButton
		{
			idc = 7;
			text = "Login"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
			action = "execVM ""policePC\loginaccepted.sqf"";";

		};
		class ILG_PC_closebutton: RscButton
		{
			idc = 8;
			text = "Close"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
			action="closedialog 0;";
		};
		class ILG_PC_maintext: RscText
		{
			idc = 9;
			text = "Island Life Liberation PD Computer System"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx=0.03
		};
	};
};