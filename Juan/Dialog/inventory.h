class Jon_PInventory
{
	idd = 9034;
	movingEnable = true;
	controlsBackground[] = {background,header};
	onLoad = "uiNamespace setVariable ['jon_inventorymenu', (_this select 0)]";
	objects[] = {};
	controls[] = {
		itemList,
		itemlistborder,
		itemdesc,
		playerlist,
		moreinfo,
		usebutton,
		dropbutton,
		givebutton,
		exit_button_cover,
		exit_button,
		itemamount
	};


	class header: ILG_RscText
	{
		moving = 1;
		idc = 1000;
		text = "Inventory";
		x = 0.09375;
		y = 0.1;
		w = 0.8125;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class background: ILG_RscText
	{
		idc = 1001;
		x = 0.09375;
		y = 0.15;
		w = 0.8125;
		h = 0.75;
		colorBackground[] = {0,0,0,0.9};
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
	class itemList: ILG_RscListbox
	{
		idc = 1500;
		x = 0.125;
		y = 0.2;
		w = 0.28125;
		h = 0.35;
	};
	class itemlistborder: ILG_RscFrame
	{
		idc = 1800;
		x = 0.121032;
		y = 0.194709;
		w = 0.290179;
		h = 0.361905;
		colorText[] = {0.69,0,0.047,0.5};
	};
	class itemdesc: ILG_RscStructuredText
	{
		idc = 1100;
		text = "Item Desc";
		x = 0.4375;
		y = 0.2;
		w = 0.4375;
		h = 0.35;
		colorBackground[] = {0.69,0,0.047,0};
	};
	class moreinfo: ILG_RscStructuredText
	{
		idc = 1101;
		text = "Additional Info";
		x = 0.4375;
		y = 0.7;
		w = 0.4375;
		h = 0.15;
		colorBackground[] = {0.69,0,0.047,0};
	};
	class usebutton: ILG_RscButton
	{
		idc = 1600;
		text = "Use";
		x = 0.125;
		y = 0.6;
		w = 0.28125;
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
	class dropbutton: ILG_RscButton
	{
		idc = 1601;
		text = "Drop";
		x = 0.125;
		y = 0.7;
		w = 0.28125;
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
	class givebutton: ILG_RscButton
	{
		idc = 1602;
		text = "Give to Player";
		x = 0.125;
		y = 0.8;
		w = 0.28125;
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
	class itemamount: ILG_RscEdit
	{
		idc = 1339;
		x = 0.4375;
		y = 0.6;
		w = 0.09375;
		h = 0.05
		colorText[]= {0.69,0,0.047,0.5};
	};
	class playerlist: ILG_RscCombo
	{
		idc = 2100;
		x = 0.546875;
		y = 0.6;
		w = 0.328125;
		h = 0.05;
	};
};