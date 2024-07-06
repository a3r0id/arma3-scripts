params["_start", "_target", ["_className", "O_T_UAV_04_CAS_F"]];
_uav = createVehicle [_className, [_start#0, _start#1, _start#2 max 150], [], 0, "FLY"];
createVehicleCrew _uav;
{
    if !(toLower ((_x call BIS_fnc_itemType) select 1) in ["countermeasureslauncher"]) then {
        _uav removeWeapon _x;
    };
} forEach weapons _uav;

FNC_UAV_SS_HANDLER = {
    _this spawn {
        _ts = diag_tickTime;
        _uavOnGround = {
            params["_vehicle"];
            _pos = getPos _vehicle;
            _terrain = getTerrainHeightASL _pos;
            _pos#2 < _terrain
        };
        _uav = vehicle (_this#0);
        _target = _this#1;
        _lastPos = [0, 0, 0];

        _uav disableAI "MOVE";
        _uav disableAI "TARGET";
        _uav disableAI "AUTOTARGET";
        _uav setCombatMode "BLUE";
        _uav setBehaviour "CARELESS";

        while {alive _uav && !([_uav] call _uavOnGround) && (diag_tickTime - _ts) < 500} do {
            _relDir = (getPos _uav) vectorFromTo _target;
            _speed = 125;
            _uav setVectorDirAndUp [_relDir, [0, 0, 1]];
            _uav setVelocity (_relDir vectorMultiply _speed);
            sleep 0.25;
        };
        _pos = getPos _uav;
        _gbu = "Bo_GBU12_LGB" createVehicle [_pos#0, _pos#1, 0];
        _gbu setDamage 1;
        _gbu = "DemoCharge_Remote_Ammo_Scripted" createVehicle (getPos _uav);
        _gbu setDamage 1;
        deleteVehicle _uav;
    };    
};

_uavGroup = group _uav;
_wp = _uavGroup addWaypoint [_target, 0];
_wp setWaypointCompletionRadius 400;
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointSpeed "FULL";

_truePos = [0, 0, 0];
if (typeName _target == "ARRAY") then {
    _truePos = _target;
} else {
    _truePos = getPos _target;
};

_wpScript = format["[this, %1] call FNC_UAV_SS_HANDLER", _truePos];
_wp setWaypointStatements ["true", _wpScript];
_uav flyInHeight 100;