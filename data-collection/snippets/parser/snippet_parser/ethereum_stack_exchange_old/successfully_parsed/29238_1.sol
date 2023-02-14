pragma solidity ^0.4.11;

import "./BaseToken.sol";

contract Mint is BaseToken {

  
  address public centralMinter;
  uint256 public totalMinted;

  
  modifier onlyMinter {
    if (msg.sender != centralMinter) revert();
    _;
  }
  function Mint() {
    
  }

  function mint(address _to, uint256 _amountToMint) onlyMinter() {
    balances[_to] += _amountToMint;
    totalSupply += _amountToMint;
    Transfer(this, _to, _amountToMint);
  }
}
