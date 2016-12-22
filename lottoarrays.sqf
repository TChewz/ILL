playing_lotto = 0;

LottoArray = 

[

//	0			 	1				 2			3				4   	Position im Array
["lotto1", 	"5 Star Gold",	 		1,		(2),		 	20],							
["lotto2", 	"Break The Bank", 		1,		(15), 		 	20],			
["lotto3", 	"Diamond 7!",	 		2, 		(25), 		 	20],							
["lotto4", 	"Pot O' Gold",			5,  	(50), 			20],	
["lotto5", 	"Fire & Ice 5's",		7,  	(100), 			20],	
["lotto6", 	"Platinum Card",		10,  	(250), 			20],	
["lotto7", 	"Margarita's & Cherries",	12,  	(350), 			20],	
["lotto8", 	"Ice On The Rocks",		25,  	(500), 			20],	
["lotto9", 	"Skyline",				50,  	(750), 			20],	
["lotto10", 	"Premium Vegas!",	150,  	(1500), 			20],	
["lotto11", 	"Stars",			1250,  	(2350), 			20],	
["lotto12", 	"Ching Ching Ching!",	1500,  	(3750), 			20],	
["lotto13", 	"Bankrolls",		2500,  	(5000), 			20],	
["lotto14", 	"Piles Of Dough",	5000,  	(10000), 			20],								
["lotto15",		"Kraken's ticket (Liquid Gold Ticket)",			25000, 	(100000), 		20]

];

// Orte an denen man Lotto spielen kann( Händler)
LottoFlags = 									

[

[lottobuy,["lotto1", "lotto2", "lotto3", "lotto4", "lotto5","lotto6","lotto7","lotto8","lotto9","lotto10","lotto11","lotto12","lotto13","lotto14","lotto15"]]

];

GetLottoArray = 

{

private ["_c", "_lotto"];	

for "_c" from 0 to (count LottoArray - 1) do

	{	

	if (((LottoArray select _c) select 0) == _this) exitWith { (LottoArray select _c) };

	};

};