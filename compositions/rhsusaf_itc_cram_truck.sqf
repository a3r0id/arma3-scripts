params["_pos"];
private _truck = createVehicle ["rhsusf_M1078A1P2_B_WD_flatbed_fmtv_usarmy", _pos, [], 0, "CAN_COLLIDE"];
private _cram = createVehicle ["itc_land_cram_praetorian2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_cram disableCollisionWith _truck;
_cram attachTo [_truck, [-0.05,0,2.36]];
_cram setVectorDirAndUp [[0,0,0],[0,0,1]];
createVehicleCrew _cram;
[_cram, ["Green",1], [], true] call BIS_fnc_initVehicle;