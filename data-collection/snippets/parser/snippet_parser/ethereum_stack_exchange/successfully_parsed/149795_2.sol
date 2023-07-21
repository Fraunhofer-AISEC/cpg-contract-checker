function safeMint(address to, string memory _tokenURI) public onlyOwner {
        _tokenIdCounter.increment();            
        uint256 tokenId = _tokenIdCounter.current();
        
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, _tokenURI)
        tokenId = 0;
    }
