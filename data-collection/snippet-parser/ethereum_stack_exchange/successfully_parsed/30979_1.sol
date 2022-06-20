pragma solidity ^0.4.15;

import "./libs/zeppelin/crowdsale/CappedCrowdsale.sol";
import "./libs/zeppelin/crowdsale/RefundableCrowdsale.sol";
import './TestToken.sol';

contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale {

    TestToken public testToken ;

  function SampleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet, address _tokenContractAddress)
    CappedCrowdsale(_cap)
    FinalizableCrowdsale()
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
    require(_goal <= _cap);
    testToken = TestToken(_tokenContractAddress);
  }

  function createTokenContract() internal returns (MintableToken) {
    return testToken;
  }

}
