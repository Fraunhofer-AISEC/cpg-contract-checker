pragma solidity ^0.4.11;

import "zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/RefundableCrowdsale.sol";
import "zeppelin-solidity/contracts/token/MintableToken.sol";


contract SampleCrowdsaleToken is MintableToken {

  string public constant name = "Sample Crowdsale Token";
  string public constant symbol = "SCT";
  uint8 public constant decimals = 18;

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

  
  function SampleCrowdsaleToken() {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }

}


contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale {

  function SampleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet)
    CappedCrowdsale(_cap)
    FinalizableCrowdsale()
    RefundableCrowdsale(_goal)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
    
    
    require(_goal <= _cap);
  }

  function createTokenContract() internal returns (MintableToken) {
    return new SampleCrowdsaleToken();
  }

}
