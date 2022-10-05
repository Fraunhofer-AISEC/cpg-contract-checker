import "./SimpleStorage.sol";

pragma solidity ^0.6.0;

contract storageFactoryContract {

SimpleStorage[] public asd;

function createSimpleStorageContract() public{
    
     
     SimpleStorage simpleStorage = new SimpleStorage();
}

}
