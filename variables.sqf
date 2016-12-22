donatorcashbonus = 0;
admincashbonus = 0;
if ((getPlayerUID player) in donatorlevel1) then
{
	donatorcashbonus = 2000;
};
if ((getPlayerUID player) in donatorlevel2) then
{
	donatorcashbonus = 4000;
};
if ((getPlayerUID player) in donatorlevel3) then
{
	donatorcashbonus = 8000;
};
if ((getPlayerUID player) in donatorlevel4) then
{
	donatorcashbonus = 10000;
};
if ((getPlayerUID player) in mod) then
{
	admincashbonus = 10000;
};
if ((getPlayerUID player) in admin) then
{
	admincashbonus = 15000;
};
if ((getPlayerUID player) in superadmin) then
{
	admincashbonus = 20000;
};
//=================================================================================
player setVariable ["wpavalible",true,true]; //Dispatch#
player setVariable ["restrained",false,true];
ILG_Restrain_Anim = "unaercposlechvelitele1";//"CivilLying01";
ILG_Restrain_Anim_Array = ["unaercposlechvelitele1","unaercposlechvelitele2","unaercposlechvelitele3","unaercposlechvelitele4"];//["amovppnemstpsnonwnondnon"];
ILG_Unrestrain_Anim = "UnaErcPoslechVelitile_UnaErc";//"amovppnemstpsnonwnondnon";
ILG_SMS_Recieved = false;
ILG_banktruckrob = false;
ILG_Phone_Action_Enable = true;
ILG_Has_Modpack = isClass(configFile >> "cfgPatches" >> "ILG_Objects");
player setVariable ["ILG_Has_Modpack",ILG_Has_Modpack,true];
INV_smscost		 = 100;
SMS 				 = [];
add_civmoney		 = 5500+donatorcashbonus+admincashbonus;
add_copmoney		 = 5500+donatorcashbonus+admincashbonus;
add_workplace		 = 3000;
copchoprespawntime       = 120;
CopWaffenAvailable       = 0;
lastWeaponShot 		 = "";
CopIsInPrison            = false;
CopInPrisonTime          = 0;
shooting_self            = 0;
srHinbewegen             = 0;
deadcam                  = 0;
isstunned                = false;
hatGanggebietErobert     = false;
Antwort                  = 0;
CivTimeInPrison          = 0;
CopLog                   = [];
fic_array		         = [];
report_array		     = [];
fic_array2		         = [];
report_array2		     = [];
911_array		         = [];
911report_array		     = [];
murderer                 = [];
MayorSteuern             = 0;
MayorBekommtSteuern      = 75;
chiefSteuern             = 0;
chiefBekommtSteuern      = 75;
eigene_zeit              = time;
money_limit              = 25000000;
bank_limit		 = 25000000;
wantedbonus              = 500;
StunActiveTime           = 0;
StunTimePerHit		 = 15;
MaxStunTime		 = 30;
MishyStehlenMax           = 200000;
demerits                 = 0;
gtbonus 		 = 10;
gtactive		 = false;
ctactive		 = false;
keyblock		 = false;
maxboars		 = 35;
maxrabbits		 = 35;
maxmanitime		 = 2400;
powerrestorecost	 = 10000;
impoundpay		 = 3000;
noholster		 = false;
MGcost			 = 10000;
PKcost			 = 10000;
SQUADcost		 = 20000;
maxinfai		 = 16;
firestrikes		 = 3;
totalstrikes		 = 3;
facworkercost		 = 3000;
maxfacworkers		 = 20;
firingcaptive		 = false;
pickingup   		 = false;
lockpickchance		 = 10;
planting		 = false;
drugstockinc		 = 900;
druguserate		 = 120;
cmissionactive 		 = false;
cmissionactive1		 = false;
cmissionactive2		 = false;
stunshotsmax           = 3;
//========ILG Hotkey Variables===========
Hotkey_7_Sleep = false;
Hotkey_8_Sleep = false;
Hotkey_9_Sleep = false;
Hotkey_7 = {player groupchat "Hotkey not yet defined!";};
Hotkey_8 = {player groupchat "Hotkey not yet defined!";};
Hotkey_9 = {player groupchat "Hotkey not yet defined!";};
//========robbing variables===========
stolenfromtime 		 = 900;
stolenfromtimeractive	 = false;  // dont change
TheSafecode = [ceil ((random 12)+0.1),ceil ((random 12)+0.1),ceil ((random 12)+0.1),ceil ((random 12)+0.1),ceil ((random 12)+0.1),ceil ((random 12)+0.1)];
SafecodesCracked = 0;
DreherState = 0;
Processing1 = false;
Safecracked1 = False;
Processing2 = false;
Safecracked2 = False;
Processing3 = false;
Safecracked3 = False;
//========Mafia======
streetrep = 0;
mafiamembers = mafs getvariable "mafiamembers";// mafiamembers is now [];
hasjob = false;
//===============MOTD==================
motdwaittime = 120;
//===============Cop Patrol==================
pmissionactive = false;
patrolwaittime = false;
patrolmoneyperkm = 4.0;  // 1 would be equal to $3,000 for 1KM
pmissionactive1 = false;
patrolwaittime1 = false;
patrolmoneyperkm1 = 5.0;  // 1 would be equal to $3,000 for 1KM
//=========government convoy=============
govconvoybonus 		 = 75000;
govconvoythiefbonus	 = 100000;
convoyrespawntime        = 30;  // 30 minutes
moneyintruck 		 = true; //dont change
convoyguardsdead		= false;
//convoywinner        = convoywinners;
//===== Gas station robbing
maxstationmoney = 25000;
wantedamountforrobbing = 20000;
maxbarmoney = 25000;
if(debug)then{drugstockinc = 6;druguserate = 20};
//==============================PETROL/OIL=========================================
petroluse                = 3;
maxpetroluse             = 400;
oildemand                = 0.25;
oilsellpricedec          = 30;
oilbaseprice		 = 4500;
//==============================MINING=============================================
shoveldur=20;
shovelmax=2;
pickaxedur=50;
pickaxemax=3;
hammerdur=100;
hammermax=4;
working=false;
//===============================GANGS=============================================
gangincome		 = 2500;
gangcreatecost		 = 100000;
gangdeltime		 = 900;
gangsarray		 = [];
gangmember		 = false;
gangleader		 = false;
gangareas		 = [gangarea1,gangarea2,gangarea3,gangarea4,gangarea5];
//=================================================================================
CityLocationArray        = [[CityLogic1, 500], [CityLogic2, 400], [CityLogic4, 500], [CityLogic5, 200], [Militarybase, 200]];
respawnarray		 = [/*respawn1,respawn2,respawn3,respawn4,respawn5,respawn6,respawn7,respawn8,respawn9,respawn10,respawn11,respawn12*/];
//=========== cop patrol array ==========
coppatrolarray  =
[
 "patrolpoint1",
 "patrolpoint2",
 "patrolpoint3",
 "patrolpoint4",
 "patrolpoint5",
 "patrolpoint6",
 "patrolpoint7",
 "patrolpoint8",
 "patrolpoint9",
 "patrolpoint10",
 "patrolpoint11",
 "patrolpoint12",
 "patrolpoint13",
 "patrolpoint14",
 "patrolpoint15",
 "patrolpoint16",
 "patrolpoint17",
 "patrolpoint18",
 "patrolpoint19"
];

