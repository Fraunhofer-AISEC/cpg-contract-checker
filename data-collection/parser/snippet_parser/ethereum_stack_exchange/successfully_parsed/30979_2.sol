
pragma solidity ^0.4.15;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol";
import "github.com/OpenZeppelin/zeppelin-solidity/contracts/crowdsale/FinalizableCrowdsale.sol";
import "github.com/OpenZeppelin/zeppelin-solidity/contracts/crowdsale/RefundableCrowdsale.sol";
import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/MintableToken.sol";

contract SampleCrowdsale is CappedCrowdsale, FinalizableCrowdsale {

    MintableToken public testToken ;

  function SampleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet, address _tokenContractAddress)
    CappedCrowdsale(_cap)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {

    testToken = MintableToken(_tokenContractAddress);
  }

  function createTokenContract() internal returns (MintableToken) {
    return testToken;
  }

}
