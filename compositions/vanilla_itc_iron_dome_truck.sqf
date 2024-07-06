params["_pos"];
private _truck = createVehicle ["B_T_Truck_01_flatbed_F", _pos, [], 0, "CAN_COLLIDE"];
private _id = createVehicle ["itc_land_ciws_centurion2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_id disableCollisionWith _truck;
_id attachTo [_truck, [0,-1.5,1]];
_id setVectorDirAndUp [[0,0,0],[0,0,1]];
createVehicleCrew _id;
[_id, ["Green",1], [], true] call BIS_fnc_initVehicle;