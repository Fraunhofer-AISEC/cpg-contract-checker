contract xyz is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    
    uint256 public constant maxSupply = 9999;
    uint256 public constant userLimit = 1;
    mapping(address => uint) public walletMints;
    

    constructor() ERC721("xyz", "xyz") {}

    function safeMint(address to, string memory uri) public onlyOwner {
        require(_tokenIdCounter.current() <= maxSupply, "I'm sorry we reached the cap");
       require(walletMints[msg.sender] <= userLimit, "I'm sorry only one NFT per user");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
    ```
}