function mintNFT(uint tokenID, uint numTokensRequested, uint8 currencyID) public payable whenNotPaused {
    if(currencyID == 1) {
      
      require(msg.value >= (basePriceInETH * numTokensRequested), "'mintNFT()' ERROR: INSUFFICIENT amount of ETH sent!");
   } 
   else {
      
      require(msg.value >= (basePriceInDummies * numTokensRequested), "'mintNFT()' ERROR: INSUFFICIENT amount of DUMMY sent!"); 
      dummyCoinContract.transferFrom(msg.sender, address(this), basePriceInDummies * numTokensRequested);
   }
}
