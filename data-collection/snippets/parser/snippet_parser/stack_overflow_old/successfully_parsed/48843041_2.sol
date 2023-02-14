pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract Coin is MintableToken {
  uint8 public decimals = 0;
  uint public initialSupply = 1000000 * 10 ** uint(decimals); 
  string public name = "My Coin";
  string public symbol = "XMY";

  function Coin() public {
    totalSupply_ = initialSupply;
    balances[msg.sender] = totalSupply_;
  }
}
