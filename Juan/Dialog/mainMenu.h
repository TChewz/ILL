class Jon_MainMenu
{
	idd = 9087;
	movingEnable = true;
	controlsBackground[] = {Body_background,Header};
	objects[] = {};
	controls[] = {
		exit_button,
		exit_button_cover,
		But1,
		But2,
		But3,
		But4,
		But5,
		But6,
		But1_cover,
		But2_cover,
		But3_cover,
		But4_cover,
		But5_cover,
		But6_cover
	};

	class Body_background: ILG_RscText
	{
		idc = 1000;
		//[0.09375,0.15,0.8125,0.6]
		x = 0.09375;
		y = 0.15;
		w = 0.8125;
		h = 0.6;
		colorBackground[] = {0,0,0,0.9};
	};
	class Header: ILG_RscText
	{
		//[0.09375,0.1,0.8125,0.05]
		moving = 1;
		idc = 1001;
		text = "Main Menu";
		x = 0.09375;
		y = 0.1;
		w = 0.8125;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class exit_button: ILG_RscPicture
	{
		//[0.874752,0.108201,0.0255953,0.0351852]
		idc = 1200;
		text = "jonnycool\JonTex\Cross.paa";
		x = 0.874752;
		y = 0.108201;
		w = 0.0255953;
		h = 0.0351852;
	};
	class exit_button_cover: TLUPhoneApp_RscButton
	{
		action = "closeDialog 0;";
		idc = 1205;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		x = 0.874752;
		y = 0.108201;
		w = 0.0255953;
		h = 0.0351852;
	};
	class But1: ILG_RscPicture
	{
		text = "jonnycool\JonTex\player-icon.paa";
		idc = 1601;
		x = 0.15625;
		y = 0.2;
		w = 0.15625;
		h = 0.2;
	};
	class But1_cover: TLUPhoneApp_RscButton
	{
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		idc = 1701;
		x = 0.15625;
		y = 0.2;
		w = 0.15625;
		h = 0.2;
	};
	class But2: ILG_RscPicture
	{
		text = "jonnycool\JonTex\inventory.paa";
		idc = 1603;
		x = 0.421875;
		y = 0.2;
		w = 0.15625;
		h = 0.2;
	};
	class But2_cover: TLUPhoneApp_RscButton
	{
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		idc = 1704;
		x = 0.421875;
		y = 0.2;
		w = 0.15625;
		h = 0.2;
	};
	class But3: ILG_RscPicture
	{
		idc = 1604;
		text = "jonnycool\JonTex\licenses.paa";
		x = 0.6875;
		y = 0.2;
		w = 0.15625;
		h = 0.2;
	};
	class But3_cover: TLUPhoneApp_RscButton
	{
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		idc = 1702;
		x = 0.6875;
		y = 0.2;
		w = 0.15625;
		h = 0.2;
	};
	class But4: ILG_RscPicture
	{
		idc = 1602;
		text = "jonnycool\JonTex\gov.paa";
		x = 0.15625;
		y = 0.475;
		w = 0.15625;
		h = 0.2;
	};
	class But4_cover: TLUPhoneApp_RscButton
	{
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		idc = 1703;
		x = 0.15625;
		y = 0.475;
		w = 0.15625;
		h = 0.2;
	};
	class But5: ILG_RscPicture
	{
		idc = 1605;
		text = "jonnycool\JonTex\mafgang.paa";
		x = 0.421875;
		y = 0.475;
		w = 0.15625;
		h = 0.2;
	};
	class But5_cover: TLUPhoneApp_RscButton
	{
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		idc = 1705;
		x = 0.421875;
		y = 0.475;
		w = 0.15625;
		h = 0.2;
	};
	class But6: ILG_RscPicture
	{
		idc = 1606;
		text = "jonnycool\JonTex\settings.paa";
		x = 0.6875;
		y = 0.475;
		w = 0.15625;
		h = 0.2;
	};
	class But6_cover: TLUPhoneApp_RscButton
	{
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		idc = 1706;
		x = 0.6875;
		y = 0.475;
		w = 0.15625;
		h = 0.2;
	};
};