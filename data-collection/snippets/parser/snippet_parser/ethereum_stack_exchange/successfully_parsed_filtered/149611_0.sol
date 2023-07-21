function initialize(string memory _baseUri) public initializer {
        __ERC721_init("GAME", "GM");
        __Ownable_init();
        baseUri = _baseUri;
    }

    function mint(address _address) internal {
        tokenId.increment();
        uint256 currentTokenId = tokenId.current();
        _safeMint(_address, currentTokenId);
        tokenURI(currentTokenId);
    }
