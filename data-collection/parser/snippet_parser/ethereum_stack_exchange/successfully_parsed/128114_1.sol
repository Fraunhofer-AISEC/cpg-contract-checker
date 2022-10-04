function mintNFT(address _toAddress, uint _tokenId, string memory _tokenURI) public payable onlyOwner {
        _safeMint(_toAddress, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);

        _numTokensMinted.increment();
    }
