  function createVaultItem(address nftContract,uint256 tokenId,uint256 price) public payable nonReentrant {
    require(price > 0, "Price cannot be zero");
    _itemIds.increment();
    uint256 itemId = _itemIds.current();
    require(mytoken.transferFrom(payable(msg.sender),address(this), listingFee),"Something wrong...");
    idToVaultItem[itemId] =  VaultItem(itemId,nftContract,tokenId,payable(msg.sender),payable(address(0)),price,false);
    address owner = IERC721(nftContract).ownerOf(tokenId);
    IERC721(nftContract).approve(address(this),tokenId);
    mytoken.transferFrom(owner, address(this), tokenId);
    emit VaultItemCreated(itemId,nftContract,tokenId,msg.sender,address(0),price,false);
    }

  function CosmetaMarketSale(address nftContract,uint256 itemId) public payable nonReentrant {
    uint price = idToVaultItem[itemId].price;
    uint tokenId = idToVaultItem[itemId].tokenId;
    require(msg.value == price, "Not enough balance to complete transaction");
    require(mytoken.balanceOf(_msgSender()) >= price, "Insufficient CRI balance");
    require(mytoken.transferFrom(payable(msg.sender),address(this), price), "Sending Failed");
    idToVaultItem[itemId].seller.transfer(msg.value);
    IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
    idToVaultItem[itemId].holder = payable(msg.sender);
    idToVaultItem[itemId].sold = true;
    _itemsSold.increment();
    payable(holder).transfer(listingFee);
  }
