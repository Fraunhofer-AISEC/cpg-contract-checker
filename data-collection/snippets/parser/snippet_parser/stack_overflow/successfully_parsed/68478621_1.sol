function onERC721Received(address, address _from, uint256 _tokenId, bytes memory) public virtual override returns (bytes4) {
    require(beneficiary == _from, "Only the beneficiary can transfer the token into the auction.");
    require(tokenAdded == false, "The auction already has a token.");
    
    nftContract = ERC721(msg.sender);
    tokenId = _tokenId;
    tokenAdded = true;
    return this.onERC721Received.selector;
}
