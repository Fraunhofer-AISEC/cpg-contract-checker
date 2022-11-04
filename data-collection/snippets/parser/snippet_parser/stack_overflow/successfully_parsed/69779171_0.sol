function f(address nftContract, uint256 itemId, uint256 price) public payable nonReentrant 
{
  uint tokenId = idToMarketItem[itemId].tokenId;
  IERC721(nftContract).approve(address(this), tokenId);
  IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);
}
