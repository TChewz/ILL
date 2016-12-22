class Jon_MafiaGangMenu
{
	idd = 9064;
	movingEnable = true;
	controlsBackground[] = {background,header};
	objects[] = {};
	controls[] = {
		gangmenubutton,
		list,
		exit_button,
		exit_button_cover
	};
	
	class header: ILG_RscText
	{
		idc = 1000;
		text = "Gang Menu";
		moving = 1;
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
		x = 0.09375;
		y = 0.15;
		w = 0.8125;
		h = 0.7;
		colorBackground[] = {0,0,0,0.9};
	};
	class list: ILG_RscListbox
	{
		idc = 1500;
		x = 0.109375;
		y = 0.175;
		w = 0.78125;
		h = 0.575;
	};
	class gangmenubutton: ILG_RscButton
	{
		idc = 1600;
		text = "Gang Menu";
		x = 0.109375;
		y = 0.775;
		w = 0.25;
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