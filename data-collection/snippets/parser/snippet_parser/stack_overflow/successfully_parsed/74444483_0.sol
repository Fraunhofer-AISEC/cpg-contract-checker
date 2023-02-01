pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
  constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    
  }

  
  function mint(uint256 amount) external {
    _mint(msg.sender, amount);
  }
}
