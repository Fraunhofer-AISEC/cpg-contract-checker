pragma solidity ^0.4.24;

import "./ERC20.sol";



contract POPCoin is ERC20 {

  string public constant name = "POPCoin";
  string public constant symbol = "POPC";
  uint8 public constant decimals = 3;
  uint256 public actualNumber = 0;

  uint256 public constant INITIAL_SUPPLY = 100000000 * (10 ** uint256(decimals));

  
  constructor() public {
    _mint(msg.sender, INITIAL_SUPPLY);
    actualNumber = INITIAL_SUPPLY / (10 ** uint256(decimals));
  }

}
