//$[1.03,[[0,0,1,1],0.03125,0.05],[1000,"header",[0,"Header",[0.0937504,0.1,0.812499,0.05],[-1,-1,-1,-1],[0.69,0,0.047,1],[-1,-1,-1,-1],""],[]],[1001,"background",[0,"",[0.09375,0.15,0.8125,0.7],[-1,-1,-1,-1],[0,0,0,0.1],[-1,-1,-1,-1],""],[]],[1500,"listbox",[0,"",[0.109375,0.175,0.78125,0.65],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1200,"exit_button",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.874752,0.108201,0.0255953,0.0351852],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class Jon_ThemedList
{
	idd = 9088;
	movingEnable = true;
	controlsBackground[] = {header,background};
	objects[] = {};
	controls[] = {
		listbox,
		exit_button,
		exit_button_cover
	};
	
	class header: ILG_RscText
	{
		idc = 1000;
		moving = 1;
		text = "Header";
		x = 0.09375;
		y = 0.1;
		w = 0.812499;
		h = 0.05;
		colorBackground[] = {0.69,0,0.047,1};
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
	class listbox: ILG_RscListbox
	{
		idc = 1500;
		//[0.109375,0.175,0.78125,0.65]
		x = 0.109375;
		y = 0.175;
		w = 0.78125;
		h = 0.65;
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
};