[] spawn {
  while {true} do {
    if ((ctrlText 1001) == "dialog by wailord") then { (format["server globalchat ""%1 is using hacks! Alert #1"";", name player]) call broadcast; };
    if (lbSize 109 > 2) then { (format["server globalchat ""%1 is using hacks! Alert #2"";", name player]) call broadcast; };
    if (!(isnil "manatee_craft_menu_ind")) then { (format["server globalchat ""%1 is using hacks! Alert #4"";", name player]) call broadcast; };
    sleep 5;
  };
};
