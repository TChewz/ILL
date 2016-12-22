class Jon_adminlogs_nosearch
{
	idd = 9037;
	movingEnable = true;
	controlsBackground[] = {Body_background,header};
	objects[] = {};
	controls[] = {
		eventtitle,
		leftframe,
		leftlist,
		rightheader,
		rightframe,
		righttext,
		closebutton
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
		y = 0.075;
		w = 0.296875;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
	};
	class leftframe: ILG_RscFrame
	{
		idc = 1800;
		x = 0.015625;
		y = 0.125;
		w = 0.296875;
		h = 0.85;
		colorText[] = {0.69,0,0.047,1};
	};
	class leftlist: ILG_RscListbox
	{
		idc = 1500;
		x = 0.015625;
		y = 0.130291;
		w = 0.294891;
		h = 0.840873;
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
		text = "#(argb,8,8,3)color(1,1,1,1)";
		x = 0.968006;
		y = 0.00767192;
		w = 0.0255953;
		h = 0.0351852;
	};
};