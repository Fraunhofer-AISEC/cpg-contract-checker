function createProduct(uint _price, string memory _desc) public payable{ 
   emit UserLedgerUpdated(_desc, -1*int(msg.value));
}
