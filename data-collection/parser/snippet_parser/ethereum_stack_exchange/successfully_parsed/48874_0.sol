pragma solidity ^0.4.21;


library SafeMath {

  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
    }
    c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    
    
    
    return a / b;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}


interface ERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function allowance(address owner, address spender) external view returns (uint256);
  function transferFrom(address from, address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);


  event Transfer(address indexed from, address indexed to, uint256 value);

  event Approval(address indexed owner, address indexed spender, uint256 value);
  }




contract Ownable {
  address public owner;
event OwnershipRenounced(address indexed previousOwner);
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  function Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

  function renounceOwnership() public onlyOwner {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }
}



contract TestCrowdsale is Ownable {
  using SafeMath for uint256;

mapping(address => bool) public whitelist;


ERC20 public token;


address public wallet = 0x770a682364cbed4374d1eF1fA343AB08561aF376;


uint256 public rate = 10000;


uint256 public weiRaised = 0;


uint256 public openingTime = now;


uint256 public closingTime = now + 60 minutes;


address public tokenWallet = 0xf926F01559E5fF8c1b63BfD6E944c8E93Cb20009;


uint256 public cap = 1 * 10 ** 18;


event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

function TestCrowdsale (
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    uint256 _openingTime,
    uint256 _closingTime,
    address _tokenWallet,
    uint256 _cap
  )
    public
  {
    require(_rate > 0);
    require(_wallet != address(0));
    require(_token != address(0));
    require(_openingTime >= block.timestamp);
    require(_closingTime >= _openingTime);
    require(_tokenWallet != address(0));
    require(_cap > 0);
    rate = _rate;
    wallet = _wallet;
    token = _token;
    openingTime = _openingTime;
    closingTime = _closingTime;
    tokenWallet = _tokenWallet;
    cap = _cap;
  }


  
  

  function () external payable {
    buyTokens(msg.sender);
  }


  function addToWhitelist(address _beneficiary) external onlyOwner {
    whitelist[_beneficiary] = true;
  }


  function addManyToWhitelist(address[] _beneficiaries) external onlyOwner {
    for (uint256 i = 0; i < _beneficiaries.length; i++) {
      whitelist[_beneficiaries[i]] = true;
    }
  }


  function removeFromWhitelist(address _beneficiary) external onlyOwner {
    whitelist[_beneficiary] = false;
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
_forwardFunds();
  }

  
  function remainingTokens() public view returns (uint256) {
    return token.allowance(tokenWallet, this);
  }

  
  function hasClosed() public view returns (bool) {
    
    return block.timestamp > closingTime;
  }

  
  function capReached() public view returns (bool) {
    return weiRaised >= cap;
  }

  
  function transferAnyERC20Token(address tokenAddress, uint256 _value) public onlyOwner returns (bool success) {
        return ERC20(tokenAddress).transfer(owner, _value);
    }


  
  

  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal view {
    require(whitelist[_beneficiary]);
    require(block.timestamp >= openingTime && block.timestamp <= closingTime);
    require(_beneficiary != address(0));
    require(_weiAmount != 0);
    require(weiRaised.add(_weiAmount) <= cap);
  }


 function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {
    token.transferFrom(tokenWallet, _beneficiary, _tokenAmount);
  }


  function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {
    _deliverTokens(_beneficiary, _tokenAmount);
  }


  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
    return _weiAmount.mul(rate);
  }


  function _forwardFunds() internal {
    wallet.transfer(msg.value);
  }
}
