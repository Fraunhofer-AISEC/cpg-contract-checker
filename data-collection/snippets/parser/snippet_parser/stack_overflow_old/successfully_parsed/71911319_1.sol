 address public primary_wallet = YOUR_WALLET_ADDRESS
 
 function withdraw() public payable onlyOwner {
   (bool os,)= payable(primary_wallet).call{value:address(this).balance}("");
   require(os);
 }

