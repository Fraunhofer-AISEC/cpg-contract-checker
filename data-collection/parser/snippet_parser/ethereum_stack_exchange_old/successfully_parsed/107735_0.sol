function createToken(string memory _tokenURI) public returns (uint) {
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();

    _mint(msg.sender, newItemId);
    _setTokenURI(newItemId, _tokenURI);
    setApprovalForAll(contractAddress, true);
    return newItemId;}
