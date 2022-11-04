
pragma solidity ^0.5.0;

contract BIMPFinancePublicPresale is Crowdsale, CappedCrowdsale {
  
  address public owner;
        
  uint256 public investorHardCap =250000000000000000;
            
  mapping(address => uint256) private _contributions;
        
  constructor (uint256 rate,uint256 cap, address payable wallet, IERC20 token) public Crowdsale(rate, wallet, token) CappedCrowdsale(cap) {
          owner = msg.sender;
            
  }
        
  modifier onlyOwner() {
    if (owner == msg.sender) _;
  }
        
  function _preValidatePurchase(
    address beneficiary,
    uint256 weiAmount) internal view {
    super._preValidatePurchase(beneficiary, weiAmount);
    require( _contributions[beneficiary].add(weiAmount) <= investorHardCap, "Beneficiary's cap exceeded");
  }
        
  function _updatePurchasingState(address beneficiary, uint256 weiAmount) internal {
    super._updatePurchasingState(beneficiary, weiAmount);
    _contributions[beneficiary] = _contributions[beneficiary].add(weiAmount);
  }
        
  using SafeERC20 for IERC20;
  function transferToken(IERC20 token, address to, uint256 amount)  public onlyOwner  {
    token.safeTransfer(to, amount);
  }
    
}
