function NFTMe(string memory tokenUR) public returns (uint256) {
        uint256 newTokenId = _tokenIds.current();
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenUR);
        
        _tokenIds.increment();
        return newId ;
    }
