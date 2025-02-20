/**
 * Checks if the power capacity of the given entity is enough to supply
 * the connected entities.
 *
 * Arguments:
 * 0: Entity to check <OBJECT>
 *
 * Returns:
 * Check result <BOOL>
 */

params['_entity'];

[_entity, "AE3_power_powerCapacity"] call AE3_main_fnc_getRemoteVar;

private _pwrCap = _entity getVariable ['AE3_power_powerCapacity', 0];
private _pwrDraw = 0;
private _connected = _entity getVariable ['AE3_power_connectedDevices', []];
{
	[_x, "AE3_power_powerDraw"] call AE3_main_fnc_getRemoteVar;
	_pwrDraw = _pwrDraw + (_x getVariable ['AE3_power_powerDraw', 0]);
} forEach _connected;

if (_pwrDraw > _pwrCap) then
{
	[_entity, [true]] spawn (_entity getVariable 'AE3_power_fnc_turnOffWrapper');

	_entity setVariable ['AE3_power_powerReq', 0, [clientOwner, 2]];
}else
{
	_entity setVariable ['AE3_power_powerReq', _pwrDraw, [clientOwner, 2]];
};

(_pwrDraw > _pwrCap);