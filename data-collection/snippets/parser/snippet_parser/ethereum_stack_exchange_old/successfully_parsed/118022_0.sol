function createToken(string memory tokenURI) public returns (uint256) {
    
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();

    _mint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);

    

    setApprovalForAll(contractAddress, true);

    return newItemId;
}
