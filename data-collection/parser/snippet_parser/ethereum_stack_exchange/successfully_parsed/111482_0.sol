    function buyCustomizedNFT(string memory uri) public payable {
        if (totalSupply() != 0) {
            require(_uriToTokenId[uri] != 0, "NONO YOU CANT");
        }
        require(
            getDraftNumber(msg.sender) >= 1,
            "First you need to draft for buy customized NFT"
        );
        require(
            totalSupply().add(1) <= MAX_SUPPLY,
            "Sales is already ended for this amount"
        );
        require(nftPrices[uri] != 0, "Unrecognized token price");
        require(nftPrices[uri] == msg.value, "Invalid AVAX value");
        uint256 newTokenID = _tokenIds.current();
        draftAmounts[msg.sender] = draftAmounts[msg.sender] - 1;
        _safeMint(msg.sender, newTokenID);
        _setTokenURI(newTokenID, uri);
        
        _tokenIds.increment();
    }
