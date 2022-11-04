Counters.Counter private _tokenIdCounter;
 uint256 MAX_SUPPLY = 5;

constructor() ERC721("owltoken", "OWL") {}

function safeMint(address to, string memory uri) public  {
    require(_tokenIdCounter.current() <= MAX_SUPPLY, " ");

    uint256 tokenId = _tokenIdCounter.current();
    _tokenIdCounter.increment();
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, uri);
}
