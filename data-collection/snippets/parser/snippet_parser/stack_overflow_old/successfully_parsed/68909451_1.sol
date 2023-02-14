 function createSale( address nftContract,
uint256 itemId
) public payable nonReentrant {
uint price = idToMarketItem[itemId].price;
uint tokenId = idToMarketItem[itemId].tokenId;
require(msg.value == price, "Please submit the asking price in order to complete the purchase");
idToMarketItem[itemId].seller.transfer(msg.value);
IERC721(nftContract).transferFrom(owner, msg.sender, tokenId);
idToMarketItem[itemId].owner = payable(msg.sender);
idToMarketItem[itemId].sold = true;
_itemsSold.increment();
payable(owner).transfer(listingPrice); }
