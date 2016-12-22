_obj 	= _this;
_list	= _obj getvariable "druglist";

if(isnil "_list")exitwith{player groupchat "No illegal items found"};
if(count _list == 0)exitwith{player groupchat "No illegal items found"};

for [{_i=0}, {_i < (count _list)}, {_i=_i+1}] do 

{

_arr	= _list select _i;
_civ 	= _arr select 0;
_num	= _arr select 1;
_cost	= _arr select 2;
_drugsellers = [mdrugsell,cdrugsell,ldrugsell,hdrugsell,methsell];
_weaponsellers = [Illegal_ShipmentSeller];
_whalesellers = [whalesell];
_organseller = [organDealer];

switch (true) do
{
	case (_obj in _drugsellers):
	{
		player groupchat format["This civilian has $%2 worth of drugs! Interrogation reveals that they were sold by %1.", name _civ, (_num*_cost)/2];
		format['
		if(!("Trafficking Drugs" in %1_reason))then{%1_reason = %1_reason + ["Trafficking Drugs"]}; %1_wanted = 1; 
		kopfMishy_%1 = kopfMishy_%1 + (%2/2);
		titletext["%3 is wanted for trafficking $%2 worth of drugs!", "PLAIN"]
		', _civ, (_num*_cost)/2, name _civ] call broadcast;
	};
	
	case (_obj in _weaponsellers):
	{
		player groupchat format["This civilian has $%2 worth of illegal Weapon shipments! Interrogation reveals that they were sold by %1.", name _civ, (_num*_cost)/2];
		format['
		if(!("Trafficking Weapon Shipments" in %1_reason))then{%1_reason = %1_reason + ["Trafficking Weapon Shipments"]}; %1_wanted = 1; 
		kopfMishy_%1 = kopfMishy_%1 + (%2/2);
		titletext["%3 is wanted for trafficking $%2 worth of Weapon Shipments!", "PLAIN"]
		', _civ, (_num*_cost)/2, name _civ] call broadcast;
	};
	
	case (_obj in _organseller):
	{
		player groupchat format["This civilian has $%2 worth of Illegal Human Organs! Interrogation reveals that they were sold by %1.", name _civ, (_num*_cost)/2];
		format['
		if(!("Trafficking Illegal Human Organs" in %1_reason))then{%1_reason = %1_reason + ["Trafficking Illegal Human Organs"]}; %1_wanted = 1; 
		kopfMishy_%1 = kopfMishy_%1 + (%2/2);
		titletext["%3 is wanted for trafficking $%2 worth of illegal Human organs!", "PLAIN"]
		', _civ, (_num*_cost)/2, name _civ] call broadcast;
	};
	
	case (_obj in _whalesellers):
	{
		player groupchat format["This civilian has $%2 worth of Illegal Whale! Interrogation reveals that they were sold by %1.", name _civ, (_num*_cost)/2];
		format['
		if(!("Trafficking Illegal Whale" in %1_reason))then{%1_reason = %1_reason + ["Trafficking Illegal Whale"]}; %1_wanted = 1; 
		kopfMishy_%1 = kopfMishy_%1 + (%2/2);
		titletext["%3 is wanted for trafficking $%2 worth of illegal Whale!", "PLAIN"]
		', _civ, (_num*_cost)/2, name _civ] call broadcast;
	};
	
};



/*
player groupchat format["This civilian has $%2 worth of drugs! Interrogation reveals that they were sold by %1.", name _civ, (_num*_cost)/2];
format['
if(!("trafficking drugs" in %1_reason))then{%1_reason = %1_reason + ["trafficking drugs"]}; %1_wanted = 1; 
kopfMishy_%1 = kopfMishy_%1 + (%2/2);
titletext["%3 is wanted for trafficking $%2 worth of drugs!", "PLAIN"]
', _civ, (_num*_cost)/2, name _civ] call broadcast;

*/
};

_obj setvariable["druglist", [], true];
	