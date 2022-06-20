
pragma solidity 0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract FloatFlowerToken is StandardToken {
  string public name = "FLOATFLOWER TOKEN";
  string public symbol = "FFT";
  uint8 public decimals = 18;

  constructor() public {
    totalSupply_ = 36000000;
    balances[msg.sender] = totalSupply_;
  }
}
