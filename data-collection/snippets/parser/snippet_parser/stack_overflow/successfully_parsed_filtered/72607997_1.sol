contract TestSmartContract {

   address sourceAddress = "0x00...";
    
   function testFunction(uint256 id, uint256 claimDate) public returns(uint) {
       require(msg.sender == sourceAddress, "Not valid source");
       
   }
}
