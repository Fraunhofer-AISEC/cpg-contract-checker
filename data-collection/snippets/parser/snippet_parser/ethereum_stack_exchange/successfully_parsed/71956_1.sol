pragma solidity 0.5.7;
contract Sample{
    
    address payable owner;

    
   constructor() public{
        owner = msg.sender;
   }

    function doSomething() external payable {
        int i = 10 + 10;
        i++;
   }
}
