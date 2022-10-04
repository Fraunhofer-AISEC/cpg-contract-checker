....
mapping(address => mapping(uint256 => bool)) private reveals;


constructor(
string memory _name,
string memory _symbol,
string memory _initBaseURI,
string memory _initNotRevealedUri
    ) ERC721(_name, _symbol) {
    setBaseURI(_initBaseURI);
    setNotRevealedURI(_initNotRevealedUri);
}

function reveal(address _nftContract, uint256 tokenId, bool _reveal) external onlyOwner {
    bool revealed  = reveals[_nftContract][tokenId];
    require(!revealed, 'Token Already revealed');
    reveals[_nftContract][tokenId] = true;

  }
