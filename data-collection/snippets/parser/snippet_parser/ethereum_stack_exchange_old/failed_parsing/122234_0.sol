pragma solidity  ^0.8.0; 


import "SimpleStorage.sol";

contract FactoryStorage {
    function createSimpleContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
