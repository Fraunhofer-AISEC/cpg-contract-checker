pragma solidity ^0.4.15;

import "./libs/zeppelin/crowdsale/CappedCrowdsale.sol";
import "./libs/zeppelin/crowdsale/FinalizableCrowdsale.sol";
import './TestToken.sol';



contract TestTokenSale is CappedCrowdsale, FinalizableCrowdsale {

  address public tokenContractAddress;

  function TestTokenSale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _cap, address _wallet, address _tokenContractAddress)
    CappedCrowdsale(_cap)
    FinalizableCrowdsale()
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
    token = TestToken(_tokenContractAddress);
  }

  function finalization() internal {
  }

}
