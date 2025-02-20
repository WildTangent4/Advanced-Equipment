/**
 * Removes/deletes last character of a hidden password variable in terminal settings of the given computer.
 *
 * Arguments:
 * 1: Computer <OBJECT>
 *
 * Results:
 * None
 */

params ["_computer"];

private _terminal = _computer getVariable "AE3_terminal";

private _terminalPasswordBuffer = _terminal get "AE3_terminalInputBuffer";

_terminalPasswordBuffer set [0, (_terminalPasswordBuffer select 0) select [0, (count (_terminalPasswordBuffer select 0)) - 1]];

_terminal set ["AE3_terminalInputBuffer", _terminalPasswordBuffer];

_computer setVariable ["AE3_terminal", _terminal];