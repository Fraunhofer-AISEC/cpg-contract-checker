pragma solidity ^0.4.24;

import "../token/ERC20/ERC20.sol";


contract SimpleToken is ERC20 {

  string public constant name = "SimpleToken";
  string public constant symbol = "SIM";
  uint8 public constant decimals = 18;

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

  
  constructor() public {
    _mint(msg.sender, INITIAL_SUPPLY);
  }

}
