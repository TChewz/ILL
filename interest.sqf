BANK_zinsen = 

{

if (bnkgeld > 0) then {
bnkgeld = round(bnkgeld+(bnkgeld/100*zinsen_prozent));
//player groupChat format [localize "STRS_bank_zinsen", (bnkgeld call ISSE_str_IntToStr), (zinsen_prozent call ISSE_str_IntToStr)];
};

};

if (isServer) then {while {true} do {sleep zinsen_dauer;"[] spawn BANK_zinsen;" call broadcast;};};
