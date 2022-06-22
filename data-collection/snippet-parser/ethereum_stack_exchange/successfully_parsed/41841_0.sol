pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";



contract SampleCrowdsaleToken is MintableToken {

  string public constant name = "Sample Crowdsale Token"; 
  string public constant symbol = "SCT"; 
  uint8 public constant decimals = 18; 

}



contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale, MintedCrowdsale {

  function SampleCrowdsale(uint256 _openingTime, uint256 _closingTime, uint256 _rate, address _wallet, uint256 _cap, MintableToken _token, uint256 _goal) public
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
    TimedCrowdsale(_openingTime, _closingTime)
    RefundableCrowdsale(_goal)
  {
    
    
    require(_goal <= _cap);
  }

}
