pragma solidity ^0.5.0;

import "./ERC20.sol";
import "./ERC20Detailed.sol";
import "./Ownable.sol";

contract TestToken is Ownable, ERC20, ERC20Detailed {
  
  constructor () public ERC20Detailed("TestToken", "TST", 18) {
    _mint(_msgSender(), 100000 * (10 ** uint256(decimals())));
  }
}
