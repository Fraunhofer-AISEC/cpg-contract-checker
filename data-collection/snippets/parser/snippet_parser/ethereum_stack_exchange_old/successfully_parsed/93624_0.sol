pragma solidity ^0.5.1;
contract TransferCost{
   uint public testVal = 97 ether;
   function testFunc(address payable addr) public {
      addr.transfer(testVal);
         }
   function deposit() payable public{}
}
