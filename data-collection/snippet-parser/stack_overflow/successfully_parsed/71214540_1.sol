
  function createMarketItem(
    address nftContract,
    uint256 tokenId,
    uint256 price,
    address sender
  ) public payable nonReentrant {
    require(price > 0, "Price must be at least 1 wei");
    require(msg.value == listingPrice, "Price must be equal to listing price");

    _itemIds.increment();
    uint256 itemId = _itemIds.current();

    idToMarketItem[itemId] =  MarketItem(
      itemId,
      nftContract,
      tokenId,
      payable(sender),
      payable(address(0)),
      price,
      false
    );

    IERC721(nftContract).transferFrom(sender, address(this), tokenId);

    emit MarketItemCreated(
      itemId,
      nftContract,
      tokenId,
      sender,
      address(0),
      price,
      false
    );
  }
