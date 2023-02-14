function buy(address nftContract, uint256 itemId)
    public
    payable
    nonReentrant
{
    uint256 price = idToMarketItem[itemId].price;
    uint256 tokenId = idToMarketItem[itemId].tokenId;
    require(
        msg.value >= price,
        "Please submit the asking price in order to complete the purchase"
    );

    idToMarketItem[itemId].seller.transfer(msg.value);
    fandomToken(nftContract).transfer(msg.sender, tokenId, 1);
    idToMarketItem[itemId].owner = payable(msg.sender);
    idToMarketItem[itemId].sold = true;
    _itemsSold.increment();
   
}
