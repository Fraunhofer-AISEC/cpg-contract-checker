Counters.Counter private _tokenIdCounter;
uint256 MAX_SUPPLY = 10000;

constructor() ERC721("Blaze", "BLZ") {}

function safeMint(address to, string memory uri) public {
    uint256 tokenId = _tokenIdCounter.current();
    require(tokenId <= MAX_SUPPLY, "All NFTs have been minted")
    _tokenIdCounter.increment();
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, uri);
}



function _beforeTokenTransfer(address from, address to, uint256 tokenId)
    internal
    override(ERC721, ERC721Enumerable)
{
    super._beforeTokenTransfer(from, to, tokenId);
}

function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
}

function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory)
{
    return super.tokenURI(tokenId);
}

function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
{
    return super.supportsInterface(interfaceId);
}
