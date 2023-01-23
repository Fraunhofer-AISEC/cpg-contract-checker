pragma solidity ^0.4.18;

import "../SafeMathLib.sol";
import "../UpgradeableToken.sol";
import "../MintableToken.sol";


contract TestMigrationTarget is StandardTokenExt, UpgradeAgent {

  using SafeMathLib for uint;

  UpgradeableToken public oldToken;

  uint public originalSupply;

  function TestMigrationTarget(UpgradeableToken _oldToken) {

    oldToken = _oldToken;

    
    if(address(oldToken) == 0) {
      throw;
    }

    
    originalSupply = _oldToken.totalSupply();
    if(originalSupply == 0) {
      throw;
    }
  }

  function upgradeFrom(address _from, uint256 _value) public {
    if (msg.sender != address(oldToken)) throw; 

    
    totalSupply_ = totalSupply_.plus(_value);
    balances[_from] = balances[_from].plus(_value);
    Transfer(0, _from, _value);
  }

  function() public payable {
    throw;
  }

}
