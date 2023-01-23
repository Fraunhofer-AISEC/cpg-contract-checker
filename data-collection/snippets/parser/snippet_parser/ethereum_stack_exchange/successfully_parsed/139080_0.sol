 
  function createNft(string memory _tokenURI, address to) onlyOwner public returns (uint256) 
    {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        _mint(msg.sender, newTokenId);     
        _setTokenURI(newTokenId, _tokenURI);

        userOwnedTokens[msg.sender].push(newTokenId); 

        int256 arrayLength = int(userOwnedTokens[msg.sender].length);
        tokenIsAtIndex[newTokenId] = arrayLength;
       
        return newTokenId;
    }

