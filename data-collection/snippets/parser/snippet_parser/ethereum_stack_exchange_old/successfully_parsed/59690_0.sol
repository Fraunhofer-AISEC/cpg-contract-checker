pragma solidity ^0.4.24;

contract Test2{
    constructor() public{

    }
}

contract Test{

    function createInstance() public{
        address test2 = new Test2();
    }
}
