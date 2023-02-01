    
    
    IERC721(nftcontract).transferFrom(msg.sender,address(this),tokenId);

    
    
    emit MarketItemcreated(
     ItemId,
     nftcontract,
     tokenId,
     msg.sender,
     address(0),
     price,
    false
    );
}
