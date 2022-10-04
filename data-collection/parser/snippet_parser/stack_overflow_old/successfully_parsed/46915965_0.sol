 pragma solidity 0.4.17;

import "./MintableToken.sol";
import "./UpgradeableToken.sol";


contract MyToken is MintableToken, UpgradeableToken {

  string public name = "Token";
  string public symbol = "TKN";
  uint256 public decimals = 8;
  uint256 public constant INITIAL_SUPPLY = 300000000 * (10**8);

  
  function MyToken() UpgradeableToken(msg.sender) {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}
