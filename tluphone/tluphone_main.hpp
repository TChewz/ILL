class TLUPhone {
		name=TLUPhone;
		idd = -1;
		movingEnable = true;
		controlsBackground[] = {  TLUPhone_BackgroundPhoneText };
		objects[] = { };
		controls[] = { TLUPhone_SMSPress, TLUPhone_SMSApp, TLUPhone_911App, TLUPhone_Call911Press, TLUPhone_ESUApp,	TLUPhone_CallESUPress};

	class TLUPhone_BackgroundPhoneText: RscPicture
	{
		moving = 1;
		type = CT_STATIC;
		style = ST_PICTURE;

		idc = 1200;
		text = "tluphone\tluphone.paa";
		x = 0.41392 * safezoneW + safezoneX;
		y = 0.296388 * safezoneH + safezoneY;
		w = 0.152237 * safezoneW;
		h = 0.533038 * safezoneH;
	};

	class TLUPhone_911App: RscPicture
	{
		idc = 1201;
		text = "tluphone\911App.paa";
		x = 0.495853 * safezoneW + safezoneX;
		y = 0.455761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
	};

	class TLUPhone_Call911Press : TLUPhoneApp_RscButton
	{
		action = "call TLU_MobilePhone_CallEmerg;";

		idc = 1601;
		x = 0.495853 * safezoneW + safezoneX;
		y = 0.455761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
	};

	class TLUPhone_SMSPress : TLUPhoneApp_RscButton
	{
		action = "call TLU_MobilePhone_GOSMS;";

		idc = 1602;
		x = 0.457553 * safezoneW + safezoneX;
		y = 0.449761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
	};
	class TLUPhone_SMSApp: RscPicture
	{
		idc = 1202;
		text = "tluphone\SMSApp.paa";
		x = 0.457553 * safezoneW + safezoneX;
		y = 0.449761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
	};

	class TLUPhone_ESUApp: RscPicture
	{
		idc = 1201;
		text = "tluphone\Call_EMS.paa";
		x = 0.457553 * safezoneW + safezoneX;
		y = 0.525761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
	};

	class TLUPhone_CallESUPress : TLUPhoneApp_RscButton
	{
		action = "closeDialog 0; [] call Call_ESU;";

		idc = 1601;
		x = 0.457553 * safezoneW + safezoneX;
		y = 0.525761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
	};
	/*
	class TLUPhone_ESUApp: RscPicture
	{
		idc = 1201;
		text = "";
		x = 0.437553 * safezoneW + safezoneX;
		y = 0.525761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
	};

	class TLUPhone_CallESUPress : TLUPhoneApp_RscButton
	{
		action = "";

		idc = 1601;
		x = 0.437553 * safezoneW + safezoneX;
		y = 0.525761 * safezoneH + safezoneY;
		w = 0.0322234 * safezoneW;
		h = 0.0549937 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {1,1,1,1};
		colorBackgroundActive[] = {0,0,0,0};
	};*/
};
