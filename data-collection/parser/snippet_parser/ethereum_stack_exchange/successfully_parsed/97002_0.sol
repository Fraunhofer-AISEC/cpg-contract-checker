pragma solidity ^0.5.8;
contract A {
   address owner;
   constructor() public{  
      owner = msg.sender;
   }
   function transferTo(address to, uint amount) public {  
      (bool success,) = to.call.value(amount)("");
      require(success);
   }
   function() external payable  {}
}
