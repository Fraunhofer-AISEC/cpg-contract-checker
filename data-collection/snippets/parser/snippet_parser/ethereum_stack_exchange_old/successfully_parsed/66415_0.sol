ERC721 public nonFungibleContract; 

function withdrawBalance() external {
    address payable nftAddress = address(nonFungibleContract);
    nftAddress.send(address(this).balance);
}
