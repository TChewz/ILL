#define CT_LISTNBOX         102

class TLU_RscBackground

{
moving = 1;
colorBackground[] = {0.14, 0.18, 0.13, 0.8};
text              = "";
type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;

};

class TLUPhone_RscText
{
  type = CT_STATIC;
  idc = 72999;
  style = ST_CENTER;
  x = safeZoneX;
  y = safeZoneY;
  w = 0.3;
  h = Dlg_CONTROLHGT;
  sizeEx = 0.25;
  colorText[] = {0,0.72,0.72,1};
  colorBackground[] = {Dlg_ColorScheme_WindowBackground, 1};
  font = Zeppelin32;
  
  text = "";
};

class TLUPhoneApp_RscButton : RscButton {
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 0;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	colorText[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	borderSize = 0.0;
	soundEnter[] = {"\ca\ui\data\sound\onover", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.0, 0};
	soundClick[] = {"\ca\ui\data\sound\onclick", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\onescape", 0.09, 1};
};

class TLUCopMenu_Button: RscButton
{
};

class TLU_INVI_RscCheckBox {
	idc = -1;
	type = 7;
	style = 2;
	
	colorText[] = {1, 1, 1, 1};
	color[] = {0, 1, 0, 1};
	colorTextSelect[] = {0, 0.8, 0, 1};
	coloSelectedBg[] = {1, 1, 1, 0};
	colorSelect[] = {0, 0, 0, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	font = "TahomaB";
	SizeEX=0.025;
	rows = 1;
	columns = 1;
	strings[] = {""};
};

class TLU_MultilineEdit : RscEdit {
	style = ST_MULTI;
	autocomplete = ""; 
    font = "EtelkaMonospaceProBold";
    lineSpacing = 1;
    sizeEx = 0.025;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    colorSelection[] = {0.8784, 0.8471, 0.651, 1.0}; 
};

/*
class RscIGUIListBox : RscListBox {
	shadow = 2;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.8784, 0.8471, 0.651, 1.0};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.8784, 0.8471, 0.651, 1.0};
	colorSelectBackground2[] = {0.023529, 0, 0.0313725, 1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	sizeEx = 0.034;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
*/

class TLU_MultiRowRscListBox
{
  // type = defined in derived class
  idc = -1;
  style = LB_TEXTURES; //ST_LEFT; // LB_TEXTURES sets scrollbar to texture instead of box outline
  type = CT_LISTNBOX;
  h = Dlg_CONTROLHGT;
  sizeEx = Dlg_TEXTHGT;
  rowHeight = Dlg_CONTROLHGT;
	//wholeHeight = 0.30;

  color[] = {Dlg_Color_White,1};
  colorText[] = {Dlg_ColorScheme_WindowText,1};
  colorBackground[] = {Dlg_ColorScheme_3DControlBackground, 1}; // always clear?
  colorSelect[] = {Dlg_ColorScheme_WindowText,1};
  colorSelect2[] = {Dlg_ColorScheme_WindowText,1};
  colorScrollbar[] = {Dlg_Color_Maroon,1};
  colorSelectBackground[] = {Dlg_ColorScheme_HighlightBackground,1};
  colorSelectBackground2[] = {Dlg_ColorScheme_3DControlFocus,1};
  font = FontM_R;
  
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
  soundSelect[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
  soundExpand[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
  soundCollapse[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};

  maxHistoryDelay = 1;

  // events
 	onLBSelChanged = "";
 	onLBListSelChanged = "";
 	onLBDblClick = "";
 	onLBDrag = "";
 	onLBDragging = "";
 	onLBDrop = "";

	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
	
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	drawSideArrows = 0;
	idcLeft = -1; 
	idcRight = -1;	
};

class TLU_ListboxColumnButton : RscButton {
	SizeEx = 0.02674;
	colorBackground[] = {1, 1, 1, 0};
	colorBackgroundActive[] = {0, 0, 0, 1};
	colorBackgroundDisabled[] = {1, 1, 1, 1};
	colorFocused[] = {1, 1, 1, 0};
	colorShadow[] = {1, 1, 1, 0};
	borderSize = 0.0;
};

// Wasteland style text
class TLU_MainHUD_RscText {
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = FontM;
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};