coppatrolarray1  = [ "guardpoint1", "guardpoint2", "guardpoint3", "guardpoint4", "guardpoint5", "guardpoint6", "guardpoint7"];

cargoarray  = [getpos resourcesell,getpos assassinshop,getpos shop4,getpos scarshop4,getpos tuning1];
cargoarray1 = [[0,0,0],[0,0,0],[0,0,0]];/*[getpos wood_1,getpos shop2,getpos shop1,getpos ressourcenfabrik_1,getpos wfgunbox];*/
cargoarray2  = [getpos methsell,getpos ldrugsell,getpos hdrugsell,getpos mdrugsell,getpos cdrugsell];

['schluesselbund', 1] call INV_SetItemAmount;
['handy', 1] call INV_SetItemAmount;

playerWeapons            = [];
playerMagazines          = [];
weaponsloaded		 = false;
CopStartGear_Mags        =

[
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"DDOPP_3Rnd_X3",
"Smokeshell",
"Smokeshell",
"RAB_L111A1"

];

CopStartGear_Weap        = ["DDOPP_X3","ItemGPS","Binocular"];

if (iscop) then

{

['handy', 1] call INV_SetItemAmount;

RadioTextMsg_1 = "Put your fucking hands up!";
RadioTextMsg_2 = "Pull over and stay in your vehicle!";
RadioTextMsg_3 = "Drop your weapon and put your hands on your head!";
RadioTextMsg_4 = "Your free to go, have a nice day";

}
else
{

RadioTextMsg_1 = "Put your fucking hands up now!";
RadioTextMsg_2 = "Step away from the vehicle!";
RadioTextMsg_3 = "Do it now or your dead!";
RadioTextMsg_4 = "Dont shoot i give up!";

};

