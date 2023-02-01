pragma solidity ^0.4.24;

contract SomeTest 
{
    constructor() public payable {}
}

contract A 
{
    address newContract;

    function test() public 
    {
      
      newContract = (new SomeTest).value(1 ether)();
    }
}
