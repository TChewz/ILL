class dispatch
 {
	idd = -1;
	movingEnable = true;
	objects[]={};
	controls[]={framidge, background, text, list, submitbutton,cancelbutton};
		
	
	class framidge: RscBackground
	{
		idc = -1;
		x = 0.39545 * safezoneW + safezoneX;
		y = 0.335431 * safezoneH + safezoneY;
		w = 0.209101 * safezoneW;
		h = 0.211588 * safezoneH;
		colorText[] = {0.2,0.7,0.3,0.5};
		colorBackground[] = {0.2,0.7,0.3,0.5};
		colorBackgroundActive[] = {0.2,0.7,0.3,0.5};
	};
	class background: RPP_StructuredText
	{
		idc = 1101;
		x = 0.389947 * safezoneW + safezoneX;
		y = 0.323676 * safezoneH + safezoneY;
		w = 0.220106 * safezoneW;
		h = 0.235098 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class text: RPP_StructuredText
	{
		idc = 1102;
		text = "Please Select a cop number";
		x = 0.439471 * safezoneW + safezoneX;
		y = 0.358941 * safezoneH + safezoneY;
		w = 0.113828 * safezoneW;
		h = 0.0553565 * safezoneH;
		colorBackground[] = {0,0,0,0};
	};
	class list: RscCombo
	{
		idc = 6294;
		x = 0.444974 * safezoneW + safezoneX;
		y = 0.405961 * safezoneH + safezoneY;
		w = 0.10455 * safezoneW;
		h = 0.0235098 * safezoneH;
	};
	class submitbutton: RscButton
	{
		idc = 1700;
		text = "Submit";
		x = 0.466984 * safezoneW + safezoneX;
		y = 0.461225 * safezoneH + safezoneY;
		w = 0.0615703 * safezoneW;
		h = 0.0257248 * safezoneH;
		action = "[player] execVM 'dispatchsys\selectswitch.sqf';";
	};
	class cancelbutton: RscButton
	{
		idc = 1701;
		text = "Cancel";
		x = 0.466984 * safezoneW + safezoneX;
		y = 0.504735 * safezoneH + safezoneY;
		w = 0.0615703 * safezoneW;
		h = 0.0257248 * safezoneH;
		onbuttonclick = "closeDialog 0;";
	};
};



