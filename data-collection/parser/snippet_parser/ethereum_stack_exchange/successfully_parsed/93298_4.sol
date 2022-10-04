pragma solidity ^0.5.1;
   contract TransferTest{
      uint  public testVal =97 ether;
      function testFunc(address payable addr) public returns (uint) {
         
         addr.transfer(testVal);
         return testVal;
      }     
      function  deposit() payable public{}
}
