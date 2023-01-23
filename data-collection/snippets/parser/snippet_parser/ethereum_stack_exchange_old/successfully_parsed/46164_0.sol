pragma solidity ^0.4.21;


contract Ownable {
  address public owner;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  constructor() public {
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
}



library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}



contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}



contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

}



contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}



contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}



contract DeveloperToken is StandardToken {
  string public constant name = "DeveloperToken";
  string public constant symbol = "DEV";
  uint256 public constant decimals = 18;
}



contract DeveloperCrowdsale is Ownable {
  using SafeMath for uint256;

  
  uint256 public maxTokens = 100000000 *(10 ** 18);
  uint256 public tokensForEcosystem = 80000000 *(10 ** 18);
  uint256 public tokensForBounty = 4000000 *(10 ** 18);
  uint256 public totalTokensForSale = 15000000 *(10 ** 18);
  uint256 public tokenForAirdrop = 1000000 *(10 ** 18);

  ERC20 public token;

  address public wallet;

  uint256 public rate;

  uint256 public weiRaised;

  uint256 public cap;
  uint256 public goal;

  
  uint256 public startTime;
  uint256 public endTime;

  bool public mintingFinished = false;

  mapping(address => uint256) balances;

  event Mint(address indexed to, uint256 amount);
  event MintFinished();
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

  constructor() public {
    rate = 1000;
    wallet = msg.sender;
    token = new DeveloperToken();
    startTime = 1527186660000;  
    endTime = 1529951340000; 
    cap = 42500 *(10 ** 18);
    goal = 7500 *(10 ** 18);
  }

  function () external payable {
    uint256 tokensThatWillBeMintedAfterPurchase = msg.value.mul(rate);
    require(token.totalSupply() + tokensThatWillBeMintedAfterPurchase < totalTokensForSale);
    buyTokens(msg.sender);
  }

  
  function setCrowdsalePrice() public onlyOwner {
      if (weiRaised <= 2500000 *(10 ** 18)) {
        setCurrentRate(1000);
      } else if (weiRaised <= 5000000 *(10 ** 18)) {
        setCurrentRate(500);
      } else if (weiRaised <= 10000000 *(10 ** 18)) {
        setCurrentRate(333);
      } else if (weiRaised <= 15000000 *(10 ** 18)) {
        setCurrentRate(250);
      }
  }

  
  function setCurrentRate(uint256 _rate) private {
      rate = _rate;
  }

  function buyTokens(address _beneficiary) public payable {
    require(validPurchase());

    uint256 weiAmount = msg.value;

    
    uint256 tokens = _getTokenAmount(weiAmount);

    
    weiRaised = weiRaised.add(weiAmount);

    _processPurchase(_beneficiary, tokens);
    emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);

    _forwardFunds();
  }

  function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {
    token.transfer(_beneficiary, _tokenAmount);

  }

  function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {
    _deliverTokens(_beneficiary, _tokenAmount);
  }

  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
    return _weiAmount.mul(rate);
  }

  function _forwardFunds() internal {
    token.totalSupply() + msg.value.mul(rate);
    wallet.transfer(msg.value);
  }

  
  function finish(address _airdrop, address _ecosystemFund, address _bountyFund) public onlyOwner {
    require(!mintingFinished);
    require(hasEnded());
    uint256 alreadyMinted = token.totalSupply();
    require(alreadyMinted < maxTokens);

    uint256 unsoldTokens = totalTokensForSale - alreadyMinted;
    if (unsoldTokens > 0) {
      tokensForEcosystem = tokensForEcosystem + unsoldTokens;
    }

    token.totalSupply().add(tokensForEcosystem);
    token.totalSupply().add(tokensForBounty);
    token.totalSupply().add(tokenForAirdrop);

    balances[_airdrop].add(tokenForAirdrop);
    balances[_ecosystemFund].add(tokensForEcosystem);
    balances[_bountyFund].add(tokensForBounty);
    mintingFinished = true ;
  }

  
  function validPurchase() internal view returns (bool) {
    bool withinCap = weiRaised.add(msg.value) <= cap;
    bool withinPeriod = now >= startTime && now <= endTime;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase && withinCap;
  }

  
  function hasEnded() public view returns (bool) {
    bool capReached = weiRaised >= cap;
    return now > endTime || capReached;
  }

}
