contract rNFT is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string baseURI;
  string public baseExtension = ".json";
  uint256 public cost; 
  uint256 public maxSupply = 99999999999999999999999;
  uint256 public maxMintAmount = 1;
  
  bool public isInVault = false;
  string public notRevealedUri;

  constructor(
    string memory _name,
    string memory _symbol,
    string memory _initBaseURI,
    string memory _initNotRevealedUri,
    uint256 _cost
  ) ERC721(_name, _symbol) {
    setBaseURI(_initBaseURI);
    setNotRevealedURI(_initNotRevealedUri);
    setCost(_cost);
  }
}