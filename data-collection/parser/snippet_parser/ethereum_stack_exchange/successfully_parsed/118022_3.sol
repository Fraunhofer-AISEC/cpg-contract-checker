function relistNFTitem(address nftContract, uint256 itemId)
    public
    payable
    nonReentrant
{
    uint256 price = idToMarketItem[itemId].price;
    uint256 tokenId = idToMarketItem[itemId].tokenId;
    require(
        msg.value == price,
        "Please submit the asking price in order to complete the purchase"
    );
    require(
        idToMarketItem[itemId].owner == msg.sender,
        "Only token owner can put up token for sell"
    );

    idToMarketItem[itemId].seller.transfer(msg.value);

    

    

    IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId );
    idToMarketItem[itemId].owner = payable(address(this));
    idToMarketItem[itemId].sold = false;
    payable(owner).transfer(listingPrice);
}
