/**
 * Encrypts/Decrypts string with XOR based one time pad.
 *
 * Arguments:
 * 1: Key <STRING>
 * 2: Mode <STRING>
 * 3: Message <STRING>
 *
 * Results:
 * 1: Encrypted/Decrypted Message <STRING>
 */

// this encryption can only be broken if the key is known

// later we could implement processing complete files, for new you can use only one line
params ["_key", "_mode", "_message"];

private _processedChar;
private _processedMessage=[];

//create array of ASCII key values
_keyCodes = toArray(_key);
_msgCodes = toArray(_message);

//iterate through letters
for "_i" from 0 to _msgLength-1 step 1 do{
    _processedChar = [(_msgCodes#_i),(_keyCodes#_i)] call BIS_fnc_bitwiseXOR;

	//adjust for readability (otherwise output would all be control charecters like newline)
    _processedChar = _processedChar+32;    

    _processedMessage pushBack _processedChar;
};
//re format as string 
_processedMessage=toString(_processedMessage);
_processedMessage