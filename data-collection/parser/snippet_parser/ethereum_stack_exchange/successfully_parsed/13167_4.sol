contract mappedWithUnorderedIndexAndDelete {

  struct EntityStruct {
    uint entityData;
    uint listPointer;
  }

  mapping(address => EntityStruct) public entityStructs;
  address[] public entityList;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
    if(entityList.length == 0) return false;
    return (entityList[entityStructs[entityAddress].listPointer] == entityAddress);
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityList.length;
  }

  function newEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(isEntity(entityAddress)) revert();
    entityStructs[entityAddress].entityData = entityData;
    entityStructs[entityAddress].listPointer = entityList.push(entityAddress) - 1;
    return true;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    entityStructs[entityAddress].entityData = entityData;
    return true;
  }

  function deleteEntity(address entityAddress) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    uint rowToDelete = entityStructs[entityAddress].listPointer;
    address keyToMove   = entityList[entityList.length-1];
    entityList[rowToDelete] = keyToMove;
    entityStructs[keyToMove].listPointer = rowToDelete;
    entityList.length--;
    return true;
  }

}
