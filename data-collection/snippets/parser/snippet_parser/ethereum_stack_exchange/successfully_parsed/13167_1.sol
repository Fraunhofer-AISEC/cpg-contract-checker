contract mappingWithStruct {

  struct EntityStruct {
    uint entityData;
    bool isEntity;
  }

  mapping (address => EntityStruct) public entityStructs;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
    return entityStructs[entityAddress].isEntity;
  }

  function newEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(isEntity(entityAddress)) revert(); 
    entityStructs[entityAddress].entityData = entityData;
    entityStructs[entityAddress].isEntity = true;
    return true;
  }

  function deleteEntity(address entityAddress) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    entityStructs[entityAddress].isEntity = false;
    return true;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    entityStructs[entityAddress].entityData = entityData;
    return true;
  }
}
