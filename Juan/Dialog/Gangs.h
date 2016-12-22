class ILG_Gang_Menu
{
	idd = 9082;
	movingEnable = true;
	controlsBackground[] = {Main_BG,BG_Colour};
	objects[] = {};
	controls[] = {Gang_Member_List,Gang_List,Main_Title,Current_Gangs,Your_Gang,DeclareWar,myGang_Name,myGang_Member_List,Gang_Join,RscButton_1602,Gang_Member_List_Frame,Gang_List_Frame,Current_Gang_Members,myGang_Member_List_Frame,myGang_Name_Frame,
	Current_Gang_Control,Current_Gang_Enemy,Gang_Wars_List_Frame,Gang_Wars_List,Gang_Control_Frame,Gang_Control,Gang_Lock};

	class BG_Colour: ILG_RscPicture
	{
		idc = 12;
		text = "#(argb,8,8,3)color(0.5,0.5,0.5,0.5)";
		x = 0.237567 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.524866 * safezoneW;
		h = 0.5825 * safezoneH;
	};
	class Main_BG: ILG_RscFrame
	{
		idc = 1;
		text = "Island Life Liberation - Gang Menu";
		colorBackground[] = {0.5, 0.5, 0.5, 1};
		x = 0.237567 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.524866 * safezoneW;
		h = 0.5825 * safezoneH;
	};
	class Main_Title: ILG_RscText
	{
		idc = 4;
		text = "Gangs";
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.1675 * safezoneH + safezoneY;
		w = 0.16402 * safezoneW;
		h = 0.06 * safezoneH;
		SizeEX = 0.101;
	};
	class Current_Gangs: ILG_RscText
	{
		text = "Current Gangs";
		x = 0.245768 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.0984123 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Current_Gang_Members: ILG_RscText
	{
		text = "Members";
		x = 0.368784 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.0984123 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Current_Gang_Control: ILG_RscText
	{
		text = "Area Control";
		x = 0.245768 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.0984123 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Current_Gang_Enemy: ILG_RscText
	{
		idc = 18;
		text = "Wars";
		x = 0.368784 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.0984123 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Gang_Wars_List: ILG_RscListbox
	{
		idc = 23;
		x = 0.368784 * safezoneW + safezoneX;
		y = 0.4352 * safezoneH + safezoneY;
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Gang_Wars_List_Frame: ILG_RscFrame
	{
		x = 0.368784 * safezoneW + safezoneX;
		y = 0.4352 * safezoneH + safezoneY;
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Gang_Control: ILG_RscListbox
	{
		idc = 20;
		x = 0.245768 * safezoneW + safezoneX;
		y = 0.4352 * safezoneH + safezoneY;		
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Gang_Control_Frame: ILG_RscFrame
	{
		x = 0.245768 * safezoneW + safezoneX;
		y = 0.4352 * safezoneH + safezoneY;
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Your_Gang: ILG_RscText
	{
		idc = 6;
		text = "Your Gang";
		x = 0.614814 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.0984123 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class myGang_Name: ILG_RscText
	{
		idc = 8;
		text = "Gang";
		x = 0.614814 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.131216 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class myGang_Member_List: ILG_RscListbox
	{
		idc = 9;
		x = 0.614814 * safezoneW + safezoneX;
		y = 0.325 * safezoneH + safezoneY;
		w = 0.131216 * safezoneW;
		h = 0.175 * safezoneH;
	};
	class myGang_Name_Frame: ILG_RscFrame
	{
		x = 0.614814 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.131216 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class myGang_Member_List_Frame: ILG_RscFrame
	{
		idc = 16;
		x = 0.614814 * safezoneW + safezoneX;
		y = 0.325 * safezoneH + safezoneY;
		w = 0.131216 * safezoneW;
		h = 0.175 * safezoneH;
	};
	class Gang_Join: ILG_RscButton
	{
		idc = 10;
		text = "Join Gang";
		x = 0.631216 * safezoneW + safezoneX;
		y = 0.5175 * safezoneH + safezoneY;
		w = 0.0820102 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class RscButton_1602: ILG_RscButton
	{
		idc = 11;
		text = "Create Gang";
		x = 0.631216 * safezoneW + safezoneX;
		y = 0.57 * safezoneH + safezoneY;
		w = 0.0820102 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class DeclareWar: ILG_RscButton
	{
		idc = 7;
		text = "Declare War!";
		x = 0.631216 * safezoneW + safezoneX;
		y = 0.6225 * safezoneH + safezoneY;
		w = 0.0820102 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Gang_Lock: ILG_RscButton
	{
		idc = 30;
		text = "Lock Gang";
		x = 0.631216 * safezoneW + safezoneX;
		y = 0.675 * safezoneH + safezoneY;
		w = 0.0820102 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Gang_Member_List: ILG_RscListbox
	{
		idc = 2;
		x = 0.368784 * safezoneW + safezoneX;
		y = 0.2525 * safezoneH + safezoneY;
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Gang_Member_List_Frame: ILG_RscFrame
	{
		x = 0.368784 * safezoneW + safezoneX;
		y = 0.2525 * safezoneH + safezoneY;
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Gang_List: ILG_RscListbox
	{
		idc = 3;
		x = 0.245768 * safezoneW + safezoneX;
		y = 0.2525 * safezoneH + safezoneY;		
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class Gang_List_Frame: ILG_RscFrame
	{
		x = 0.245768 * safezoneW + safezoneX;
		y = 0.2525 * safezoneH + safezoneY;
		w = 0.123015 * safezoneW;
		h = 0.14 * safezoneH;
	};
};
