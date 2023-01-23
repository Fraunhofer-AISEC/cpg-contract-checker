  function buyListing(uint256 _quantity, uint256 _rarity) external payable nonReentrant {
    require(_rarity == 0 || _rarity == 1 || _rarity == 2, "The pack type does not exist.");
    require(_quantity <= 10, "Quantity is too big.");
    uint itemTotal;
    uint currentItem;
    if (_rarity == 0) {
        itemTotal = _itemIdsCommon.current();
        currentItem = _itemsSoldCommon.current();
    } else if(_rarity == 1) {
        itemTotal = _itemIdsRare.current();
        currentItem = _itemsSoldRare.current();
    } else {
        itemTotal = _itemIdsEpic.current();
        currentItem = _itemsSoldEpic.current();
    }
    require((currentItem + _quantity) < itemTotal, "There are not enough items left for your purchase.");
    require(_listings[_rarity][currentItem].status == ListingStatus.Active, "Listing is not active.");
  
    uint256 price;
    uint256 _tokenId;
    for(uint i = 0; i < _quantity; i++) {
        price += _listings[_rarity][currentItem + i].price;
    }

    require(msg.value == price, "Please submit the asking price in order to complete the purchase"); 

    _listings[_rarity][currentItem].seller.transfer(msg.value);

    

    for(uint i = 0; i < _quantity; i++) {
        _tokenId = _listings[_rarity][currentItem + i].tokenId;
        IERC721(_listings[_rarity][currentItem + i].nftContract).transferFrom(address(this), msg.sender, _tokenId);
        _listings[_rarity][currentItem + i].status = ListingStatus.Sold;
        _listings[_rarity][currentItem + i].nftOwner = payable(msg.sender);

        
    }
  }
