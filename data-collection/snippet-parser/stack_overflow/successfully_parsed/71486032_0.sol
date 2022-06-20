pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/crowdsale/Crowdsale.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/validation/WhitelistCrowdsale.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "../node_modules/@openzeppelin/contracts/crowdsale/emission/MintedCrowdsale.sol";

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/TokenTimelock.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";






contract SKYCrowdsale is Crowdsale, CappedCrowdsale,WhitelistCrowdsale ,MintedCrowdsale{

 
  uint256 public investorMinCap = 2000000000000000; 
  uint256 public investorHardCap = 50000000000000000000; 
 using RefundableCrowdsale for RefundableCrowdsale;
   
    mapping(address => uint256) public contributions;
 

  

 


    constructor(
       uint _rate, 
       address payable _wallet, 
       IERC20 token,
       uint256 _cap,
       uint256 _goal
     
     
      ) 
       public
      Crowdsale(_rate ,_wallet ,token)  
      CappedCrowdsale(_cap) 
   
      {
        
       
        
      }





  function getUserContribution(address _beneficiary)
    public view returns (uint256)
  {
    return contributions[_beneficiary];
  }

  function _updatePurchasingState(
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




 

}
