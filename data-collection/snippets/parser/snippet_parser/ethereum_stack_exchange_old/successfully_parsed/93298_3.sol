pragma solidity =0.5.0;

   contract TransferTest{
      uint8  public testVal = 97;
      
      constructor () public payable {}
      
      function testFunc(address payable addr) public {
         addr.transfer(testVal);
      }  
}
