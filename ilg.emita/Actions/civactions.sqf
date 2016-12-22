//Modified Intellectual Property of no one <---- [UKG] WELL SAID!
_role = player;
//action1 = _role addaction ["Test","test.sqf",[1],1,false,true,"",""];
action2 = _role addaction ["Furniture FAQ","furniturehelp.sqf",[1],1,false,true,"","player distance workplace_getjobflag_5 <= 5"];
action2a = _role addaction ["How To Play Paintball","pbhelp.sqf",[1],1,false,true,"","player distance paintballbox <= 30"];

//driving
ILG_DrivingTest = _role addAction ["Take Driving Test","drivingtest.sqf",[],1,false,true,"","player distance dmv <= 4"];
//========================   HOSTAGE  ================================================
action3 = _role addaction ["Take Hostage Mission","hostage.sqf",["getajob_hostage"],1,false,true,"","player distance hostage <= 3 and isciv"];
action4 = _role addaction ["Take Hostage", "noscript.sqf", "[hostage1] join (group player); player groupchat ""Keep the hostage close or you will fail!"";",1,false,true,"","player distance hostage1 < 5"];
//==================================== GANG MENU ======================================================
action5 = _role addaction ["Gang Menu","maindialogs.sqf",["gangmenu"],1,false,true,"","player distance rathaus <= 3 and isciv"];
//====================================== BANK ROB =====================================================
action6 = _role addaction ["Steal from safe 1","bankrob.sqf", ["ausrauben", safe1, "safe1"],1,false,true,"","Safecracked1 and isciv and player distance Safe1 <= 2"];
action7 = _role addaction ["Crack Safe", "CrackSafe.sqf",["safe1"],1,false,True,"","not SafeCracked1 and isciv and player distance Safe1 <= 2"];
/*
action8 = _role addaction ["Steal from safe 2","bankrob.sqf", ["ausrauben", safe2, "safe2"],1,false,true,"","Safecracked2 and isciv and player distance Safe2 <= 2"];
action9 = _role addaction ["Crack Safe 2", "CrackSafe.sqf",["safe2"],1,false,True,"","not SafeCracked2 and isciv and player distance Safe2 <= 2"];
action10 = _role addaction ["Steal from safe 3","bankrob.sqf", ["ausrauben", safe3, "safe3"],1,false,true,"","Safecracked3 and isciv and player distance Safe3 <= 2"];
action11 = _role addaction ["Crack Safe 3", "CrackSafe.sqf",["safe3"],1,false,True,"","not SafeCracked3 and isciv and player distance Safe3 <= 2"];
*/
//===================================== ASSASSINATION =================================================
action13 = _role addaction ["Get Assassination job","assassination.sqf",["getajob_assassin"],1,false,true,"","player distance assassin <= 3 and isciv"];
//========================================= HUNTING ===================================================
action15 = _role addaction ["Take boar meat","noscript.sqf",'_no = ceil(random 7);if (((call INV_GetOwnWeight) + ("boar" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["wildboar"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["wildboar"],  3] select 0);["boar", _no] call INV_AddInvItem;player groupchat format["you got %1 boar meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["wildboar"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["wildboar"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["wildboar"],  3] select 0) and isciv'];
action16 = _role addaction ["Take cow meat","noscript.sqf",'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("rawcow" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["cow01"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["cow01"],  3] select 0);["rawcow", _no] call INV_AddInvItem;player groupchat format["you got %1 raw cow meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["cow01"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["cow01"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["cow01"],  3] select 0) and isciv'];
//===================================== TARGET RESET ==================================================
action17 = _role addaction ["Reset Targets","noscript.sqf",'{_x animate["terc",0]} foreach (nearestobjects [getpos player, ["TargetEpopup"],  500])',1,true,true,"",'player distance targetrange1 < 10'];
action18 = _role addaction ["Reset targets","noscript.sqf",'{_x animate["terc",0]} foreach (nearestobjects [getpos player, ["TargetEpopup"],  500])',1,true,true,"",'player distance targetrange2 < 10'];
action185 = _role addaction ["Reset targets","noscript.sqf",'{_x animate["terc",0]} foreach (nearestobjects [getpos player, ["TargetEpopup"],  500])',1,true,true,"",'player distance IRAtargets < 100'];
//===================================== IMPOUND AREA==================================================
action19 = _role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","player distance impoundbuy <= 5"];
action19a = _role addaction ["Impound Lot(Aviation)","maindialogs.sqf",["impound"],1,false,true,"","player distance airatm <= 5"];
action19b = _role addaction ["Impound Lot(Watercraft)","maindialogs.sqf",["impound"],1,false,true,"","player distance civ_boat <= 5"];
//==================================== OBJECT ACTIONS =================================================
action_Juan_1 = _role addaction ["Move Object","noscript.sqf",'[] call Juan_Move_obj;',1,true,true,"",'(player distance ((nearestobjects [(getpos player),ILG_Moveable_Objects,10]) select 0)) < 5'];
action13 = _role addaction ["Up Elevator","elevator.sqf",[1],1,false,true,"",'player distance getmarkerpos "elevator1" <= 5'];
action13a = _role addaction ["Down Elevator","elevator.sqf",[2],1,false,true,"",'player distance elevator2 <= 5'];
//action21 = _role addaction ["Remove Bench","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Bench_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};
//etevehicle (nearestobjects [getpos player, ["Land_Bench_EP1"],  3] select 0);["Land_Bench_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a washing machine";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Bench_EP1"],  3] select 0) < 1.25'];
action22 = _role addaction ["Take Scuba Gear","noscript.sqf",'if (((call INV_GetOwnWeight) + ("gnt_scubaw" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["gnt_scubaw"],  10] select 0);["gnt_scubaw", 1] call INV_AddInvItem;player groupchat "you picked up scuba gear";',1,true,true,"",'player distance (nearestobjects [getpos player, ["gnt_scubaw"],  10] select 0) < 5'];
action23 = _role addaction ["Remove Cabinet","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Cabinet_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Cabinet_EP1"],  3] select 0);["Land_Cabinet_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a Cabinet";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Cabinet_EP1"],  3] select 0) < 1.25'];
action24 = _role addaction ["Remove Carpet","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Carpet_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Carpet_EP1"],  3] select 0);["Land_Carpet_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a Carpet";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Carpet_EP1"],  3] select 0) < 1.25'];
action25 = _role addaction ["Remove Chest","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Chest_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Chest_EP1"],  3] select 0);["Land_Chest_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a Chest";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Chest_EP1"],  3] select 0) < 1.25'];
action26 = _role addaction ["Remove Small Tbl","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_stand_small_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_stand_small_EP1"],  3] select 0);["Land_stand_small_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a Small Tbl";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_stand_small_EP1"],  3] select 0) < 1.25'];
action27 = _role addaction ["Remove Table","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Table_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Table_EP1"],  3] select 0);["Land_Table_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a Table";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Table_EP1"],  3] select 0) < 1.25'];
action28 = _role addaction ["Remove Road Cone","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadcone" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0);["roadcone", 1] call INV_AddInvItem;player groupchat "you picked up a road cone";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0) < 5'];
action29 = _role addaction ["Remove TV","noscript.sqf",'if (((call INV_GetOwnWeight) + ("SmallTV" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["SmallTV"],  3] select 0);["SmallTV", 1] call INV_AddInvItem;player groupchat "you picked up a barracade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["SmallTV"],  3] select 0) < 1.25'];
action30 = _role addaction ["Open/close gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and isciv'];
action31 = _role addaction ["Remove Folding Table","noscript.sqf",'if (((call INV_GetOwnWeight) + ("FoldTable" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["FoldTable"],  3] select 0);["FoldTable", 1] call INV_AddInvItem;player groupchat "you picked up a barracade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["FoldTable"],  3] select 0) < 1.25'];
action32 = _role addaction ["Remove Small Table","noscript.sqf",'if (((call INV_GetOwnWeight) + ("SmallTable" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["SmallTable"],  3] select 0);["SmallTable", 1] call INV_AddInvItem;player groupchat "you picked up a barracade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["SmallTable"],  3] select 0) < 1.25'];
action36 = _role addaction ["Remove Window Barracade","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Fence_corrugated_plate" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Fence_corrugated_plate"],  3] select 0);["Fence_corrugated_plate", 1] call INV_AddInvItem;player groupchat "you picked up a barracade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Fence_corrugated_plate"],  3] select 0) < 1'];
action37 = _role addaction ["Remove Folding Chair","noscript.sqf",'if (((call INV_GetOwnWeight) + ("FoldChair" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["FoldChair"],  3] select 0);["FoldChair", 1] call INV_AddInvItem;player groupchat "you picked up a folding chair";',1,true,true,"",'player distance (nearestobjects [getpos player, ["FoldChair"],  3] select 0) < 1.25'];
action38 = _role addaction ["Remove Chair","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Chair_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Chair_EP1"],  3] select 0);["Land_Chair_EP1", 1] call INV_AddInvItem;player groupchat "you picked up a chair";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Chair_EP1"],  3] select 0) < 1.25'];
action39 = _role addaction ["Remove Garbage Can","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Garbage_can" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Garbage_can"],  3] select 0);["Garbage_can", 1] call INV_AddInvItem;player groupchat "you picked up a garbage can";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Garbage_can"],  3] select 0) < 1.25'];
action40 = _role addaction ["Remove Washing Machine","noscript.sqf",'if (((call INV_GetOwnWeight) + ("MAP_washing_machine" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["MAP_washing_machine"],  3] select 0);["MAP_washing_machine", 1] call INV_AddInvItem;player groupchat "you picked up a washing machine";',1,true,true,"",'player distance (nearestobjects [getpos player, ["MAP_washing_machine"],  3] select 0) < 1.25'];
action101 = _role addaction ["Lower Gates","lgate6.sqf",[],1,false,true,"","isciv and player distance terrgate <= 12"];