RadioTextArt_1 = "direct";
RadioTextArt_2 = "direct";
RadioTextArt_3 = "direct";
RadioTextArt_4 = "direct";

publicarbeiterarctionarray= [];

for [{_i=1}, {_i <= civscount}, {_i=_i+1}] do

{

call compile format ["
kopfMishy_civ%1      = 0;
civ%1_wanted        = 0;
civ%1_mayor         = 0;
civ%1_reason        = [];
civ%1_warning        = [];
civ%1_arrest        = 0;
civ%1_markerjammed  = 0;
", _i];

};

if(isnil "param1")then{param1 = 0};
if(isnil "param2")then{param2 = 1024};

SkipTimeDay	   	 = (floor(param2/100));
SkipTimeNight  	   	 = (param2 mod 100);

isdead			 = 0;
local_arrest             = 0;
inv_items		 = 0;
extradeadtime		 = 10;  //respawnzeit + extradeadtime = total base respawn for civs
respawntimeinc		 = 10;  //respawn time added every time a civ dies
killedplayerinc          = 20; //Amount of time added per cop kill for civs
respawnzeit              = 10;  //respawnzeit + extradeadtime = total base respawn also respawn time after a cop dies atleast once
DeadWaitSec              = respawnzeit;
DeadTimeMax              = 50; //Max time you can get for respawn
deadtimebonus            = 0.001;
deadtimes                = 0;
suicidepenalty		 = 50; //Suicide penalty does not apply to cops
CopsKilled               = 0;
CivsKilled               = 0;
SelfKilled               = 0;
killstrafe               = 20000;
copteamkillstrafe	 = 20000;
GesetzAnzahl             = 12;
GesetzArray              = ["Always Drive on the RIGHT side of the road","Always Holster weapons in Towns.","Speed limits 60 in town 90 out", "Governor and Gaurds May have any weapon unlicensed","Governor is immune to traffic laws","","","","","","","","","",""];

if(debug)then{suicidepenalty = 0;respawntimeinc = 0;killedplayerinc = 0};

isMayor                  = false;
WahlArray                = [];
MayorNumber              = -1;
MayorExtraPay            = 3000;

for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {WahlArray = WahlArray + [ [] ];};

ischief                  = false;
WahlArrayc               = [];
chiefNumber              = -1;
chiefExtraPay            = 5000;

for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {WahlArrayc = WahlArrayc + [ [] ];};

deadcam_target_array     =

[

[12467.6885,4.12955,4202.3672],
[2101.7478,4.1295543,4576.5317],
[1773.7926,7,1049.4725]

];

deadcam_position_array   =

[

[6573.78,2365.67,19.16],
[6563.33,2409.16,3.60],
[6598.98,2409.17,3.60]

];

atmscriptrunning = 0;
shopactivescript = 0;
deadcam_wechsel_dauer    = 5;
deadcam_kameraposition   = round(random (count deadcam_position_array - 1));
slave_cost               = 40000;
slavemoneyprosekunde	 = 5000;
maxslave                 = 2;
copslaveallowed          = 0;
localslave               = 0;
localslavecounter        = 0;
huren_cost               = 20000;
hoemoneyprosekunde       = 5000;
maxhuren                 = 10;
copworkerallowed         = 0;
pimpactive               = 0;
localhuren               = 0;
localhurencounter        = 0;
localdog		 = 0;
maxdog			 = 1;
dog_cost                 = 1000;
speedbomb_minspeed       = 1;
speedbomb_maxspeed       = 100;
speedbomb_mindur         = 10;
speedbomb_maxdur         = 300;
zeitbombe_mintime        = 10;
zeitbombe_maxtime        = 0;
HideoutLocationArray     = CityLocationArray;
publichideoutarray       = [];
hideoutcost		 = 20000;
marker_ausserhalb        = param1;
marker_innerhalb         = 5;
marker_CopDistance       = 50;   //controls distance cops need to be to make civ dots appear outside of towns.
CivMarkerUngenau         = 20;
copmarker_on             = 1;
despawnarray	 	 = [["EvMoney", 300], ["Suitcase", 300]];
workplacearray           = [/*[workplace1, 80], [workplace2, 80], [workplace3, 60]*/];
huntingarray             = [["hunting1", 450]];
nonlethalweapons	 = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];
slavearray               = workplacearray;
hurenarray               = [[brothel1, 15], [brothel2, 15], [brothel3, 15]];
timeinworkplace          = 0;
wpcapacity               = 10;
INV_hasitemshop          = 0;
INV_haswepshop           = 0;
gunlicensetargets	 = [/*t21,t22,t31,t32,t41,t42,t51,t52,t61,t62,t71,t72,t81,t82,t91,t92,t101,t111,t112,t121,t131,t132,t133,t134,t135*/];
BuildingsOwnerArray 	 = [];
Homearray = [""];

