    import "@path/to/openzeppelin/contracts/token/IERC721.sol"
   
    uint256 MAX_SUPPLY = 20;
    uint256 MAX_InWallet = 5;
    IERC721 ThisNFT = IERC721(address(this));

    function safeMint(address to, string memory uri) public {
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= MAX_SUPPLY, "Error, Minted Out");
        require(ThisNFT.balanceOf(msg.sender) < MAX_InWallet, "5 tokens per wallet");

        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
