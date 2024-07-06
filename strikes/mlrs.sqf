params["_location", "_target"];
private _platform = createVehicle ["land_nav_pier_c_big", _location, [], 0, "NONE"]; // this mission was primarily ocean, so I used a pier as a platform
private _weapon = createVehicle ["B_MBT_01_mlrs_F", _location vectorAdd [0, 0, 6.5], [], 0, "NONE"];
createVehicleCrew _weapon;
private _crew = group (driver _weapon);
private _random = [[[_target, 100]], []] call BIS_fnc_randomPos;
sleep 1;
private _muzzle = currentMagazine _weapon;
_weapon doArtilleryFire [_random, _muzzle, floor (random 12)];
sleep 20;
deleteVehicle _platform;
deleteVehicle _weapon;
{deleteVehicle _x} forEach units _crew;
deleteGroup _crew;