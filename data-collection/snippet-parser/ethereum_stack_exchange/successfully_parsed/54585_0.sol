pragma solidity ^0.4.23;

import "../node_modules/zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "../node_modules/zeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "../node_modules/zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract SaleContract is CappedCrowdsale, RefundableCrowdsale, MintedCrowdsale {
  

  event refund(string why, address beneficiary);
  event sentExternalTokens(uint256 amount);

  uint8 public constant decimals = 18;

  uint256 public presaleStarts;
  uint256 public crowdsaleStartTime;
  uint256 public presaleRate;
  uint256 public crowdsaleRate;
  uint256 public presaleRaised;
  uint256 public externalTokensSent;

  uint256 public constant maxTokens       = 6000000 * 10 ** uint256(decimals);
  uint256 public constant totalSaleTokens = 5000000 * 10 ** uint256(decimals);
  uint256 public constant presaleTokens   = 2000000 * 10 ** uint256(decimals);

  uint256 public reservedTokens  = 1000000 * 10 ** uint256(decimals);


  
  modifier rateMod {
    
    if (block.timestamp >= crowdsaleStartTime) rate = crowdsaleRate;
    else rate = presaleRate;
    _;
  }


  
  modifier limitCheck {    
    uint256 tokensTomint   = msg.value.mul(rate);
    uint256 totalAfterMint = token.totalSupply() + tokensTomint;

    
    if ((block.timestamp < crowdsaleStartTime) && (totalAfterMint > presaleTokens)) {
      msg.sender.transfer(msg.value); 
      emit refund("presale limit hit, refunding ", msg.sender);
      return;
    }
    _;
  }


  constructor(    
      uint256 _openingTime,
      uint256 _crowdsaleStartTime,
      uint256 _closingTime,
      uint256 _presaleRate,
      uint256 _crowdsaleRate,
      uint256 _goal,
      uint256 _cap,
      MintableToken _token,
      address _wallet
    )
    public
    Crowdsale(_presaleRate, _wallet, _token)
    CappedCrowdsale(_cap)
    TimedCrowdsale(_openingTime, _closingTime)
    RefundableCrowdsale(_goal)
  {
    require(_openingTime < _crowdsaleStartTime);
    require(_goal <= _cap);

    crowdsaleStartTime = _crowdsaleStartTime;

    presaleRate     = _presaleRate;
    crowdsaleRate   = _crowdsaleRate;        
  }


  
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
    rateMod           
    limitCheck        
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
  }


  
  function _updatePurchasingState(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    
    if (block.timestamp < crowdsaleStartTime) {
      presaleRaised = presaleRaised.add(msg.value);
    }

    super._updatePurchasingState(_beneficiary, _weiAmount);
  }

  function sendExternalTokens(address[] recipients, uint amount) onlyOwner public {
    require(amount > 0);

    uint256 totalToTransfer = recipients.length.mul(amount);

    require((token.totalSupply() + totalToTransfer) < maxTokens);

    for (uint256 i = 0; i < recipients.length; i++) {
      _deliverTokens(recipients[i], amount);
    }

    externalTokensSent = externalTokensSent.add(totalToTransfer);
    emit sentExternalTokens(totalToTransfer);  
  }


  function finalize(address _reserveWallet) onlyOwner public {
    require(!isFinalized);

    uint256 existingTokens = token.totalSupply();
    require(existingTokens < maxTokens);

    uint256 unsoldTokens = totalSaleTokens - existingTokens;

    if (unsoldTokens > 0) {
      reservedTokens = reservedTokens + unsoldTokens;
    }

    _deliverTokens(_reserveWallet, reservedTokens);

    super.finalize();
  }
}