Cararray = [
"440cuda","KPFS_vwt4_bgs_FLIR","monaco","roadrunner","roadrunner2","civic","CHEVROLET_CAMARO_SS_396","chevrolet_chevelle","cuda","hemicuda","cd71hm","challenger","barcuda","fury","FORD_MUSTANG_SHELBY_COBRA","FORD_MUSTANG_SHELBY_COBRA1","FORD_MUSTANG_SHELBY_COBRA2","FORD_MUSTANG_SHELBY_COBRA3","cl_charger","cl_charger_black","il_charger_blue","il_charger_black","il_charger_red","il_charger_orange","MAZDA_RX_7","MAZDA_RX_71","MAZDA_RX_72","MAZDA_RX_73","MAZDA_RX_75","MAZDA_RX_74","MAZDA_MAZDASPEED_3","CHRYSLER_300","RENAULT_CLIO_SPORT_V6","SUBARU_IMPREZA_WRX_STI_AWD","SUBARU_IMPREZA_STI_AWD","FIAT_PUNTO","ALFA_ROMEO_BRERA","GLT_M300_LT","GLT_M300_ST","MustangGTRyellow_MLOD","Convertible_MLOD","CADILLAC_CTS","CADILLAC_CTS1","CADILLAC_CTS2","CADILLAC_CTS3","FORD_SHELBY_GT","FORD_GT","CHRYSLER_W_limmo","BMW_M3_RALLY","BMW_M6","BMW_M3_GTR","BMW_M3","BMW_135I","CORVETTE_Z06","INFINITI_G35","MERCEDES_BENZ_CLK_500","MERCEDES_BENZ_SL_65_AMG","RENAULT_CLIO_SPORT_V6","CL_PORSCHE_997","CL_LAMBORGHINI_GT3","KOENIGSEGG_CCX","KOENIGSEGG_CCX1","KOENIGSEGG_CCX2","KOENIGSEGG_CCX3","MCLAREN_F1","PORSCHE_997_GT3_RSR","PORSCHE_911_TURBO","PORSCHE_911_GT3_RS","LAMBORGHINI_MURCIELAGO","LAMBORGHINI_REVENTON","LAMBORGHINI_GALLARDO","MASERATI_MC12","JAGUAR_XK","BUGATTI_VEYRON","AUDI_TT_QUATTRO_S_LINE","AUDI_FSI_LE_MANS","ASTON_MARTIN_DBR9","ASTON_MARTIN_DB9","PAGANI_ZONDA_F","NISSAN_GTR_SPECV","NISSAN_GTR_SPECV1","NISSAN_GTR_SPECV2","NISSAN_GTR_SPECV3","NISSAN_350Z","NISSAN_370Z","NISSAN_370Z1","NISSAN_370Z2","NISSAN_370Z3","NISSAN_370Z4","NISSAN_SKYLINE_GT_R_Z","NISSAN_SKYLINE_GT_R_Z1","NISSAN_SKYLINE_GT_R_Z2","NISSAN_SKYLINE_GT_R_Z3","il_charger_pd","ilpd_charger_black","ilpd_charger_white","il_swatuc","il_silverado_black","il_silverado_red","il_silverado_orange","il_silverado_selvo","CHRYSLER_300_CLPD","350z_red","350z_kiwi","350z_black","350z_silver","350z_green","350z_blue","350z_gold","350z_white","350z_pink","350z_mod","350z_ruben","350z_v","350z_yellow","taxi","crown_white","crown_black","crown_yellow","crown_brown","crown_red","crown_grey","crown_blue","patrol","patrol_pb","patrol_np","patrol_slick","sheriff","whiteuc","blackuc","whited","greyd","whited","blackd","tcg_taurus_security","tcg_taurus_taxi","tcg_taurus_pb_2","tcg_taurus","tcg_taurus_wopb","tcg_taurus_shpb","tcg_taurus_sh","tcg_taurus_uc","tcg_taurus_civ1","tcg_taurus_civ2","240GD","tcg_taurus_civ3","tcg_taurus_civ4","tcg_taurus_civ5","tcg_taurus_civ6","tcg_suburban_uc_black","tcg_suburban_uc_grey","tcg_suburban_uc_white","tcg_suburban_red","tcg_suburban_yellow","tcg_suburban_grey","tcg_suburban_white","tcg_suburban_green","suburban_blue","suburban_black","suburban_maroon","suburban_sandstone","suburban_grey","suburban_white","suburban_fd","suburban_pd","suburban_pd_k9","suburban_pd_stealth","suburban_pd_black","suburban_pd_sheriff","f350_red","f350_blue","f350_pink","f350_white","f350_black","monaco","monaco_grey","monaco_blue","monaco_white","monaco_green", "monaco_red","ram3500","ram3500_grey","ram3500_blue","ram3500_yellow","ram3500_white","sierra","sierra_grey","sierra_blue","sierra_yellow","sierra_pink","tahoe_grey","tahoe_darkblue","tahoe_blue","tahoe_yellow","tahoe_white","tahoe_green","tahoe_black","tahoe_orange","tahoe_pink","tahoe_darkblue_cb","tahoe_grey_cb","tahoe_blue_cb","tahoe_yellow_cb","tahoe_pink_cb","tahoe_white_cb","tahoe_green_cb","tahoe_black_cb","tahoe_orange_cb","il_f350_brush","gmc_ambulance","MERCEDES_BENZ_SLR","PONTIAC_GTO_6","oldtruck","m5_red","m5_grey","m5_blue","m5_c_green","m5_c_black","m5_c_white","h1_black","h1_grey","h1_blue","h1_white","h1_green","rangerover_black","rangerover_grey","rangerover_blue","rangeroverc_red","Cherokee_green","Cherokee_grey","Cherokee_blue","s331_black","s331_grey","s331_blue","s331_yellow","transit","transit_grey","transit_blue","transit_yellow","m5_pd_traffic","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","S1203_TK_CIV_EP1","Car_hatchback","VWGolf","Car_Sedan","SkodaBlue","Skodared","lada1","lada2","LandRover_TK_CIV_EP1","datsun1_civil_3_open","UAZ_Unarmed_TK_CIV_EP1","Tractor","oldtruc2","oldtruc2a","general","challenger_grey","challenger_blue","challenger_yellow","challenger_pink","challenger_white","challenger_green","challenger_red","challenger_orange","NISSAN_240SX_SE","il_fordcv_white","il_fordcv_grey","il_fordcv_black","il_fordcv_darkblue","il_fordcv_maroon","il_fordcv_sandstone","tcg_bmw_m3","tcg_bmw_m3_hamwhite","tcg_bmw_m3_c1","tcg_bmw_m3_c3","tcg_bmw_m3_c4","tcg_bmw_m3_c5","tcg_bmw_m3_c6","tcg_bmw_m3_c7","tcg_bmw_m3_c8","tcg_bmw_m3_c9","il_silverado_white","il_fordcv_taxi","cl_del_mackr","cl_trucktest_mackr","cl_flatbed_mackr","Ural_TK_CIV_EP1","V3S_Open_TK_CIV_EP1","MTVR","V3S_TK_EP1","UralOpen_CDF","KamazOpen","Ural_CDF","schoolbus","Ikarus_TK_CIV_EP1","Ikarus","raptor_black","raptor_grey","raptor_blue","raptor_yellow","raptor_pink","raptor_white","raptor_green","raptor_red","raptor_orange","Cherokee_black","Cherokee_yellow","Cherokee_pink","Cherokee_white","Cherokee_red","Cherokee_orange","rangerover_black","rangerover_yellow","rangerover_pink","rangerover_white","rangerover_green","rangerover_red","rangerover_orange","rangeroverc_black","rangeroverc_white","rangeroverc_grey","s331_pink","s331_white","s331_green","s331_red","s331_orange","s331c_black","s331c_white","s331c_red","s331c_grey","h1_yellow","h1_pink","h1_red","h1_orange","h1c_black","h1c_red","h1c_white","h1c_grey","M1030_US_DES_EP1","ilpd_beat_f101","ilpd_slick_b40_npb","ilpd_slick_b40_PBG","ilpd_slick_b40_pb","tahoe_pd","vil_lublin_AMBU","jailbus","ilpd_beat_f101_sh","pd_cvpi","pd_cvpi_hub","ilpd_slick_f220_npb","ilpd_slick_f220_PBG","tahoe_sh","il_f350sheriff","ilpd_scu_black","ilpd_scu_grey","ilpd_scu_maroon","tahoe_uc_black","tahoe_uc_white","ilf350swat","il_bearcat","ilpd_traffic_t101","ilpd_Traffic_black","ilpd_Traffic_white","tcg_suburban_patrol","tahoe_uc_1_black","tahoe_uc_1_grey","tahoe_uc_1_blue","tahoe_uc_1_green","tahoe_uc_1_white","tahoe_uc_1_maroon","ilpd_unmarked_black","ilpd_unmarked_sandstone","ilpd_unmarked_maroon","ilpd_unmarked_darkblue","ilpd_unmarked_grey","Pickup_PK_TK_GUE_EP1","BTR40_TK_GUE_EP1","UAZ_MG_INS","LandRover_MG_TK_INS_EP1","cl_fuel_mackr","Lada2_TK_CIV_EP1","Kamaz","CHRYSLER_P_limmo","CORVETTE_C6R","DODGE_VIPER_SRT10","Pickup_PK_INS","GAZ_Vodnik","SUV_PMC","ArmoredSUV_PMC","tahoe_uc_1_pink","tahoe_uc_1_yellow","tahoe_uc_1_orange","ilpd_scu_ia","tahoe_supervisor","cooter"];








