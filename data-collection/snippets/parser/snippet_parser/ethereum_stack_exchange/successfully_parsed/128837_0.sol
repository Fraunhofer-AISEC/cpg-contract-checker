contract RandNFT is ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  
  constructor() ERC721 ("RandNFT", "RAND") {}

  function mint(string memory tokenURI) payable external returns (uint256) {
    require(msg.value > 0 wei, 'Mint requires a donation of at least 1 wei.');
    
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);
    payable(owner()).transfer(msg.value);
    
    return newItemId;
  }
}
