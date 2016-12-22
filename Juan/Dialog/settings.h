class Jon_SettingsMenu
{
	idd = 9064;
	movingEnable = true;
	controlsBackground[] = {background,header};
	objects[] = {};
	controls[] = {
		settingslist,
		settingsheading,
		optionlist,
		optionheader,
		settingsframe,
		optionframe,
		exit_button,
		exit_button_cover,
		savebut
	};

	class header: ILG_RscText
	{
		moving = 1;
		idc = 1000;
		text = "Settings";
		x = 0.09375;
		y = 0.1;
		w = 0.8125;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class exit_button: ILG_RscPicture
	{
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
	class background: ILG_RscText
	{
		idc = 1001;
		//[0.09375,0.15,0.8125,0.65]
		x = 0.09375;
		y = 0.15;
		w = 0.8125;
		h = 0.65;
		colorBackground[] = {0,0,0,0.9};
	};
	class settingslist: ILG_RscListbox
	{
		idc = 1500;
		x = 0.125;
		y = 0.25;
		w = 0.359375;
		h = 0.45;
	};
	class settingsheading: ILG_RscText
	{
		idc = 1002;
		text = "Setting";
		x = 0.125;
		y = 0.2;
		w = 0.359375;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class optionlist: ILG_RscListbox
	{
		idc = 762;
		x = 0.515625;
		y = 0.25;
		w = 0.359375;
		h = 0.45;
	};
	class optionheader: ILG_RscText
	{
		idc = 1003;
		text = "Option";
		x = 0.515625;
		y = 0.2;
		w = 0.359375;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class settingsframe: ILG_RscFrame
	{
		idc = 1800;
		//[0.125,0.2,0.359375,0.505291]
		x = 0.125;
		y = 0.2;
		w = 0.359375;
		h = 0.505291;
		colorText[] = {0.69,0,0.047,1};
	};
	class optionframe: ILG_RscFrame
	{
		idc = 1801;
		//[0.515625,0.2,0.359375,0.505291]
		x = 0.515625;
		y = 0.2;
		w = 0.359375;
		h = 0.505291;
		colorText[] = {0.69,0,0.047,1};
	};
	class savebut: ILG_RscButton
	{
		idc = 1600;
		text = "Save Settings";
		x = 0.390625;
		y = 0.725;
		w = 0.21875;
		h = 0.05;
		colorText[] = {0.8784,0.8471,0.651,1};
		colorDisabled[] = {0.2627450980392157,0.08627450980392157,0.08627450980392157,1};
		colorBackground[] = {0.69,0,0.047,0.5};
		colorBackgroundDisabled[] = {0.69,0,0.047,1};
		colorBackgroundActive[] = {0.69,0,0.047,1};
		colorFocused[] = {1,0.25882352941176473,0.30980392156862746,1};
		colorShadow[] = {0.023529,0,0.0313725,1};
		colorBorder[] = {0.023529,0,0.0313725,1};
	};

};
