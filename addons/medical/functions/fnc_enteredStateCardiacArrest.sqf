/*
 * Author: BaerMitUmlaut
 * Handles a unit entering cardiac arrest.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _time = GVAR(cardiacArrestTime);
private _time_high = GVAR(cardiacArrestTimeHigh);
private _time_low = GVAR(cardiacArrestTimeLow);
private _time_final = random [_time_low, _time, _time_high];

_unit setVariable [QGVAR(cardiacArrestTime), _time_final];
_unit setVariable [QGVAR(cardiacArrestStart), CBA_missionTime];

[_unit] call FUNC(setCardiacArrest);
