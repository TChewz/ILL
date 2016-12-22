{
	if ((typeName _x) == "OBJECT") then {
		_x setDammage 0;
		_x allowDammage false;
	};
} forEach (getPosATL BuildSUV) nearObjects ["Building", 10000];
