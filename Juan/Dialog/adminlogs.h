class Jon_adminlogs
{
	idd = 9037;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['jon_adminlog', (_this select 0)]";
	controlsBackground[] = {Body_background,header};
	objects[] = {};
	controls[] = {
		eventtitle,
		leftframe,
		leftlist,
		rightheader,
		rightframe,
		righttext,
		closebutton,
		searchbar,
		gobut
	};	
	class header: ILG_RscText
	{
		moving = 1;
		idc = 1000;
		text = "ILG Staff Log Viewer";
		x = 0;
		y = 0;
		w = 1;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class Body_background: ILG_RscText
	{
		idc = 1001;
		x = 0;
		y = 0.05;
		w = 1;
		h = 0.95;
		colorBackground[] = {0,0,0,0.9};
	};
	class eventtitle: ILG_RscText
	{
		idc = 1002;
		text = "Event";
		x = 0.015625;
		y = 0.15;
		w = 0.296875;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class leftframe: ILG_RscFrame
	{
		idc = 1800;
		x = 0.015625;
		y = 0.2;
		w = 0.296875;
		h = 0.775;
		colorText[] = {0.69,0,0.047,1};
	};
	class leftlist: ILG_RscListbox
	{
		idc = 1500;
		x = 0.015625;
		y = 0.2;
		w = 0.296875;
		h = 0.77381;
	};
	class rightheader: ILG_RscText
	{
		idc = 1003;
		text = "Information on Event";
		x = 0.328125;
		y = 0.075;
		w = 0.65625;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class rightframe: ILG_RscFrame
	{
		idc = 1801;
		x = 0.328125;
		y = 0.125;
		w = 0.65625;
		h = 0.85;
		colorText[] = {0.69,0,0.047,1};
	};
	class righttext: ILG_RscStructuredText
	{
		idc = 1100;
		x = 0.328125;
		y = 0.125;
		w = 0.65625;
		h = 0.85;
	};
	class closebutton: ILG_RscPicture
	{
		idc = 1200;
		text = "jonnycool\JonTex\Cross.paa";
		x = 0.968006;
		y = 0.00767192;
		w = 0.0255953;
		h = 0.0351852;
	};
	class searchbar: ILG_RscEdit
	{
		idc = 1382;
		text = "Search";
		x = 0.015625;
		y = 0.075;
		w = 0.234375;
		h = 0.05;
		colorText[] = {0.69,0,0.047,1};
	};
	class gobut: ILG_RscButton
	{
		idc = 1600;
		text = "Go";
		x = 0.265625;
		y = 0.075;
		w = 0.046875;
		h = 0.05;
		
		//Custom Button Config
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