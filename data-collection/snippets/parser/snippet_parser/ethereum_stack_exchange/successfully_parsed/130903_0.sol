event MarketTokenEvent (
    uint256 indexed itemId,
    uint256 indexed tokenId,
    address indexed owner
);

function createMarketItem(
    address nftContract,
    uint256 tokenId
) nonReentrant() public { 
    require(tokenId > 0, 'TokenId must be greater than 0');
    _itemIds.increment(); 
    uint256 newItemId = _itemIds.current();
    uint256 price = 0;

    emit MarketTokenEvent(
        newItemId,
        tokenId,
        msg.sender
    );
}
