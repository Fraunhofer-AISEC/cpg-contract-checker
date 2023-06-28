pragma solidity 0.4.24;

contract Test2 
{
    address public testVal;

    constructor() public {
        testVal= msg.sender;
    } 

}

contract Test1 is Test2 {}
