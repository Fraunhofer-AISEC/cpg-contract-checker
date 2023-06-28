    pragma solidity 0.5.1;
    
    contract Horses {
        
        struct HorseStruct {
            uint64 currentSpeed;
            uint64 currentStamina;
            uint64 distanceTraveled;
            uint64 time;
            bool done;
        }
        
        HorseStruct[] public horseStructs;
        
        function placementSimulation (uint64 currentSpeed, uint64 currentStamina, uint64 distanceTraveled,  uint64 time, bool done) public {
            HorseStruct memory horseData = HorseStruct({
                currentSpeed: currentSpeed,
                currentStamina: currentStamina,
                distanceTraveled: distanceTraveled,
                time: time,
                done: done});
            horseStructs.push(horseData);
        }
            
    }
