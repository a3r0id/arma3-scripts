params ["_pos", "_target", ["_amount", 3], ["_spread", 100], ["_direction", 90], ["_side", east]];
private _platform = createVehicle ["land_nav_pier_c_big", _pos, [], 0, "NONE"];
private _weapon = createVehicle ["B_Ship_MRLS_01_F", _pos vectorAdd [0, 0, 6.5], [], 0, "NONE"];
createVehicleCrew _weapon;
private _crew = group ((crew _weapon)#0);
_crew deleteGroupWhenEmpty true;
_weapon setDir _direction;

private ["_newEastGroup"];
if (_side == EAST) then {
    _newEastGroup = createGroup east;
    (units _crew) joinSilent _newEastGroup;
} else {
    _newEastGroup = _crew;
};
private _mag = currentMagazine _weapon;
[_weapon, _target, _spread, _mag, _amount] call zen_common_fnc_fireArtillery;

sleep (_amount * 30);

deleteVehicle _weapon;
deleteVehicle _platform;
deleteGroup _newEastGroup;