// [_consoleInput, _inputText, _outputText] call Y00_fnc_shell;

params ["_consoleInput", "_inputText", "_outputText"];

_commandElements = _inputText splitString " ";
_command = _commandElements select 0;
_options = _commandElements select [1, (count _commandElements) - 1];

_result = [];

_availableCommands = _consoleInput getVariable "availableCommands";

switch (_command) do
{
	case "help": { _result = [format ["   Available commands: %1", _availableCommands joinString ", "]]; };
	case "man": { _result = [_options, _consoleInput] call Y00_fnc_man; };
	case "ls": { _result = [_options, _consoleInput] call Y00_fnc_ls; };
	case "cd": { _result = [_options, _consoleInput] call Y00_fnc_cd; };
	case "print": { _result = [_options, _consoleInput] call Y00_fnc_print; };
	default { _result = [format ["   Command '%1' not found.", _command]]; };
};

_pointer = _consoleInput getVariable "pointer";

_outputArray = _outputText splitString endl;
_prompt = _outputArray select ((count _outputArray) - 1);
_outputArray resize ((count _outputArray) - 1);
_outputArray append [_prompt + _inputText];
_outputArray append _result;
_outputArray append [" " + _pointer + "> "];

if ((count _outputArray) > 21) then {_outputArray deleteRange [0, (count _outputArray) - 21];};

_outputText = _outputArray joinString endl;

ctrlSetText [1100, _outputText];
ctrlSetText [1200, ""];