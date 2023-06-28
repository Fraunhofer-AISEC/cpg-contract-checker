pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract SYToken is MintableToken {
  string public name = "SSS TOKEN";
  string public symbol = "SSS";
  uint256 public decimals = 8;
}
