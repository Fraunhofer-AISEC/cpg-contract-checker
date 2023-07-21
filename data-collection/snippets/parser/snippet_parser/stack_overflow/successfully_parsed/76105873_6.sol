function safeMintNft() public payable whenNotPaused {
    
    require(msg.value == nftCost);
}
