function _createNftItem(uint tokenId,uint price) private{
    require(price > 0, "Price must be at least 1 wei");
    
    idToNftItem[tokenId]=NftItem(
      tokenId,
      price,
      msg.sender,
      true
    );
    emit NftItemCreated(tokenId,price, msg.sender,true);
  }
