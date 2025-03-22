waitUntil { !isNull (findDisplay 46) }; 
CUSTOM_KEYBINDS_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", {  
    if (_this#1 == 56) then { 
        if (vehicle player isKindOf "Plane") then { 
            vehicle player setVelocityModelSpace [0, 800, 0]; 
        }; 
    }; 
    false 
}];
