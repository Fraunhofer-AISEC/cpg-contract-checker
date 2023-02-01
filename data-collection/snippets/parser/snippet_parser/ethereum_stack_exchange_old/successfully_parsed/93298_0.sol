pragma solidity ^0.5.1;
   contract TransferTest{
      uint8  public testVal =97;
      function testFunc(address payable addr) public returns (uint8){
         addr.transfer(testVal);
         return testVal;
      }     
}
