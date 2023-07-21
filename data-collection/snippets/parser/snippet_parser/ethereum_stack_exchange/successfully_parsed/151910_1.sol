    

    
    uint256 routineArrayIdx = routineArray.length;
    routineArray.push();
    Routine storage routineByArray = routineArray[routineArrayIdx];
    
    Routine storage routineByAddress = addressToRoutine[msg.sender];
    Routine storage routineById = idToRoutine[routineArrayIdx];

    for (uint256 i = 0; i < routineActivities.length; i++) {
        routineByAddress.activities.push(routineActivities[i]);
        routineById.activities.push(routineActivities[i]);
        routineByArray.activities.push(routineActivities[i]);
    }
    
    routineByAddress.areActivitiesAllDone = areAllActivitiesDone;
    routineByAddress.owner = msg.sender;
    routineByAddress.id = routineArrayIdx;
    
    routineById.areActivitiesAllDone = areAllActivitiesDone;
    routineById.owner = msg.sender;
    routineById.id = routineArrayIdx;

    routineByArray.areActivitiesAllDone = areAllActivitiesDone;
    routineByArray.owner = msg.sender;
    routineByArray.id = routineArrayIdx;
