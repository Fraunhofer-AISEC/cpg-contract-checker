  function createVaultItem(address nftContract,uint256 tokenId,uint256 price) public payable nonReentrant {
    require(price > 0, "Price cannot be zero");
    require(msg.value == listingFee, "Price cannot be listing fee");
    require(mytoken.transferFrom(msg.sender,address(this), listingFee),"Something wrong...");
    _itemIds.increment();
    uint256 itemId = _itemIds.current();
    idToVaultItem[itemId] =  VaultItem(itemId,nftContract,tokenId,payable(msg.sender),payable(address(0)),price,false);
    IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);
    emit VaultItemCreated(itemId,nftContract,tokenId,msg.sender,address(0),price,false);
    }
