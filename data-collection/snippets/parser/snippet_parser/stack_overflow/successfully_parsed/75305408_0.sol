


pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";


contract NFTMinter is ERC1155 {
  constructor() ERC1155("https://raw.githubusercontent.com/noopmood/TutorialNFTInGo/main/metadata/{id}.json") payable {}
  
  
  mapping(address => mapping(uint256 => uint256)) public _balances;

  
  mapping(address => uint256[]) public _tokenIds;

  
  mapping(uint256 => uint256) public tokenPrice;

  
  address payable public sender;

  struct Token {
    uint256 tokenId;
    uint256 balance;
  }

  function mintCaller(uint256 tokenId, uint256 amount) public {
    _mint(msg.sender, tokenId, amount, "");
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

  
  function getTokenByIdAndAddress(address addr, uint256 tokenId) public view returns (Token memory) {
    Token memory result;
    result.tokenId = tokenId;
    result.balance = _balances[addr][tokenId];
    return result;
  }

  
  function getAllTokenByAddress(address holder) public view returns (Token[] memory) {
    Token[] memory result = new Token[](_tokenIds[holder].length);
    for (uint i = 0; i < _tokenIds[holder].length; i++) {
      result[i].tokenId = _tokenIds[holder][i];
      result[i].balance = _balances[holder][_tokenIds[holder][i]];
    }
    return result;
  }

  
  function transfer(address addr, uint256 tokenId, uint256 amount) public {
    require(_balances[msg.sender][tokenId] >= amount, "Not enough balance");
    
    _safeTransferFrom(msg.sender, addr, tokenId, amount, "");
    
    _balances[msg.sender][tokenId] -= amount;
    
    _balances[addr][tokenId] += amount;
  }

  
  function buyToken(uint256 tokenId, uint256 amount) public payable {
    require(msg.value >= amount * tokenPrice[tokenId], "Not enough funds");
    
    sender = payable(msg.sender);
    sender.transfer(amount * tokenPrice[tokenId]);
    
    _safeTransferFrom(address(0), msg.sender, tokenId, amount, "");
    
    _balances[msg.sender][tokenId] += amount;
  }
}
