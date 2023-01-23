pragma solidity =0.5.0;
 
   contract TransferTest{
       
      function testFunc(address payable addr) public payable {
         addr.transfer(msg.value);
      }
}
