/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to toggle the whole user interface
 *
 * Public: No
 */

#include "script_component.hpp"

private _visible = !GVAR(uiVisible);

{
    private _fade = 1;
    if (_visible) then {
        _fade = getNumber (configFile >> QGVAR(display) >> "Controls" >> ctrlClassName _x >> "fade");
    };

    _x ctrlSetFade _fade;
    _x ctrlCommit 0.25;
} forEach [CTRL_LIST, CTRL_TABS, CTRL_CAM_TYPES, CTRL_WIDGET];

showChat !_visible;
playSound (["HintExpand","HintCollapse"] select _visible);

GVAR(uiVisible) = _visible;

// TODO: Update help here