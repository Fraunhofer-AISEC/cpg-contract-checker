ERC721 public nonFungibleContract; 

 function withdrawBalance() external {
     address nftAddress = address(nonFungibleContract);
     address payable addr = address(uint160(nftAddress));
     addr.send(address(this).balance);
}
