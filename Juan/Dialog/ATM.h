class ILG_ATM_Menu
{
	idd = 9055;
	movingEnable = true;
	controlsBackground[] = {Main_BG_Colour,Main_BG_Frame};
	objects[] = {};
	controls[] = {Main_Title,Top_Frame,Bank_Balance_text,Bank_Balance,INV_Money_text,INV_Money,Dep_frame,Frame_Deposit,PlayerList,Player_sel,transfer_text,
	Amount_text,val_input,Transfer_button,Frame_Withdraw,with_text,Amount_text_with,Withdraw_box,Withdraw_submit};
	
	class Main_BG_Colour: ILG_RscText
	{
		idc = 1000;
		x = 0.401588 * safezoneW + safezoneX;
		y = 0.185 * safezoneH + safezoneY;
		w = 0.246031 * safezoneW;
		h = 0.525 * safezoneH;
		colorBackground[] = {0.14, 0.18, 0.13, 0.8};	
	};
	class Main_BG_Frame: ILG_RscFrame
	{
		idc = 1800;
		text = "IslandLifeGaming - Automated Teller";
		x = 0.401588 * safezoneW + safezoneX;
		y = 0.1675 * safezoneH + safezoneY;
		w = 0.246031 * safezoneW;
		h = 0.5425 * safezoneH;
	};
	class Main_Title: ILG_RscText
	{
		idc = 1001;
		text = "Bank";
		x = 0.508201 * safezoneW + safezoneX;
		y = 0.2025 * safezoneH + safezoneY;
		w = 0.0328041 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Top_Frame: ILG_RscFrame
	{
		idc = 1801;
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.2025 * safezoneH + safezoneY;
		w = 0.213227 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Bank_Balance_text: ILG_RscText
	{
		idc = 1003;
		text = "Bank Balance:";
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.0902113 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Bank_Balance: ILG_RscText
	{
		idc = 1004;
		text = "Cash";
		x = 0.516402 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.114814 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class INV_Money_text: ILG_RscText
	{
		idc = 1005;
		text = "Inventory:";
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.0902113 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class INV_Money: ILG_RscText
	{
		idc = 1006;
		text = "Cash";
		x = 0.516402 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.114814 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Dep_frame: ILG_RscFrame
	{
		idc = 1802;
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.213227 * safezoneW;
		h = 0.07 * safezoneH;
	};
	class Frame_Deposit: ILG_RscFrame
	{
		idc = 1803;
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.3425 * safezoneH + safezoneY;
		w = 0.213227 * safezoneW;
		h = 0.1925 * safezoneH;
	};
	class PlayerList: ILG_RscCombo
	{
		idc = 2100;
		x = 0.508201 * safezoneW + safezoneX;
		y = 0.3775 * safezoneH + safezoneY;
		w = 0.114814 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Player_sel: ILG_RscText
	{
		idc = 1008;
		text = "Select Player:";
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.3775 * safezoneH + safezoneY;
		w = 0.0820102 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class transfer_text: ILG_RscText
	{
		idc = 1002;
		text = "Transfer";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.3425 * safezoneH + safezoneY;
		w = 0.0574072 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Amount_text: ILG_RscText
	{
		idc = 1007;
		text = "Amount:";
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.0492061 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class val_input: ILG_RscEdit
	{
		idc = 1400;
		x = 0.475397 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.147618 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Transfer_button: ILG_RscButton
	{
		idc = 1600;
		text = "Submit";
		x = 0.426191 * safezoneW + safezoneX;
		y = 0.4825 * safezoneH + safezoneY;
		w = 0.196825 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Frame_Withdraw: ILG_RscFrame
	{
		idc = 1804;
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.213227 * safezoneW;
		h = 0.14 * safezoneH;
	};
	class with_text: ILG_RscText
	{
		idc = 1009;
		text = "Withdraw";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.0574072 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Amount_text_with: ILG_RscText
	{
		idc = 1010;
		text = "Amount:";
		x = 0.41799 * safezoneW + safezoneX;
		y = 0.5875 * safezoneH + safezoneY;
		w = 0.0574072 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Withdraw_box: ILG_RscEdit
	{
		idc = 1401;
		x = 0.475397 * safezoneW + safezoneX;
		y = 0.5875 * safezoneH + safezoneY;
		w = 0.147618 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class Withdraw_submit: ILG_RscButton
	{
		idc = 1601;
		text = "Submit";
		x = 0.426191 * safezoneW + safezoneX;
		y = 0.64 * safezoneH + safezoneY;
		w = 0.196825 * safezoneW;
		h = 0.035 * safezoneH;
	};
};