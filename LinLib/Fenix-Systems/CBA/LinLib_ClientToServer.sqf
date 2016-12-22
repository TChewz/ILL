/* ----------------------------------------------------------------------------
Function: CBA_fnc_clientToServerEvent

Description:
	Raises an CBA event only on the server (only broadcasted to server and not to other clients)

Parameters:
	_eventType - Type of event to publish [String].
	_params - Parameters to pass to the event handlers [Array].

Returns:
	nil

Author:
	Xeno (Slightly modified version by Linnet)
---------------------------------------------------------------------------- */

CBA_e = _this;
publicVariableServer "CBA_e";