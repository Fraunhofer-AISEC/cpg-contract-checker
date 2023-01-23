contract TST is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string baseURI;
  string public baseExtension = ".json";
  uint256 public cost = 0.05 ether;
  uint256 public maxSupply = 2000;
  uint256 public maxMintAmount = 2000;
  bool public paused = false;
  bool public revealed = false;
  string public notRevealedUri;
}