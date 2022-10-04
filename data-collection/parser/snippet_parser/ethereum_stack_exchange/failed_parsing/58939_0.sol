struct EntityStruct {

    uint entityData;
    
    string items[];   <--------- I lose the data in here/Cannot fetch the data from the array anymore
}

mapping(address => EntityStruct) public entityStructs;
address[] public entityList;

function deleteEntity(address entityAddress) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    uint rowToDelete = entityStructs[entityAddress].listPointer;
    address keyToMove   = entityList[entityList.length-1];
    entityList[rowToDelete] = keyToMove;
    entityStructs[keyToMove].listPointer = rowToDelete;
    entityList[rowToDelete]
    entityList.length--;
    return true;
}
