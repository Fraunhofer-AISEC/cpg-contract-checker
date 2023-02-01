contract arrayWithUniqueIds {

  struct EntityStruct {
    address entityAddress;
    uint entityData;
  }

  EntityStruct[] public entityStructs;
  mapping(address => bool) knownEntity;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
    return knownEntity[entityAddress];
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityStructs.length;
  }

  function newEntity(address entityAddress, uint entityData) public returns(uint rowNumber) {
    if(isEntity(entityAddress)) revert();
    EntityStruct memory newEntity;
    newEntity.entityAddress = entityAddress;
    newEntity.entityData = entityData;
    knownEntity[entityAddress] = true;
    return entityStructs.push(newEntity) - 1;
  }

  function updateEntity(uint rowNumber, address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    if(entityStructs[rowNumber].entityAddress != entityAddress) revert();
    entityStructs[rowNumber].entityData    = entityData;
    return true;
  }
}
