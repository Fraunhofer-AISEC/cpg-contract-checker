pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/1001-digital/erc721-extensions/blob/main/contracts/RandomlyAssigned.sol";

contract NFT_Test is ERC721Enumerable, Ownable, RandomlyAssigned {
  using Strings for uint256;

  string baseURI;
  string public baseExtension = ".json";
  uint256 public cost = 0.003 ether;
  uint256 public currentSupply = 0;
  uint256 public maxSupply = 5000;
  uint256 public maxMintAmount = 50;
  bool public paused = true;
  bool public revealed = false;
  string public notRevealedUri;

function RandomlyAssigned(uint256 , uint256 num) {
    for (uint256 a = 1; a <= num; a++) {
        mint(msg.sender, amount);
    }

constructor(
    string memory _name,
    string memory _symbol,
    string memory _initBaseURI,
    string memory _initNotRevealedUri
  ) ERC721(_name, _symbol) {
    setBaseURI(_initBaseURI);
    setNotRevealedURI(_initNotRevealedUri);
    RandomlyAssigned(5000,200)
  }


  
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }


  function mint(uint256 _mintAmount) public payable {
    uint256 supply = totalSupply();
    require(!paused);
    require(_mintAmount > 0);
    require(_mintAmount <= maxMintAmount);
    require(supply + _mintAmount <= maxSupply);
    require(tokenCount() + 1 <= maxSupply(), "YOU CAN'T MINT MORE THAN MAXIMUM SUPPLY");
    require(availableTokenCount() -1 >= 0, "YOU CAN'T MINT MORE THAN AVAILABLE TOKEN COUNT");


    if (msg.sender != owner()) {
      require(msg.value >= cost * _mintAmount);
      require(balanceOf(msg.sender) <= 1);
    }

    for (uint256 i = 1; i <= _mintAmount; i++) {
      _safeMint(msg.sender, supply + i);
    }
