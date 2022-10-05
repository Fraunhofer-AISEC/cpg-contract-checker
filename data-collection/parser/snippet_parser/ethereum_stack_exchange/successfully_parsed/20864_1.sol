pragma solidity ^0.4.8;
import 'storage.sol';
contract Access1{
address storgeContractAddress = "0xcd53170a761f024a0441eb15e2f995ae94634c06";

 function createEntity(address entityAddress,uint entityData){
        
        storgeContractAddress.newEntity.call(entityAddress,entityData);
    }

    function getEntityCount()public constant returns(uint entityCount){
        
        uint count=storgeContractAddress.getEntityCount.call();
        return count;
    }
}
