pragma solidity ^0.4.8;
contract Storage {

  struct EntityStruct {
    string str_address;
    uint entityData;
    
  }

  EntityStruct[] public entityStructs;

  function newEntity(string entityAddress, uint entityData) public returns(uint rowNumber) {
    EntityStruct memory newEntity;
    newEntity.str_address = entityAddress;
    newEntity.entityData    = entityData;
    return entityStructs.push(newEntity)-1;
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityStructs.length;
  }

  function getEntityByRowNumber(uint rowNumber) public constant returns(string entity, uint data) {
    string a = entityStructs[rowNumber].str_address;
    uint b =  entityStructs[rowNumber].entityData;
    return (a,b);
  }
}
