pragma solidity ^0.4.24;

import "./ERC20.sol";
import "./SafeMath.sol";
import "./SafeERC20.sol";
import "./BurnableToken.sol";



contract Crowdsale is BurnableToken {
  using SafeMath for uint256;
  using SafeERC20 for ERC20;

  
  ERC20 public token;

  
  address public wallet;

  
  
  
  
  uint256 public rate;

  
  uint256 public weiRaised;

  
  event TokenPurchase(
    address indexed purchaser,
    address indexed beneficiary,
    uint256 value,
    uint256 amount
  );

  
  constructor(uint256 _rate, address _wallet, ERC20 _token) public {
    require(_rate > 0);
    require(_wallet != address(0));
    require(_token != address(0));

    rate = _rate;
    wallet = _wallet;
    token = _token;
  }

  
  
  

  
  function () external payable {
    buyTokens(msg.sender);
  }

  
  function buyTokens(address _beneficiary) public payable {

    uint256 weiAmount = msg.value;
    _preValidatePurchase(_beneficiary, weiAmount);

    
    uint256 tokens = _getTokenAmount(weiAmount);

    
    weiRaised = weiRaised.add(weiAmount);

    _processPurchase(_beneficiary, tokens);
    emit TokenPurchase(
      msg.sender,
      _beneficiary,
      weiAmount,
      tokens
    );

    _updatePurchasingState(_beneficiary, weiAmount);

    _forwardFunds();
    _postValidatePurchase(_beneficiary, weiAmount);
  }

  function sellTokens(uint256 amount) public {

    uint256 weiAmount = amount.mul(rate);
    address myAddress = address(this);

    require(myAddress.balance >= weiAmount);
    weiRaised = weiRaised.sub(weiAmount);

    burn(amount);

  }

  
  
  

  
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    require(_beneficiary != address(0));
    require(_weiAmount != 0);
  }

  
  function _postValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    
  }

  
  function _deliverTokens(
    address _beneficiary,
    uint256 _tokenAmount
  )
    internal
  {
    token.safeTransfer(_beneficiary, _tokenAmount);
  }

  
  function _processPurchase(
    address _beneficiary,
    uint256 _tokenAmount
  )
    internal
  {
    _deliverTokens(_beneficiary, _tokenAmount);
  }

  
  function _updatePurchasingState(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    
  }

  
  function _getTokenAmount(uint256 _weiAmount)
    internal view returns (uint256)
  {
    return _weiAmount.mul(rate);
  }

  
  function _forwardFunds() internal {
    wallet.transfer(msg.value);
  }
}
