pragma solidity ^0.4.8;

contract Storage {
    function getEntityCount() public constant returns(uint entityCount);
}

contract Access1{
    address storgeContractAddress = "0xcd53170a761f024a0441eb15e2f995ae94634c06";
    Storage storage;    
    function Access1(){
     storage =  Storage(storgeContractAddress);
    }
    function getEntityCount()public constant returns(uint entityCount){
        uint count=storage.getEntityCount.call();
        return count;
    }
}