//COCK HQ
//Linnet_Clothes = _role addaction ["Switch to Badass Clothes","noscript.sqf",'["Soldier_Bodyguard_AA12_PMC"] call clothes;',1,true,true,"",'player distance Cock_Mansion_Shop < 5 && isciv && ((getPlayerUID player) in Cock_HQ_UID)'];
//Linnet_Gate = _role addaction ["Open Gate","noscript.sqf",'[Cock_HQ_Gate] spawn LinLib_OpenGate;',1,true,true,"","isciv && ((getPlayerUID player) in Cock_HQ_UID) && player distance Cock_HQ_Gate <= 12"];
//==================================== ILG GOV //EMITA STYLE =================================================
action45 = _role addaction ["Elect a Governor","maindialogs.sqf",["wahlen"],1,false,true,"","player distance rathaus <= 3"];
action46 = _role addaction ["Change the Law","maindialogs.sqf",["gesetz"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
action47 = _role addaction ["Change taxes","maindialogs.sqf",["steuern"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
action223 = _role addaction ["Locate Gov ($75,000)","noscript.sqf",'[] call Locate_Gov;',1,true,true,"",'player distance rathaus <= 3 and isciv'];
actioncollecttaxes = _role addaction ["Collect Tax Money","mayor.sqf",["CollectTaxes"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
ILG_DisableElection = _role addaction ["Disable Elections","toggleelections.sqf",["disable"],1,false,true,"","ismayor && isciv && player distance rathaus <= 3 && ILG_Voting_Enable"];
ILG_EnableElection = _role addaction ["Enable Elections","toggleelections.sqf",["enable"],1,false,true,"","ismayor && isciv && player distance rathaus <= 3 && !ILG_Voting_Enable"];
///ILG_Voting_Enable


//===================================== CONVOY CASH ===================================================
convoy_rob_action = _role addAction ["<t color='#FF0000'>Rob Bank Truck</t>", "stealgovmoney.sqf",[""],1,false,true,"","isciv && player distance convoytruck < 5 && (call INV_isArmed)"];
//===================================== BUY INSURANCE ===================================================
//action49 = _role addaction [format["Buy Bank Insurance ($%1)", ("bankversicherung" call INV_getitemBuyCost)],"noscript.sqf",'if("Mishy" call INV_GetItemAmount < ("bankversicherung" call INV_getitemBuyCost))exitwith{player groupchat "not enough money"};["Mishy", -("bankversicherung" call INV_getitemBuyCost)] call INV_AddInvItem;["bankversicherung", 1] call INV_AddInvItem;player groupchat format["you bought bank insurance for $%1", ("bankversicherung" call INV_getitemBuyCost)];',1,false,true,"","player distance dmv <= 3"];
//======================================= CRIMELOG ====================================================
action5001 = _role addaction ["Crime Log","maindialogs.sqf",["coplog"],1,false,true,"","player distance rathaus <= 3"];
//======================================== SLAVES =====================================================
//action49 = _role addaction [format ["Buy Slave ($%1)", slave_cost],"slaves.sqf", ["slave"],1,false,true,"","player distance boatshop3 <= 5 and isciv"];
//==================================== PRIVATE STORAGE ================================================
//action50 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance storage < 7"];
action123 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house1 < 3"];
action124 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house2 < 3"];
action125 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house3 < 3"];
action126 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house4 < 3"];
action127 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house5 < 3"];
action128 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house6 < 3"];
action129 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house7 < 3"];
action130 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house8 < 3"];
action131 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house9 < 3"];
action132 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house10 < 3"];
action133 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house11 < 3"];
action133 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house12 < 2"];
action133 = _role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance house13 < 2"];
//========================================= BAIL ======================================================
action51 = _role addaction [format ["Pay Bail", slave_cost],"maindialogs.sqf", ["bail"],1,false,true,"","player distance bailflag <= 3 and isciv"];
//===================================== ITEM PROCESS ==================================================
action53 = _role addaction ["Process Diamond Ore","itemprocess.sqf",["diamond rock", "diamond", 10, "diamondp"],1,false,true,"","player distance diamond_processing <= 5 and isciv"];
action54 = _role addaction ["Process Meth","itemprocess1.sqf",["pharm", "meth", 2, ""],1,false,true,"","player distance methlab <= 5 and isciv"];
action55 = _role addaction ["Process Oil","itemprocess.sqf",["Oil", "OilBarrel", 1, "oilukp"],1,false,true,"","player distance Oil_1 <= 5 and isciv"];
action56 = _role addaction ["Process Wheat","itemprocess.sqf",["getreide", "Bread", 2, "Baker"],1,false,true,"","player distance bakery <= 5 and isciv"];
action57 = _role addaction ["Process Strawberries","itemprocess.sqf",["straw", "Frozens", 3, "Baker"],1,false,true,"","player distance bakery <= 5 and isciv"];
//ga1
action58 = _role addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang))"];
action59 = _role addaction ["Process Cocaine","itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5, "cocaine ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang))"];
//ga2
action60 = _role addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang))"];
action61 = _role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang))"];
//ga3
action62 = _role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang))"];
action63 = _role addaction ["Process Marijuana","itemprocess.sqf",["Unprocessed_Marijuana", "marijuana", 5, "marijuana ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang))"];
//ga4
action64 = _role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga4"],1,false,true,"","_control = gangarea4 getvariable ""control"";!isnil ""_control"" and player distance gangarea4 <= 5 and (_control == (call INV_mygang))"];
action65 = _role addaction ["Process Marijuana","itemprocess.sqf",["Unprocessed_Marijuana", "marijuana", 5, "marijuana ga4"],1,false,true,"","_control = gangarea4 getvariable ""control"";!isnil ""_control"" and player distance gangarea4 <= 5 and (_control == (call INV_mygang))"];
//ga5
actiongang5h = _role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga5"],1,false,true,"","_control = gangarea5 getvariable ""control"";!isnil ""_control"" and player distance gangarea5 <= 5 and (_control == (call INV_mygang))"];
actiongang5c = _role addaction ["Process Cocaine","itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5, "cocaine ga5"],1,false,true,"","_control = gangarea5 getvariable ""control"";!isnil ""_control"" and player distance gangarea5 <= 5 and (_control == (call INV_mygang))"];
//Dirty Money
action559 = _role addaction ["Launder Dirty Money","itemprocess.sqf",["dirtymoneh", "Mishy", 1, "dirtymoneylicense"],1,false,true,"","player distance dirtymoney1 <= 5 and isciv"];
glassproocess = _role addaction ["Process Sand","itemprocess.sqf",["sand", "glass", 4, "glassblowt"],1,false,true,"","player distance glassblower <= 5 and isciv"];
//======================================== WORKERS =====================================================
action66 = _role addaction [format ["Buy Hooker ($%1)", huren_cost],"worker1.sqf", ["holen"],1,false,true,"","(player distance brothela <= 2 or player distance brothel <= 2) and isciv"];
action67 = _role addaction [format ["Buy K9 ($%1)", dog_cost],"copdog.sqf", ["buydog"],1,false,true,"","player distance dogspawn <= 5 and (player == cop1 or player == cop2)"];
//action68 = _role addaction [format ["Buy K9 ($%1)", dog_cost],"civdog.sqf", ["buydog"],1,false,true,"","player distance dogspawn1 <= 5"];
//action71 = _role addaction ["Legal Truck Mission","trucking.sqf",[1],1,false,true,"","!cmissionactive2 and !cmissionactive1 and !cmissionactive and isciv and player distance truckshop <=5"];
//action72 = _role addaction ["Illegal Truck Mission","trucking.sqf",[2],1,false,true,"","!cmissionactive2 and !cmissionactive1 and !cmissionactive and isciv and player distance truckshop <=5"];
//action73 = _role addaction ["Unload Truck","trucking.sqf",[3],1,false,true,"","cmissionactive1 and isciv and (player distance wood_1 <= 3 or player distance shop2 <= 3 or player distance shop1 <= 3 or player distance ressourcenfabrik_1 <= 3 or player distance wfgunbox <= 3)"];
//action74 = _role addaction ["Unload Truck","trucking.sqf",[8],1,false,true,"","cmissionactive1 and isciv and (player distance methsell <= 3 or player distance ldrugsell <= 3 or player distance hdrugsell <= 3 or player distance mdrugsell <= 3 or player distance cdrugsell <= 3)"];
//action75 = _role addaction ["Cancel Truck Mission","trucking.sqf",[9],1,false,true,"","cmissionactive or cmissionactive1 or cmissionactive2"];
//action76 = _role addaction ["Load Goods","trucking.sqf",[6],1,false,true,"","cmissionactive and isciv and (player distance resourcesell <= 3 or player distance assassinshop <= 3 or player distance shop4 <= 3 or player distance scarshop4 <= 3 or player distance tuning1 <= 3)"];
//action77 = _role addaction ["Load Illegal Goods","trucking.sqf",[7],1,false,true,"","cmissionactive2 and isciv and (player distance resourcesell <= 3 or player distance assassinshop <= 3 or player distance shop4 <= 3 or player distance scarshop4 <= 3 or player distance tuning1 <= 3)"];
//action78 = _role addaction ["Get in Trailer","trucking.sqf",[4],1,true,true,"",'_vcl = (nearestobjects [getpos player, ["cl_mackr","cl_trucktest_mackr","cl_flatbed_mackr"], 5] select 0);player distance _vcl < 5 and _vcl in INV_ServerVclArray'];
//======================================= TAXI Missions ====================================================
//action80 = _role addaction ["Get courier job","delivery.sqf", ["getajob_delivery"],1,false,true,"","(player distance taxishop <= 5) and isciv"];
//action81 = _role addaction ["Cancel delivery mission","delivery.sqf", ["cancel"],1,false,true,"","(player distance taxishop <= 5) and isciv and alreadygotaworkplacejob == 1"];
action82 = _role addaction ["Get taxi job","taxi.sqf", ["getajob_taxi"],1,false,true,"","player distance jobcentre <= 5 and isciv"];
action83 = _role addaction ["Finish taxi mission","taxi.sqf", ["canceljob_taxi"],1,false,true,"","(player distance jobcentre <= 5) and isciv and workplacejob_taxi_active"];
//====================================== VEHICLE ACTIONS ================================================
action87 = _role addaction ["Pull out","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "pullout.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and count (crew _vcl) > 0 and (_vcl call Is_Player_Veh) and (call INV_isArmed)'];
action88 = _role addaction [localize "STRS_addAction_vehicleinfo","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "vehinfo.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and (_vcl call Is_Player_Veh)'];
//======================================== GANG FLAGS ===================================================
action73 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea1, "neutralise"],1,false,true,"",'_control = gangarea1 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea1 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];
action74 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea2, "neutralise"],1,false,true,"",'_control = gangarea2 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea2 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];
action75 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea3, "neutralise"],1,false,true,"",'_control = gangarea3 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea3 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];
action76 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea4, "neutralise"],1,false,true,"",'_control = gangarea4 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea4 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];
action76 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea5, "neutralise"],1,false,true,"",'_control = gangarea5 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea5 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];
action77 = _role addaction ["Capture flag","gangflags.sqf",[gangarea1, "capture"],1,false,true,"",'_control = gangarea1 getvariable "control";player distance gangarea1 <= 10 and isnil "_control" and gangmember and !pickingup'];
action78 = _role addaction ["Capture flag","gangflags.sqf",[gangarea2, "capture"],1,false,true,"",'_control = gangarea2 getvariable "control";player distance gangarea2 <= 10 and isnil "_control" and gangmember and !pickingup'];
action79 = _role addaction ["Capture flag","gangflags.sqf",[gangarea3, "capture"],1,false,true,"",'_control = gangarea3 getvariable "control";player distance gangarea3 <= 10 and isnil "_control" and gangmember and !pickingup'];
action80 = _role addaction ["Capture flag","gangflags.sqf",[gangarea4, "capture"],1,false,true,"",'_control = gangarea4 getvariable "control";player distance gangarea4 <= 10 and isnil "_control" and gangmember and !pickingup'];
action80 = _role addaction ["Capture flag","gangflags.sqf",[gangarea5, "capture"],1,false,true,"",'_control = gangarea5 getvariable "control";player distance gangarea5 <= 10 and isnil "_control" and gangmember and !pickingup'];
//======================================== SHOP EXPORT ==================================================
_num1 = (shop1 call INV_getshopnum);
_num2 = (shop2 call INV_getshopnum);
_num4 = (shop4 call INV_getshopnum);
_num5 = (bailflag call INV_getshopnum);
action99 = _role addaction ["Shop 1 export","shopdialogs.sqf",[_num1],1,false,true,"","player distance shop1export <= 3"];
action99 = _role addaction ["Shop 2 export","shopdialogs.sqf",[_num2],1,false,true,"","player distance shop2export <= 3"];
action102 = _role addaction ["Shop 3 export","shopdialogs.sqf",[_num4],1,false,true,"","player distance shop4export <= 3"];
action103 = _role addaction ["Food and Candy","shopdialogs.sqf",[_num5],1,false,true,"",'player distance (nearestobjects [getpos player, ["ibr_van_BNK"],  10] select 0) < 3'];
//======================================= GANG GUNSHOPS ==================================================
_num11  = (gangarea1 call INV_getshopnum);
_num12  = (gangarea2 call INV_getshopnum);
_num13  = (gangarea3 call INV_getshopnum);
_num14  = (gangarea4 call INV_getshopnum);
_num17  = (gangarea5 call INV_getshopnum);
action104 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num11],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang))"];
action105 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num12],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang))"];
action106 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num13],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang))"];
action107 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num14],1,false,true,"","_control = gangarea4 getvariable ""control"";!isnil ""_control"" and player distance gangarea4 <= 5 and (_control == (call INV_mygang))"];
gs5action = _role addaction ["Gang Shop","shopdialogs.sqf",[_num17],1,false,true,"","_control = gangarea5 getvariable ""control"";!isnil ""_control"" and player distance gangarea5 <= 5 and (_control == (call INV_mygang))"];
//===================================== Gas station Robbing===============================================
action108 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 1"],1,false,true,"","isciv and station1money >= 5000 and player distance fuelshop1 <= 2"];
action109 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 2"],1,false,true,"","isciv and station2money >= 5000 and player distance fuelshop2 <= 2"];
action110 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 3"],1,false,true,"","isciv and station3money >= 5000 and player distance fuelshop3 <= 2"];
action111 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 4"],1,false,true,"","isciv and station4money >= 5000 and player distance fuelshop4 <= 2"];
action112 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 5"],1,false,true,"","isciv and station5money >= 5000 and player distance fuelshop5 <= 2"];
action113 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 6"],1,false,true,"","isciv and station6money >= 5000 and player distance fuelshop6 <= 2"];
action114 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 7"],1,false,true,"","isciv and station7money >= 5000 and player distance fuelshop7 <= 2"];
action115 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 8"],1,false,true,"","isciv and station8money >= 5000 and player distance fuelshop8 <= 2"];
action116 = _role addaction ["Rob Gas Station","robthestations.sqf",["station 9"],1,false,true,"","isciv and station9money >= 5000 and player distance fuelshop9 <= 2"];
action117 = _role addaction ["Rob Pharmacy","robpharmacy.sqf",["pharmacy"],1,false,true,"","isciv and pharmmoney >= 5000 and player distance pharmacy <= 2"];
action118 = _role addaction ["Rob The Long Branch Bar","robbar.sqf",["bar1"],1,false,true,"","isciv and barmoney >= 5000 and player distance pub1 <= 2"];
action119 = _role addaction ["Rob ILGs Watering Hole Bar","robbar.sqf",["bar2"],1,false,true,"","isciv and barmoney1 >= 5000 and player distance pub2 <= 2"];
action120 = _role addaction ["Rob Limos Long Drink Stop","robbar.sqf",["bar3"],1,false,true,"","isciv and barmoney2 >= 5000 and player distance pub3 <= 2"];
action121 = _role addaction ["Rob Cr1TiKaL's Topless Gay Bar","robbar.sqf",["bar4"],1,false,true,"","isciv and barmoney3 >= 5000 and player distance pub4 <= 2"];
//========================================UNFLIP VEHICLES================================
actionunFlip = _role addaction ["Unflip vehicle","unflipvehicle.sqf",["unflip"],1,false,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and (_vcl call Is_Player_Veh)'];
//========================================DONATOR SHOPS===================================================
_num15 = (donatebuy call INV_getshopnum);
actiondonate = _role addaction ["Donator Shop","shopdialogs.sqf",[_num15],1,false,true,"","player distance donatebuy <= 5"];
_num16 = (ukgrecompense call INV_getshopnum);
action296 = _role addaction ["<t color=""#00FF00"">" +"ILL Phone", "handy.sqf",[],1,false,true,"",'ILG_Phone_Action_Enable'];

//======================================== CIVILIAN SKIN CHANGING==========================================================
actionskinshop3 = _role addaction ["Priest ($0)","noscript.sqf",'["Priest"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop4 = _role addaction ["Profiteer (Red) ($0)","noscript.sqf",'["Profiteer4"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop5 = _role addaction ["Citizen Green ($0)","noscript.sqf",'["Citizen4"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop8 = _role addaction ["Woodlander Camo ($0)","noscript.sqf",'["Woodlander3"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop9 = _role addaction ["Sketchy Surgeon ($0)","noscript.sqf",'["Dr_Hladik_EP1"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop10 = _role addaction ["Camo Pants ($0)","noscript.sqf",'["ibr_lingorman2"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop11 = _role addaction ["Trucker Orange ($0)","noscript.sqf",'["sah_civilian4_pants"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionskinshop12 = _role addaction ["Islander ($0)","noscript.sqf",'["sah_civilian2_pants"] call clothes;',1,true,true,"",'player distance skinshop < 3 and isciv'];
actionmil2 = _role addaction ["Switch to IRA Rebel","noscript.sqf",'["SG_IRA_Soldier_1"] call clothes;',1,true,true,"",'player distance IRAwep < 5 and isciv'];
actionUOSKIN1 = _role addaction ["Put on the Burglar/Thief clothes","noscript.sqf",'["GUE_Soldier_3"] call clothes;',1,true,true,"",'player distance uoatm < 5 and isciv'];
actionUOSKIN2 = _role addaction ["Put on the Criminal/Outlaw clothes","noscript.sqf",'["GUE_Soldier_AA"] call clothes;',1,true,true,"",'player distance uoatm < 5 and isciv'];
actionUOSKIN3 = _role addaction ["Put on the Veteran clothes","noscript.sqf",'["GUE_Soldier_AR"] call clothes;',1,true,true,"",'player distance uoatm < 5 and isciv'];
actionUOSKIN4 = _role addaction ["Put on the Director clothes","noscript.sqf",'["GUE_Commander"] call clothes;',1,true,true,"",'player distance uoatm < 5 and isciv'];

gangareaskin1 = _role addaction ["Switch to Gang Area 1 Clothing","noscript.sqf",'["TK_Aziz_EP1"] call clothes;',1,true,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang)) and isciv"];
gangareaskin2 = _role addaction ["Switch to Gang Area 2 Clothing","noscript.sqf",'["TK_Commander_EP1"] call clothes;',1,true,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang)) and isciv"];
gangareaskin3 = _role addaction ["Switch to Gang Area 3 Clothing","noscript.sqf",'["TK_Aziz_EP1"] call clothes;',1,true,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang)) and isciv"];
gangareaskin4 = _role addaction ["Switch to Gang Area 4 Clothing","noscript.sqf",'["TK_Commander_EP1"] call clothes;',1,true,true,"","_control = gangarea4 getvariable ""control"";!isnil ""_control"" and player distance gangarea4 <= 5 and (_control == (call INV_mygang)) and isciv"];
//========================================CHOP SHOP ===============================================
action122 = _role addaction ["Chop Shop Vehicle","chopshop.sqf",[""],1,false,true,"","isciv and player distance chopshop1 <= 2"];
action124 = _role addaction ["Remove Speed Upgrade","Juan\Civs\SUremove.sqf",[""],1,false,true,"","player distance SUAI <= 3"];
//========================================MAFIA==========================================================
actionmaf = _role addaction ["Get Job","noscript.sqf",'[] call getmafjob;',1,true,true,"",'player distance mafs < 10 and ("mafial" call INV_HasLicense) and !hasjob'];
actionhowtomafia = _role addaction ["How to earn Street Reputation?","streetrephint.sqf",["mafs"],1,false,true,"","player distance mafs <= 15"];
actionmafiaclothes = _role addaction ["Switch to Mafia Suit","noscript.sqf",'["Functionary1"] call clothes;',1,true,true,"",'(player distance mafs < 10) && ("mafial" call INV_HasLicense) && ((typeOf player) != "Functionary1"))'];
actionpmc = _role addaction ["Switch to PMC Clothes","noscript.sqf",'["Dixon_PMC"] call clothes;',1,true,true,"",'player distance pmcstore < 10 and ("pmcl" call INV_HasLicense)'];
actionsoa = _role addaction ["Switch to Sons of Anarchy Outfit","noscript.sqf",'["Rocker2"] call clothes;',1,true,true,"",'player distance pubSOA < 10'];
actionfsave = _role addaction ["Vehicle Retrieval Point","noscript.sqf",'[] call LinLib_fnc_VehicleMenu;',1,true,true,"",'player distance savepoint < 10'];
actionZipCar = _role addaction ["Put Civilian in Car","CivtoCivCar.sqf",'',1,true,true,"",'(animationState ((nearestObjects [player, ["Man"], 5]) select 1) == "CivilSitting01") && ((nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) call Is_Player_Veh)'];
HideoutActions = _role addaction ["Remove Hideout","noscript.sqf",'((nearestObjects [player, ["Land_tent_east"], 10]) select 0) call LinLib_HideoutDelete;',1,true,true,"",'(player distance ((nearestObjects [player, ["Land_tent_east"], 10]) select 0)) < 10'];
actionBodyBag = _role addaction ["Harvest Organs","noscript.sqf",'[2] execVM "bodyBags.sqf";',1,true,true,"",'(player distance ((nearestObjects [player, ["BODY"], 3]) select 0)) < 3'];
//========================================Faction Actions===============================================
actionaclass = _role addaction ["Switch to Gang Outfit (Polish Tracky)","noscript.sqf",'["Ins_Lopotev"] call clothes;',1,true,true,"",'player distance aclassatm < 10'];
actionaclass = _role addaction ["Switch to Gang Outfit (Operator)","noscript.sqf",'["Soldier_TL_PMC"] call clothes;',1,true,true,"",'player distance aclassatm < 10'];
actionsyzagy = _role addaction ["Switch to Gang Outfit","noscript.sqf",'["Soldier_Bodyguard_AA12_PMC"] call clothes;',1,true,true,"",'player distance syzygyatm < 10'];

//=======================================PMC===========================================
action_PMC_C1 = _role addaction ["PMC-Clothes: Defensive Marksman","noscript.sqf",'["Soldier_Sniper_PMC"] call clothes;',1,true,true,"",'player distance pmcAI < 20 && isciv && ((getPlayerUID player) in ILG_PMC) && ("pmclicense"call INV_HasLicense)'];
action_PMC_C2 = _role addaction ["PMC-Clothes: Field Technican","noscript.sqf",'["Soldier_Engineer_PMC"] call clothes;',1,true,true,"",'player distance pmcAI < 20 && isciv && ((getPlayerUID player) in ILG_PMC) && ("pmclicense"call INV_HasLicense)'];
action_PMC_C3 = _role addaction ["PMC-Clothes: Field Medic","noscript.sqf",'["Soldier_Medic_PMC"] call clothes;',1,true,true,"",'player distance pmcAI < 20 && isciv && ((getPlayerUID player) in ILG_PMC) && ("pmclicense"call INV_HasLicense)'];
action_PMC_C4 = _role addaction ["PMC-Clothes: Tanny","noscript.sqf",'["Tanny_PMC"] call clothes;',1,true,true,"",'player distance pmcAI < 20 && isciv && ((getPlayerUID player) in ILG_PMC) && ("pmclicense"call INV_HasLicense)'];
action_PMC_C5 = _role addaction ["PMC-Clothes: Tactical Pilot","noscript.sqf",'["Soldier_Pilot_PMC"] call clothes;',1,true,true,"",'player distance pmcAI < 20 && isciv && ((getPlayerUID player) in ILG_PMC) && ("pmclicense"call INV_HasLicense)'];

//=======================================Donator Clothing=================================
Tier3Skin1 = _role addaction ["Tier III Skin 1","noscript.sqf",'["TK_Soldier_Officer_EP1"] call clothes;',1,true,true,"",'player distance T3ATM < 3'];
Tier3Skin2 = _role addaction ["Tier III Skin 2","noscript.sqf",'["TK_Soldier_Pilot_EP1"] call clothes;',1,true,true,"",'player distance T3ATM < 3'];
Tier3Skin3 = _role addaction ["Tier III Skin 3","noscript.sqf",'["TK_Soldier_LAT_EP1"] call clothes;',1,true,true,"",'player distance T3ATM < 3'];
Tier3Skin4 = _role addaction ["Tier III Skin 4","noscript.sqf",'["TK_Special_Forces_TL_EP1"] call clothes;',1,true,true,"",'player distance T3ATM < 3'];
Tier3Skin5 = _role addaction ["Tier III Skin 5","noscript.sqf",'["TK_INS_Soldier_AR_EP1"] call clothes;',1,true,true,"",'player distance T3ATM < 3'];

TierXSkin1 = _role addaction ["Tier X Skin 1","noscript.sqf",'["TK_Soldier_Sniper_EP1"] call clothes;',1,true,true,"",'player distance TXATM < 3'];
TierXSkin2 = _role addaction ["Tier X Skin 2","noscript.sqf",'["CIV_EuroWoman01_EP1"] call clothes;',1,true,true,"",'player distance TXATM < 3'];
TierXSkin3 = _role addaction ["Tier X Skin 3","noscript.sqf",'["CIV_EuroWoman02_EP1"] call clothes;',1,true,true,"",'player distance TXATM < 3'];
TierXSkin4 = _role addaction ["Tier X Skin 4","noscript.sqf",'["TK_CIV_Woman03_EP1"] call clothes;',1,true,true,"",'player distance TXATM < 3'];
TierXSkin5 = _role addaction ["Tier X Skin 5","noscript.sqf",'["TK_CIV_Takistani03_EP1"] call clothes;',1,true,true,"",'player distance TXATM < 3'];

Tier2Skin1 = _role addaction ["Tier II Skin 1","noscript.sqf",'["Ins_Lopotev"] call clothes;',1,true,true,"",'player distance T2ATM < 3'];

//=======================================Factions============================================

//mhimusicon = _role addaction ["Turn on Music","Steve\factions\mhimusicon.sqf",[""],1,false,true,"",'player distance mhihouse <= 30 and (!mhimusic)'];
//mhimusicoff = _role addaction ["Turn off Music","Steve\factions\mhimusicoff.sqf",[""],1,false,true,"",'player distance mhihouse <= 30 and (mhimusic)'];

//=======================================Moonshine============================================
/*
startstill1 = _role addaction ["Start the Still","noscript.sqf",'[1] execVM "moonshine.sqf";',1,true,true,"",'player distance still1 <= 3 and !(still1on)'];
stopstill1 = _role addaction ["Stop the Still","noscript.sqf",'[2] execVM "moonshine.sqf";',1,true,true,"",'player distance still1 <= 3 and still1on'];
startstill2 = _role addaction ["Start the Still","noscript.sqf",'[3] execVM "moonshine.sqf";',1,true,true,"",'player distance still2 <= 3 and !(still2on)'];
stopstill2 = _role addaction ["Stop the Still","noscript.sqf",'[4] execVM "moonshine.sqf";',1,true,true,"",'player distance still2 <= 3 and still2on'];
startstill3 =_role addaction ["Start the Still","noscript.sqf",'[5] execVM "moonshine.sqf";',1,true,true,"",'player distance still3 <= 3 and !(still3on)'];
stopstill3 = _role addaction ["Stop the Still","noscript.sqf",'[6] execVM "moonshine.sqf";',1,true,true,"",'player distance still3 <= 3 and still3on'];
moonshineprocess1 = _role addaction ["Make Moonshine","itemprocess.sqf",["apple", "moonshine", 10, ""],1,false,true,"","player distance still1 <= 3 and still1on"];
moonshineprocess2 = _role addaction ["Make Moonshine","itemprocess.sqf",["apple", "moonshine", 10, ""],1,false,true,"","player distance still2 <= 3 and still2on"];
moonshineprocess3 = _role addaction ["Make Moonshine","itemprocess.sqf",["apple", "moonshine", 10, ""],1,false,true,"","player distance still3 <= 3 and still3on"];
*/

actionMoonshine = _role addaction ["Start Moonshine","startmoonshine.sqf",[""],1,false,true,"",'_still = (nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0); _isStill = (_still getVariable ["IsStill", false]); (player distance _still < 5) && _isStill && !(_still getVariable ["Running", false])'];
actionMoonshine = _role addaction ["Cancel Moonshine","noscript.sqf","[] spawn moonshineEnd;",1,false,true,"",'_still = (nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0); _isStill = (_still getVariable ["IsStill", false]); (player distance _still < 5) && _isStill && (_still getVariable ["Running", false])'];
actionMoonshine = _role addaction ["Add Apples","noscript.sqf","[] spawn moonshineAddApples;",1,false,true,"",'_still = (nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0); _isStill = (_still getVariable ["IsStill", false]); (player distance _still < 5) && _isStill && !(_still getVariable ["Running", false])'];
actionMoonshine = _role addaction ["Take Moonshine","noscript.sqf","[] spawn moonshineTakeShine;",1,false,true,"",'_still = (nearestobjects [getpos player, ["Land_Barrel_water"], 3] select 0); _isStill = (_still getVariable ["IsStill", false]); (player distance _still < 5) && _isStill && !(_still getVariable ["Running", false]) && ((_still getVariable ["shinecount", 0]) != 0)'];
//=======================Holster/Unholster===========================================
holsterpistolaction = _role addaction ["Holster Pistol","pistolholster.sqf",["Holster Pistol"],1,false,true,"",'_wpntype = (currentweapon player) call ISSE_Cfg_Weapons_GetType; _wpntype == 2 and holsteredpistol == "" and !((currentweapon player) in taserarray) and !(player call ISSE_IsVictim)'];
unholsterpistolaction = _role addaction ["Unholster Pistol","pistolholster.sqf",["UnHolster Pistol"],1,false,true,"",'_wpntype = (currentweapon player) call ISSE_Cfg_Weapons_GetType; _wpntype != 2 and holsteredpistol != "" and count (weapons player - nonlethalweapons) < 2 and !(player call ISSE_IsVictim)'];

chockhold_civ = _role addaction ["Chokehold","detain.sqf",'',1,true,true,"",'_Nearest = (nearestObjects [player, ["Man"], 3]) select 1); (animationState _Nearest == ILG_Restrain_Anim) && !(player getVariable ["restrained", false]) && (player distance _Nearest < 3)'];
release_civ = _role addaction ["Release","detach.sqf",'',1,true,true,"",'_Nearest = (nearestObjects [player, ["Man"], 3]) select 1); (animationState _Nearest == ILG_Restrain_Anim) && !(player getVariable ["restrained", false]) && (player distance _Nearest < 3)'];
