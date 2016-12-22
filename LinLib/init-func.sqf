private ["_functionarray", "_maindir"];
_functionarray =
[
	//FUNCTION								DIR					SQF
	//["LinLib_MoveBuildings",		"Buildings\",        	"LinLib_MoveBuildings"		],
	//["LinLib_CreateBuildings",	"Buildings\",        	"LinLib_CreateBuildings"	],
	["LinLib_OpenGate",          	"Buildings\",       	"LinLib_OpenGate"			],
	//shops
	["LinLib_GetCfgImage",          	"Shops\",        "LinLib_GetCfgImage"		],
	["LinLib_GetCfgSpeed",          	"Shops\",        "LinLib_GetCfgSpeed"		],
	["LinLib_GetCfgDamage",          	"Shops\",        "LinLib_GetCfgDamage"		],
	["LinLib_GetCfgMagCount",          "Shops\",        "LinLib_GetCfgMagCount"	],
	["LinLib_OnSelect",          		"Shops\",        "LinLib_OnSelect"			],
	["LinLib_OnLoad",          		"Shops\",        "LinLib_OnLoad"			],
	//Hideouts
	["LinLib_HideoutDelete",          	"Hideout\",			"LinLib_HideoutDelete"	],
	//Fenix-Systems
	["LinLib_fnc_ClientToServer",          	"Fenix-Systems\CBA\",        "LinLib_ClientToServer"		],
	["LinLib_fnc_InitClient",          	"Fenix-Systems\Init\",       "fn_InitClient"				],
	["LinLib_fnc_InitVariables",          	"Fenix-Systems\Init\",       "fn_InitVariables"			],
	["LinLib_fnc_KeysUpdate",          	"Fenix-Systems\Keys\",       "fn_KeysUpdate"				],
	["LinLib_fnc_ClientInsert",          	"Fenix-Systems\SQL\",        "fn_ClientInsert"			],
	["LinLib_fnc_ClientSelect",          	"Fenix-Systems\SQL\",        "fn_ClientSelect"			],
	["LinLib_fnc_ClientUpdate",          	"Fenix-Systems\SQL\",        "fn_ClientUpdate"			],
	["LinLib_fnc_VehicleMenu",          	"Fenix-Systems\Vehicle\",		  "fn_VehicleMenu"		],
	["LinLib_fnc_VehicleRemove",          	"Fenix-Systems\Vehicle\",        "fn_VehicleRemove"		],
	["LinLib_fnc_VehicleRetrieve",        	"Fenix-Systems\Vehicle\",        "fn_VehicleRetrieve"		],
	["LinLib_fnc_VehicleUpdate",          	"Fenix-Systems\Vehicle\",        "fn_VehicleUpdate"		]
];
_maindir = "LinLib\";
{
call compile format["%4 = compile preprocessFileLineNumbers (""%1%2%3.sqf"");",_maindir,_x select 1,_x select 2,_x select 0];
diag_log format ["%4 = %1%2%3",_maindir,_x select 1,_x select 2,_x select 0];
} count _functionarray;
