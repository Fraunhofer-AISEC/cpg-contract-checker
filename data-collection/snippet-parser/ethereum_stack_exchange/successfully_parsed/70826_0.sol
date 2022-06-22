pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

contract MyToken is ERC20, ERC20Detailed {
  uint public INITIAL_SUPPLY = 10000000000;

  constructor(string memory _name, string memory _symbol, uint8 _decimals)
    ERC20Detailed(_name, _symbol, _decimals)
    public
  {
      _mint(msg.sender, INITIAL_SUPPLY);
  }

}
