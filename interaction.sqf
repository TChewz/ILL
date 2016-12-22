#include "macro.h"

if (not(isNil "interaction_functions_defined")) exitWith {};

interact_mobile_receive = {
	private["_player", "_sender", "_text"];

	_player = _this select 0;
	_sender = _this select 1;
	_text = _this select 2;
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_sender] call player_human)) exitWith {};
	if (_player != player) exitWith {};
	
	private["_header"];
	_header = format["%1-%2 sent you a text message.", _sender, (name _sender)];
	
	titleText [_header + "\n" + _text, "PLAIN"];
	player groupChat (_header + "  Steve " + _text);
};

interact_mobile_send = {
	private["_player", "_target"];

	_player = _this select 0;
	_target = _this select 1;
	_text = _this select 2;
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_player != player) exitWith {};
	
	if (isNil "_text") exitWith {};
	if (typeName _text != "STRING") exitWith {};
	
	if (_text == "") exitWith {
		player groupChat format["You cannot send an empty message"];
	};
		
	private["_max_size"];
	_max_size = 100;
	if (strlen(_text) > _max_size) exitWith {
		player groupChat format["Cannot send the text message. It is longer than %1 characters.", _max_size];
	};

	
	private["_money", "_cost"];
	_money  = 'money' call INV_GetItemAmount;
	_cost = INV_smscost;
	
	
	if (_money < _cost) exitWith {
		player groupChat format["Text messages cost %1, you do not have enough money on you.", strM(INV_smscost)];
	};
	
	['money', -(_cost)] call INV_AddInventoryItem;
	
	if (not([_target, "mobile"] call player_get_bool)) exitWith {
		player groupChat format["%1-%2 does not have a ILG phone, your text message bounced", _target, (name _target)];
	};

	player groupChat format["You sent a text message to %1-%2 for $%3", _target, (name _target), strM(_cost)];
	
	
	private["_message"];
	_message = format["%1", _text];
	//format['[%1, %2, toString(%3)] spawn interact_mobile_receive;', _target, _player, toArray(_message)] call _broadcast;
	[[_target, _player, _message], "interact_mobile_receive", _target] call TLU_MPFramework_MP;
};

interact_mobile_use = {
	[] execVM "handy2.sqf";
};

ILG_Open911CivMenu = {
    private ["_ret"]; 
    
    if ((player distance (getMarkerPos "Prison Emita") < 150) OR (player distance (getMarkerPos "atmmarke") < 120)) exitWith {player groupchat "Solar flares have interupted the message, It's failed to send.";};
    if (isNil "JustDialed") then {JustDialed = false;};
    if (JustDialed) exitWith {player groupchat "Your mobile has over heated due to extensive use. Please wait for it to cool down.";closeDialog 0;closeDialog 0;};
    
	// Default Return Value (Failure)
    _ret = false;
    [] spawn {  // You can't sleep or suspend something you call so use [] spawn in stead
        private ["_civ"]; // Private keeps _civ local to this function Yes
        _civ = player;
        if (isciv) then {       
            Antworts = 0; // Sets/Resets Antworts to zero
            if (!(createDialog "ja_neins")) exitWith {hint "Dialog Error!"}; 
            ctrlSetText [1, format["Are you sure you want to dial 911 and report your location and an emergency?", _civ]];
            waitUntil {(Antworts >0)}; // Suspends script until Antworts is greater then zero
            if (Antworts == 1) then {
                JustDialed = true;
                format['%1 say3D "call911"', _civ] call broadcast; 
                player groupchat format["You start to call 911..."];
                sleep 1;
                player groupchat format["Dialing."];
                sleep 2;
                player groupchat format["Ringing."];
                sleep 2;
                player groupchat format["Ringing.."];
                sleep 1;
                player groupchat format["Ringing..."];
                sleep 1;
                player groupchat format["We are dispatching units to your current location. Your location has been marked on the map."];
                
                	deleteMarker "911callmarker";
                
                	_markerobj = createMarker ["911callmarker",[0,0]];																																																	
		    	_markerobj setMarkerShape "ICON";								
			_markerobj setMarkerType "Warning";										
			"911callmarker" setMarkerColor "ColorRed";																														
			"911callmarker" setMarkerText "Civilian called 911 from here!";	
			"911callmarker" setMarkerPos getPos _civ;	
			
			Format ['[%1] call copNotify911;',_civ] call broadcast;
			"911callmarker" setMarkerPos getPos _civ;	
                sleep 60;
                JustDialed = false;
                 
            };
            if (Antworts == 2) then {
                player groupchat format["You decided not to call 911"];
            };
        };
    };
	
    _ret = true; // Change Return Value (Success)
	
    _ret; // Returns the return "ret" value to caller (_h = call myFnc; _h is now true/false)
};


ILG_999HandlerMP = {
    private ["_ret","_civ","_markerobj"];
    _ret = false;
    if (!(isNil("_this"))) then { 
        _this spawn {  
            private ["_civ"];
            _civ = _this select 0;
            if (!(isNull(_civ))) then { 
                if (iscop) then {
				playSound "beepsimple";
                    	player sidechat format["%1(%2), has dialed 911 to report an emergency! His location has been marked on the map (GRID:%3). Dispatch units to his location ASAP!", name _civ, _civ, [_civ] call ILG_Emita_GetGridRef];
                };
            };
        };
    };
	
    _ret = true; // Returned after codeblock above ran
	
    _ret; // Returns it so a caller variable could check the condition
};

interact_deposit_receive = {
	private["_player", "_sender", "_amount"];
	
	_player = _this select 0;
	_sender = _this select 1;
	_amount = _this select 2;
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_sender] call player_human)) exitWith {};
	if (_player != player) exitWith {};
	
	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};
	
	[_amount] call bank_transaction;
	
	player groupChat format["You received $%1 from %2-%3 on your bank account", strM(_amount), _sender, (name _sender)];
};