if(debug)then{['Mishy', 999999] call INV_AddInvItem};
StartMishy                = 45000;
maxcopbonus		 = 30000;
maxcivbonus 	 	 = 30000;
robb_timeSperre          = 1200;
local_useBankPossible    = true;
maxinsafe                = 300000;
BankRaubKontoverlust     = 4000;
ShopRaubKontovershop     = 0;
ShopRaubProzentVershop   = 0;
rblock			 = 0;
stolencash		 = 0;
Maxbankrobpercentlost    = 0.1;
bank_steuer              = 1;
zinsen_prozent           = 0;
zinsen_dauer             = 1200;
robenable              	 = true;
bnkgeld               = StartMishy;
shopflagarray            = [shop1,shop2,/*shop3,*/shop4];

bankflagarray            =
[mainbank,copbank,atm2,atm4,atm5,atm6,atm7,atm10,atm_pmc,
airatm,atmpf,gunatm,T1ATM,T2ATM,T3ATM,TXATM,fbiatm,
swatatm,jonatm1,jonatm2,IRAatm,copvipbanksheriff,
uoatm,DOJ_ATM1,DOJ_ATM2,DOJ_ATM3,DOJ_ATM4,DOJ_ATM5,mhiatm];

speedcamarray            = [speed1,speed2,speed3,speed4,speed5,speed6,speed7,speed8];
drugsellarray		 = [mdrugsell,cdrugsell,ldrugsell,hdrugsell,whalesell,methsell,organDealer,Illegal_ShipmentSeller,bootlegger];
TankstellenArray         =

[
gaspump1,gaspump2,gaspump3,gaspump4,gaspump5,gaspump6,gaspump7,gaspump8,gaspump9
//fuelshop1,fuelshop2,fuelshop3,fuelshop4,fuelshop5,fuelshop6,fuelshop7,fuelshop8,fuelshop9
/*
(nearestobject[getpos fuelshop1,"Land_A_Fuelstation_Feed"]),
(nearestobject[getpos fuelshop2,"Land_A_Fuelstation_Feed"]),
(nearestobject[getpos fuelshop3,"Land_A_Fuelstation_Feed"]),
(nearestobject[getpos fuelshop4,"Land_A_Fuelstation_Feed"]),
(nearestobject[getpos fuelshop5,"Land_A_Fuelstation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_benzina_schnell","Land_fuelstation_army"],20])
*/
];
