pragma solidity ^0.4.8;
import './Storage.sol';
import './Relay.sol';

contract Access2{
Storage s;
address Storageaddress=0xcd53170a761f024a0441eb15e2f995ae94634c06;

function Access2(){
Relay r=new Relay(this);
}

 function createEntity(string entityAddress,uint entityData)public returns(uint rowNumber){
        s = Storage(Storageaddress);
        uint row=s.newEntity(entityAddress,entityData);
        return row;
    }

    function getEntityCount()public constant returns(uint entityCount){
        s = Storage(Storageaddress);
        uint count=s.getEntityCount();
        return count;
    }   
}
