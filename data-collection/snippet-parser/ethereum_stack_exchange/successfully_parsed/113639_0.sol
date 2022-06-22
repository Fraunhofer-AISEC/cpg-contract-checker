function buyNFT(uint256 tokenId) external payable nonReentrant {
    ILandNFT ilandInterface = ILandNFT(NFTAddress);

    require(
        ilandInterface.stateOf(tokenId) == State.MAvailable,
        "This land NFT is not available!"
    );
    require(
        ilandInterface.priceOf(tokenId) >= msg.value,
        "The amount of CELO sent is not enough!"
    );

    require(
        msg.sender != ilandInterface.landOwnerOf(tokenId),
        "You can't buy your own land!"
    );

    
    (bool sent, ) = owner().call{value: msg.value}("");
    require(sent, "Failed to send CELO");

    
    ilandInterface.updateLandState(tokenId, State.MUnavailable);

    
    lockStartTime[tokenId] = block.timestamp;

    
    increaseBoughtCount(msg.sender, tokenId);

    
    ilandInterface.updateBuyer(tokenId, msg.sender);
}