// array used in taxi missions
civclassarray =
[
"TK_CIV_Takistani01_EP1",
"TK_CIV_Takistani02_EP1",
"TK_CIV_Takistani03_EP1",
"TK_CIV_Takistani04_EP1",
"TK_CIV_Takistani05_EP1",
"TK_CIV_Takistani06_EP1",
"TK_CIV_Woman01_EP1",
"TK_CIV_Woman02_EP1",
"TK_CIV_Woman03_EP1",
"TK_CIV_Worker01_EP1",
"TK_CIV_Worker02_EP1",
"Citizen2_EP1",
"Citizen3_EP1",
"CIV_EuroMan01_EP1",
"CIV_EuroMan02_EP1",
"Dr_Hladik_EP1",
"Functionary1_EP1",
"Functionary2_EP1",
"Haris_Press_EP1",
"Profiteer2_EP1"
];
CLAY_DogEODs = ["PipeBomb","Mine","BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4","suitcase"];
CLAY_DogVehicles = ["dhi_cvpi_p71_gpd_k9"];
civslavearray = ["Worker1","Worker2","Worker3","Worker4"];
civworkerarray = ["Hooker1","Hooker2","Hooker3","Hooker4"];
terroristarray	= ["GUE_Soldier_1", "GUE_Soldier_2", "GUE_Soldier_3"];

