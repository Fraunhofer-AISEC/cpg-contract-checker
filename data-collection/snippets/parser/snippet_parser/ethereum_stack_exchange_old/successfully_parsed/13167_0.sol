pragma solidity ^0.4.6;

contract simpleList {

  struct EntityStruct {
    address entityAddress;
    uint entityData;
    
  }

  EntityStruct[] public entityStructs;

  function newEntity(address entityAddress, uint entityData) public returns(uint rowNumber) {
    EntityStruct memory newEntity;
    newEntity.entityAddress = entityAddress;
    newEntity.entityData    = entityData;
    return entityStructs.push(newEntity)-1;
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityStructs.length;
  }
}
