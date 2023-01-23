pragma solidity >=0.8.9 <0.9.0;

import 'erc721a/contracts/extensions/ERC721AQueryable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/cryptography/MerkleProof.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';

contract DD is ERC721AQueryable, Ownable, ReentrancyGuard {

  using Strings for uint256;

  string public baseURI = '';
  string public uriSuffix = '.json';
  
  uint256 public cost;
  uint256 public maxSupply;
  uint256 public maxFreeMint = 4;
  uint256 public maxMintAmountPerWallet = 2;

  mapping(address => uint256) private _freeWalletMints;

  bool public paused = true;

  constructor(
    string memory _tokenName,
    string memory _tokenSymbol,
    uint256 _cost,
    uint256 _maxSupply
  ) ERC721A(_tokenName, _tokenSymbol) {
    setCost(_cost);
    maxSupply = _maxSupply;
  }

  modifier mintCompliance(uint256 _mintAmount) {

    require(_mintAmount > 0, 'Invalid mint amount!');
    require(totalSupply() + _mintAmount <= maxSupply, 'Max supply exceeded!');

    _;
  }


  function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount){
    if(msg.sender != owner()){
      require(!paused, 'The contract is paused!');
      require(_freeWalletMints[_msgSender()] + _mintAmount <= 2, 'You have already minted');
      if (totalSupply()+_mintAmount > maxFreeMint){
          require(msg.value >= cost * _mintAmount, "Insufficient funds!");
        }
      }
      _safeMint(_msgSender(), _mintAmount);
    }

  function _startTokenId() internal view virtual override returns (uint256) {
    return 1;
  }

  function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
    require(_exists(_tokenId), 'ERC721Metadata: URI query for nonexistent token');

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, _tokenId.toString(), uriSuffix))
        : '';
  }

  function setCost(uint256 _cost) public onlyOwner {
    cost = _cost;
  }
  function setBaseURI(string memory _url) public onlyOwner {
    baseURI = _url;
  }

  function setUriSuffix(string memory _uriSuffix) public onlyOwner {
    uriSuffix = _uriSuffix;
  }

  function setPaused(bool _state) public onlyOwner {
    paused = _state;
  }

  function withdraw() public onlyOwner nonReentrant {
    (bool os, ) = payable(owner()).call{value: address(this).balance}('');
    require(os);
  }

  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }
}
