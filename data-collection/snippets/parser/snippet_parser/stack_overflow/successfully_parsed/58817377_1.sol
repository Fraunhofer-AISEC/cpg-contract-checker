pragma solidity ^0.5.0;

contract TestToken is ERC777 {

constructor(
  string memory name,
  string memory symbol,
  address[] memory defaultOperators,
  uint256 totalSupply
)
public payable ERC777(name, symbol, defaultOperators)
{
  
  _mint(msg.sender, msg.sender, totalSupply, "", "");
}
}
