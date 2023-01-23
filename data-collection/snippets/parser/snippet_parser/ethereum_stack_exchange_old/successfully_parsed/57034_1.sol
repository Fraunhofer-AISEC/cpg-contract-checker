pragma solidity ^0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";



contract Crowdsale {
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

    rate = 8 * (10**8);
    wallet = 0xF76075Cf3B674fB9656E393e9e17091B01243666;
    token = token = ERC20(0x0f26c1c05f1bbBC7Eff0488F1a98619e8a9758cf);
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
