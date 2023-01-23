    uint256 MAX_SUPPLY = 20;
    uint256 MAX_InWallet = 5;

    function safeMint(address to, string memory uri) public {
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= MAX_SUPPLY, "Error, Minted Out");

        mapping (address => uint256) public view balanceOf; 
        require(balanceOf(msg.sender) < MAX_InWallet, "error"); 

        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
