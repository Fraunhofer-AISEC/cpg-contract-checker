
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

contract ArtWorkMinter is ERC721Upgradeable, OwnableUpgradeable, ReentrancyGuardUpgradeable{
  struct TokenMeta {
    uint256 id;
    string name;
    uint256 price;
    bool sale;
    string uri;
  }
  string baseURI;
  mapping(uint256 => TokenMeta) private _tokenMeta;

  using CountersUpgradeable for CountersUpgradeable.Counter;
  CountersUpgradeable.Counter private _tokenIds;

  function initialize() public initializer {
      OwnableUpgradeable.__Ownable_init();
      ReentrancyGuardUpgradeable.__ReentrancyGuard_init();
      ERC721Upgradeable.__ERC721_init("ArtWorkMinter", "ArtWorkMinter");
      setBaseURI("https://rh25q24tvf.execute-api.eu-west-2.amazonaws.com/dev/token?id=");
  }

  function _baseURI() internal view override virtual returns (string memory) {
      return baseURI;
  }

  function setBaseURI(string memory _newBaseURI) public virtual onlyOwner {
      baseURI = _newBaseURI;
  }

  function getAllOnSale () public view virtual returns( TokenMeta[] memory ) {
      TokenMeta[] memory tokensOnSale = new TokenMeta[](_tokenIds.current());
      uint256 counter = 0;

      for(uint i = 1; i < _tokenIds.current() + 1; i++) {
          if(_tokenMeta[i].sale == true) {
              tokensOnSale[counter] = _tokenMeta[i];
              counter++;
          }
      }
      return tokensOnSale;
  }

  function setTokenSale(uint256 _tokenId, bool _sale, uint256 _price) public {
      require(_exists(_tokenId), "ERC721Metadata: Sale set of nonexistent token");
      require(_price > 0);
      require(ownerOf(_tokenId) == _msgSender());

      _tokenMeta[_tokenId].sale = _sale;
      setTokenPrice(_tokenId, _price);
  }

  function setTokenPrice(uint256 _tokenId, uint256 _price) public {
      require(_exists(_tokenId), "ERC721Metadata: Price set of nonexistent token");
      require(ownerOf(_tokenId) == _msgSender());
      _tokenMeta[_tokenId].price = _price;
  }

  function tokenPrice(uint256 tokenId) public view virtual returns (uint256) {
      require(_exists(tokenId), "ERC721Metadata: Price query for nonexistent token");
      return _tokenMeta[tokenId].price;
  }

  function _setTokenMeta(uint256 _tokenId, TokenMeta memory _meta) private {
      require(_exists(_tokenId));
      require(ownerOf(_tokenId) == _msgSender());
      _tokenMeta[_tokenId] = _meta;
  }

  function tokenMeta(uint256 _tokenId) public view returns (TokenMeta memory) {
      require(_exists(_tokenId));
      return _tokenMeta[_tokenId];
  }

  function purchaseToken(uint256 _tokenId) public payable nonReentrant {
      require(msg.sender != address(0) && msg.sender != ownerOf(_tokenId));
      require(msg.value >= _tokenMeta[_tokenId].price);
      address tokenSeller = ownerOf(_tokenId);

      payable(tokenSeller).transfer(msg.value);

      setApprovalForAll(tokenSeller, true);
      _transfer(tokenSeller, msg.sender, _tokenId);
      _tokenMeta[_tokenId].sale = false;
  }

    function mint_art_work(address receiver, string memory tokenURI, string memory name, uint256 price, bool sale) public onlyOwner returns (uint256) {
    require(price > 0);

    _tokenIds.increment();
    uint256 newNftTokenId = _tokenIds.current();

    _mint(receiver, newNftTokenId);

    TokenMeta memory meta = TokenMeta(newNftTokenId, name, price, sale, tokenURI);
    _setTokenMeta(newNftTokenId, meta);

    return newNftTokenId;
  }

  function get_token_details(uint token_id) external view returns (string memory){
    return tokenURI(token_id);
  }
}
