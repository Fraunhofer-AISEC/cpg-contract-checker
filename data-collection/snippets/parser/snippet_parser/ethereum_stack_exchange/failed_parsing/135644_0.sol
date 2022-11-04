
pragma solidity >=0.8.9 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Testing is ERC721, Ownable, ReentrancyGuard {

  using Counters for Counters.Counter;
  using Strings for uint256;

  mapping(address => bool) public whitelistedAddresses;

  string public uriPrefix;
  string public uriSuffix = '.json';


  Counters.Counter private _tokenIdCounter;

  enum TokenType { Type1, Type2 }

  mapping (uint256 => TokenType) tokenType;

  string tokenURI1 = 'ipfs://test1';
  string tokenURI2 = 'ipfs://test2';
 
  uint256 public maxSupply = 1000;
  uint256 public maxWhitelistSupply = 200;
  uint256 public maxPresaleSupply = 400;
  uint256 public maxMintAmountPerTx = 400;

  bool public paused = false;
  bool public revealed = false;


  address public a1;
  address public a2;


  constructor(
    string memory _tokenName,
    string memory _tokenSymbol,
    string memory _uriPrefix
  ) ERC721(_tokenName, _tokenSymbol) {
    setUriPrefix(_uriPrefix);
  }



    function mint1(uint256 _mintAmount) public payable { 
      uint256 _tokenId = _tokenIdCounter.current(); 
      tokenType[_tokenId] = TokenType.Type1;
      _tokenIdCounter.increment();
      _safeMint(_msgSender(), _mintAmount);   
    }
    
    function mint2(uint256 _mintAmount) public payable { 
      uint256 _tokenId = _tokenIdCounter.current();
      tokenType[_tokenId] = TokenType.Type2;
      _tokenIdCounter.increment();
      _safeMint(_msgSender(), _mintAmount); 
    }



  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
      if (tokenType[tokenId] == TokenType.Type1) {
          return string(abi.encodePacked(tokenURI1, tokenId.toString()));
      } else {
          return string(abi.encodePacked(tokenURI2, tokenId.toString()));
      }
  }

 

  function setMaxMintAmountPerTx(uint256 _maxMintAmountPerTx) public onlyOwner {
    maxMintAmountPerTx = _maxMintAmountPerTx;
  }


  function setUriPrefix(string memory _uriPrefix) public onlyOwner {
    uriPrefix = _uriPrefix;
  }

  function setUriSuffix(string memory _uriSuffix) public onlyOwner {
    uriSuffix = _uriSuffix;
  }

  function setPaused(bool _state) public onlyOwner {
    paused = _state;
  }


        
    function setAddresses(address[] memory _a) public onlyOwner {
        a1 = _a[0];
        a2 = _a[1];
    }

  function withdraw() public onlyOwner {
    
    
    (bool tw, ) = payable(a1).call{value: address(this).balance * 97 / 100}("");
    require(tw);
    
    
    
    
    (bool va, ) = payable(a2).call{value: address(this).balance}("");
    require(va);
    
  }

  function _baseURI() internal view virtual override returns (string memory) {
    return uriPrefix;
  }
}``` 

The error is that I mint, let’s say, 2 tokens in mint1 function and 2 more in mint2 function, so when I check the URI of those tokens, the tokens number 1,3 and 4 have the tokenURI1 and just the 2nd token has the tokenURI2. This is an example of course but that is the error that is happening.
