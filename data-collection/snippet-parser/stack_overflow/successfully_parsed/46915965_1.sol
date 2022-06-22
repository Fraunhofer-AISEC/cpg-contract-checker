pragma solidity 0.4.17;

import './MyToken.sol';
import './math/SafeMath.sol';
import './Haltable.sol';
import './ownership/Ownable.sol';


contract Crowdsale is Ownable, Haltable {
  using SafeMath for uint256;

  
  JobGoToken public token;

  
  uint256 public presaleStartTime;
  uint256 public startTime;
  uint256 public endTime;

  
  uint public purchaserCount = 0;

  
  address public wallet;

  
  uint256 public baseRate = 2000;

  
  uint256 public tierTwoRate = 2100;

  
  uint256 public tierThreeRate = 2200;

  
  uint256 public whitelistRate = 2300;

  
  uint256 public tierOnePurchase = 75 * 10**8;

  
  uint256 public tierTwoPurchase = 150 * 10**8;

  
  uint256 public tierThreePurchase = 300 * 10**8;

  
  uint256 public weiRaised;

  
  uint256 public cap = 80000 * 10**18;

  
  uint256 public presaleCap = 80000 * 10**18;

  
  bool public isFinalized = false;

  
  mapping (address => uint256) public purchasedAmountOf;

  
  mapping (address => uint256) public tokenAmountOf;

  
  mapping (address => bool) public whitelist;

   
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

  
  event Whitelisted(address addr, bool status);

  
  event EndsAtChanged(uint newEndsAt);

  event Finalized();

  function Crowdsale(uint256 _presaleStartTime, uint256 _startTime, uint256 _endTime, address _wallet, address _token) {
    require(_startTime >= now);
    require(_presaleStartTime >= now && _presaleStartTime < _startTime);
    require(_endTime >= _startTime);
    require(_wallet != 0x0);
    require(_token != 0x0);

    token = MyToken(_token);
    wallet = _wallet;
    presaleStartTime = _presaleStartTime;
    startTime = _startTime;
    endTime = _endTime;
  }

  
  function () {
   throw;
  }

  
  function buy() public payable {
    buyTokens(msg.sender);
  }

  
  
  function buyTokens(address beneficiary) stopInEmergency payable {
    require(beneficiary != 0x0);
    require(msg.value != 0);

    if(isPresale()) {
      require(validPrePurchase());
      buyPresale(beneficiary);
    } else {
      require(validPurchase());
      buySale(beneficiary);
    }
  }

  function buyPresale(address beneficiary) internal {
    uint256 weiAmount = msg.value;
    uint256 tokens = 0;

    
    if(whitelist[msg.sender]) {
      tokens = weiAmount.mul(whitelistRate);
    } else if(weiAmount < tierTwoPurchase) {
      
      tokens = weiAmount.mul(baseRate);
    } else if(weiAmount < tierThreePurchase) {
      
      tokens = weiAmount.mul(tierTwoRate);
    } else {
      
      tokens = weiAmount.mul(tierThreeRate);
    }

    
    weiRaised = weiRaised.add(weiAmount);

    
    if(purchasedAmountOf[msg.sender] == 0) {
    purchaserCount++;
    }
    purchasedAmountOf[msg.sender] = purchasedAmountOf[msg.sender].add(msg.value);
    tokenAmountOf[msg.sender] = tokenAmountOf[msg.sender].add(tokens);

    token.mint(beneficiary, tokens);

    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);

    forwardFunds();
  }

  function buySale(address beneficiary) internal {
    uint256 weiAmount = msg.value;

    
    uint256 tokens = weiAmount.mul(baseRate);

    
    weiRaised = weiRaised.add(weiAmount);

    
    if(purchasedAmountOf[msg.sender] == 0) { 
      purchaserCount++;
    }
    purchasedAmountOf[msg.sender] = purchasedAmountOf[msg.sender].add(msg.value);
    tokenAmountOf[msg.sender] = tokenAmountOf[msg.sender].add(tokens);

    token.mint(beneficiary, tokens);

    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);

    forwardFunds();
  }

  
  function finalize() onlyOwner {
    require(!isFinalized);
    require(hasEnded());

    finalization();
    Finalized();

    isFinalized = true;
  }

  
  function finalization() internal {
    
    
    uint256 piTokens =  300000000 * (10**8);
    
    uint256 tokens = piTokens.sub(token.totalSupply());
    
    token.mint(wallet, tokens);
    token.finishMinting();
    token.transferOwnership(msg.sender);
    token.releaseTokenTransfer();
  }

  
  
  function forwardFunds() internal {
    wallet.transfer(msg.value);
  }

  
  function updateWhitelist(address _purchaser, bool _listed) onlyOwner {
    whitelist[_purchaser] = _listed;
    Whitelisted(_purchaser, _listed);
  }

  
  function setEndsAt(uint time) onlyOwner {
    require(now < time);

    endTime = time;
    EndsAtChanged(endTime);
  }


  
  function validPrePurchase() internal constant returns (bool) {
    
    
    bool canPrePurchase = tierOnePurchase <= msg.value || whitelist[msg.sender];
    bool withinCap = weiRaised.add(msg.value) <= presaleCap;
    return canPrePurchase && withinCap;
  }

  
  function validPurchase() internal constant returns (bool) {
    bool withinPeriod = now >= startTime && now <= endTime;
    bool withinCap = weiRaised.add(msg.value) <= cap;
    return withinPeriod && withinCap;
  }

  
  function hasEnded() public constant returns (bool) {
    bool capReached = weiRaised >= cap;
    return now > endTime || capReached;
  }

  
  function isPresale() public constant returns (bool) {
    bool withinPresale = now >= presaleStartTime && now < startTime;
    return withinPresale;
  }

}