if(isServer)then
{
greenlt = false; publicvariable "greenlt";
yellowlt = false; publicvariable "yellowlt";
redlt = false; publicvariable "redlt";
greenlt1 = false; publicvariable "greenlt1";
yellowlt1 = false; publicvariable "yellowlt1";
redlt1 = false; publicvariable "redlt1";
TankenCost = 100; publicvariable "TankenCost";
bombactive = false; publicvariable "bombactive";
fireactive = true; publicvariable "fireactive";
fireactive2 = false; publicvariable "fireactive2";
randomfire = false; publicvariable "randomfire";
fireIsSpawned = false; publicVariable "fireIsSpawned";
gasIsSpawned = false; publicVariable "gasIsSpawned";
fixinggas = false; publicVariable "fixinggas";
fixingfire = false;	publicVariable "fixingfire";
wreckIsSpawned = false;	publicVariable "wreckIsSpawned";
fixingwreck = false; publicVariable "fixingwreck";
mhimusic = false; publicVariable "mhimusic";
still1on = false; publicVariable "still1on";
still2on = false; publicVariable "still2on";
still3on = false; publicVariable "still3on";
onplayerconnected 'publicVariable "GesetzArray";publicVariable "allowedcamera";publicVariable "allowedwar";publicVariable "allowedcarrier";publicVariable "INV_ItemTypenArray";publicvariable "INV_itemstocks";currentTime = daytime; publicvariable "currentTime";';
publicVariable "convoywinner";
};
