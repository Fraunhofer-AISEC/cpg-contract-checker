contract A {
    uint public x = 3;
}




pragma solidity ^0.8.17;

import "./A.sol";

contract B {
    A public contractA ;

    function getAcontractState() public{
        contractA = new A();
        uint y = contractA.x; 
    }
}   
