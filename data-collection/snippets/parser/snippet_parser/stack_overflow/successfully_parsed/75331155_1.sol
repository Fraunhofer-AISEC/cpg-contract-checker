contract NFTMinter is ERC1155 {
  constructor() ERC1155("https://raw.githubusercontent.com/noopmood/TutorialNFTInGo/main/metadata/{id}.json") payable {}
  
  
  mapping(address => mapping(uint256 => uint256)) public _balances;

  
  mapping(address => uint256[]) public _tokenIds;

  
  mapping(uint256 => uint256) public tokenPrice;

  struct Token {
    uint256 tokenId;
    uint256 balance;
  }

  
  function mintAddress(uint256 tokenId, uint256 amount, address addr, uint256 price) public{
    _mint(addr, tokenId, amount, "");
    
    _balances[addr][tokenId] += amount;
     
    _tokenIds[addr].push(tokenId);
    
    tokenPrice[tokenId] = price;
  }

  
  function getTokenIdsByAddress(address addr) public view returns (uint[] memory) {
    return _tokenIds[addr];
  }

  
  function getAllTokenByAddress(address holder) public view returns (Token[] memory) {
    Token[] memory result = new Token[](_tokenIds[holder].length);
    for (uint i = 0; i < _tokenIds[holder].length; i++) {
      result[i].tokenId = _tokenIds[holder][i];
      result[i].balance = _balances[holder][_tokenIds[holder][i]];
    }
    return result;
  }

  function transferData(address payable newContractAddress) public {
    
    NFTMinter newContract = NFTMinter(newContractAddress);

    
    for (uint256 i = 0; i < _balances.length; i++) {
      newContract.setBalance(_balances[i], _balances[_balances[i]]);
    }

    
    for (uint256 i = 0; i < _tokenIds.length; i++) {
      for (uint256 j = 0; j < _tokenIds[i].length; i++) {
        newContract.addTokenId(_tokenIds[i], _tokenIds[i][j]);
      }
    }

    
    for (uint256 i = 0; i < tokenPrice.length; i++) {
      newContract.setTokenPrice(tokenPrice[i], tokenPrice[tokenPrice[i]]);
    }
  }

  function setBalance(address addr, uint256 balance) public {
    _balances[addr] = balance;
  }

  function addTokenId(address addr, uint256 tokenId) public {
    _tokenIds[addr].push(tokenId);
  }

  function setTokenPrice(uint256 tokenId, uint256 price) public {
    tokenPrice[tokenId] = price;
  }
}
