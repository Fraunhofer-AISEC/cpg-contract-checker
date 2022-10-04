``` pragma solidity 0.4.24;

import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/token/ERC20/PausableToken.sol";
import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/token/ERC20/MintableToken.sol";
 import "https://github.com/ConsenSysMesh/openzeppelin- 
 solidity/blob/master/contracts/token/ERC20/TokenTimelock.sol";
 import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/crowdsale/validation/TimedCrowdsale.sol";
 import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/crowdsale/validation/WhitelistedCrowdsale.sol";
import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/crowdsale/distribution/RefundableCrowdsale.sol";

 contract ShahTokenCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, WhitelistedCrowdsale, RefundableCrowdsale {

   
  uint256 public investorMinCap = 2000000000000000; 
  uint256 public investorHardCap = 50000000000000000000; 
   mapping(address => uint256) public contributions;

    / / Crowdsale Stages


enum CrowdsaleStage { PreICO, ICO }
  
  CrowdsaleStage public stage = CrowdsaleStage.PreICO;

  
  uint256 public tokenSalePercentage   = 50;
  uint256 public foundersPercentage    = 40;
  uint256 public DevPercentage  = 10;
  

  
  address public foundersFund;
  address public DevFund;
  

  
  uint256 public releaseTime;
  address public foundersTimelock;
  address public DevTimelock;
  

  constructor(
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    uint256 _cap,
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _goal,
    address _foundersFund,
    address _DevFund,
    uint256 _releaseTime
  )
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
    TimedCrowdsale(_openingTime, _closingTime)
    RefundableCrowdsale(_goal)
    public
  {
    require(_goal <= _cap);
    foundersFund   = _foundersFund;
    DevFund = _DevFund;
    releaseTime    = _releaseTime;
  }

  
  function getUserContribution(address _beneficiary)
    public view returns (uint256)
  {
    return contributions[_beneficiary];
  }

  
  function setCrowdsaleStage(uint _stage) public onlyOwner {
    if(uint(CrowdsaleStage.PreICO) == _stage) {
      stage = CrowdsaleStage.PreICO;
    } else if (uint(CrowdsaleStage.ICO) == _stage) {
      stage = CrowdsaleStage.ICO;
    }

    if(stage == CrowdsaleStage.PreICO) {
      rate = 500;
    } else if (stage == CrowdsaleStage.ICO) {
      rate = 250;
    }
  }

  
  function _forwardFunds() internal {
    if(stage == CrowdsaleStage.PreICO) {
      wallet.transfer(msg.value);
    } else if (stage == CrowdsaleStage.ICO) {
      super._forwardFunds();
    }
  }

  
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
    uint256 _existingContribution = contributions[_beneficiary];
    uint256 _newContribution = _existingContribution.add(_weiAmount);
    require(_newContribution >= investorMinCap && _newContribution <= investorHardCap);
    contributions[_beneficiary] = _newContribution;
  }


  
  function finalization() internal {
    if(goalReached()) {
      MintableToken _mintableToken = MintableToken(token);
      uint256 _alreadyMinted = _mintableToken.totalSupply();

      uint256 _finalTotalSupply = _alreadyMinted.div(tokenSalePercentage).mul(100);

      foundersTimelock   = new TokenTimelock(token, foundersFund, releaseTime);
      DevTimelock = new TokenTimelock(token, DevFund, releaseTime);
      

      _mintableToken.mint(address(foundersTimelock),   _finalTotalSupply.mul(foundersPercentage).div(100));
      _mintableToken.mint(address(DevTimelock), _finalTotalSupply.mul(DevPercentage).div(100));
      

      _mintableToken.finishMinting();
      
      PausableToken _pausableToken = PausableToken(token);
      _pausableToken.unpause();
      _pausableToken.transferOwnership(wallet);
    }

    super.finalization();
  }

}
