pragma solidity ^0.4.11;


contract Ownable {
  address public owner;

  
  function Ownable() {
    owner = msg.sender;
  }

  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  
  function transferOwnership(address newOwner) onlyOwner {
    require(newOwner != address(0));
    owner = newOwner;
  }
}


contract Authorizable {

  address[] authorizers;
  mapping(address => uint256) authorizerIndex;

  
  modifier onlyAuthorized {
    require(isAuthorized(msg.sender));
    _;
  }

  
  function Authorizable() {
    authorizers.length = 2;
    authorizers[1] = msg.sender;
    authorizerIndex[msg.sender] = 1;
  }

  
  function getAuthorizer(uint256 authIndex) external constant returns(address) {
    return address(authorizers[authIndex + 1]);
  }

  
  function isAuthorized(address _addr) constant returns(bool) {
    return authorizerIndex[_addr] > 0;
  }

  
  function addAuthorized(address _addr) external onlyAuthorized {
    authorizerIndex[_addr] = authorizers.length;
    authorizers.length++;
    authorizers[authorizers.length - 1] = _addr;
  }
}


library SafeMath {
  function mul(uint256 a, uint256 b) internal constant returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal constant returns (uint256) {
    
    uint256 c = a / b;
    
    return c;
  }

  function sub(uint256 a, uint256 b) internal constant returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal constant returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}


contract ERC20Basic {
  uint256 public totalSupply;
  function balanceOf(address who) constant returns (uint256);
  function transfer(address to, uint256 value) returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}


contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) constant returns (uint256);
  function transferFrom(address from, address to, uint256 value) returns (bool);
  function approve(address spender, uint256 value) returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract BasicToken is ERC20Basic {
  using SafeMath for uint;

  mapping(address => uint256) balances;

  
  modifier onlyPayloadSize(uint256 size) {
     require(msg.data.length >= size + 4);
     _;
  }

  
  function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32) returns (bool) {
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  
  function balanceOf(address _owner) constant returns (uint256 balance) {
    return balances[_owner];
  }
}


contract StandardToken is BasicToken, ERC20 {

  mapping (address => mapping (address => uint256)) allowed;

  
  function transferFrom(address _from, address _to, uint256 _value) onlyPayloadSize(3 * 32) returns (bool) {
    var _allowance = allowed[_from][msg.sender];

    
    

    balances[_to] = balances[_to].add(_value);
    balances[_from] = balances[_from].sub(_value);
    allowed[_from][msg.sender] = _allowance.sub(_value);
    Transfer(_from, _to, _value);
    return true;
  }

  
  function approve(address _spender, uint256 _value) returns (bool) {

    
    
    
    
    require((_value == 0) || (allowed[msg.sender][_spender] == 0));

    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  
  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
}



contract MintableToken is StandardToken, Ownable {
  event Mint(address indexed to, uint256 value);
  event MintFinished();

  bool public mintingFinished = false;

  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  
  function mint(address _to, uint256 _amount) onlyOwner canMint returns (bool) {
    totalSupply = totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    Mint(_to, _amount);
    return true;
  }

  
  function finishMinting() onlyOwner returns (bool) {
    mintingFinished = true;
    MintFinished();
    return true;
  }
}


contract TestToken is MintableToken {
  
  string public name = "Token Test6";
  
  string public symbol = "Test6";
  uint public decimals = 18;

  bool public tradingStarted = false;

  
  modifier hasStartedTrading() {
    require(tradingStarted);
    _;
  }

  
  function startTrading(bool _startStop) onlyOwner {
    tradingStarted = _startStop;
  }

  
  function transfer(address _to, uint256 _value) hasStartedTrading returns (bool) {
    super.transfer(_to, _value);
    return true;
  }

   
  function transferFrom(address _from, address _to, uint256 _value) hasStartedTrading returns (bool) {
    super.transferFrom(_from, _to, _value);
    return true;
  }
}


contract TestTokenSale is Ownable, Authorizable {
  using SafeMath for uint256;
  event LogBuy(address recipient, uint256 wei_amount, uint256 token_amount, uint256 rate);
  event LogAuthCreate(address recipient, uint256 pay_amount);
  event LogSaleClosed(uint256 issuedSupply, uint256 restrictedTokens);
  event LogRegister(address user, string key);
  event LogCollect(uint256 amount);

  TestToken public token = new TestToken();

  address public Vault;

  
  uint256 public rate = 10000000000000000000000; 

  
  uint public start = 1503875700; 
  bool public ended = false;
  
  uint256 public weiRaised = 0;
  uint256 public minPay = 10000000000000000; 

  mapping (address => string) public keys;

  
  function createTokens(address recipient) public payable {
    require(recipient != 0x0);
    require(validPurchase());
    uint256 tokens = rate.mul(msg.value).div(1 ether);
    require(token.mint(recipient, tokens));
    weiRaised = weiRaised.add(msg.value);
    LogBuy(recipient, msg.value, tokens, rate);
  }
  
  function validPurchase() internal constant returns (bool) {
    bool minPurchase = msg.value >= minPay;
    return (now > start) && !ended && minPurchase;
  }
  
  function collect() onlyOwner returns (bool) {
    LogCollect(this.balance);
    
    Vault.transfer(this.balance);
    
    return true;
  }
  
  function setStart(uint256 _start) public onlyOwner {
    start = _start;
  }
  
  function setVault(address _Vault) public onlyOwner {
    require(_Vault != 0x0);
    if (_Vault != address(0)) {
      Vault = _Vault;
    }
  }
  
  function changeRate(uint256 _rate) public onlyOwner {
    require(_rate > 0);
    rate = _rate;
  }
  
  function closeSale() public onlyOwner returns (bool) {
    uint256 issuedTokenSupply = token.totalSupply();
    uint256 restrictedTokens = issuedTokenSupply.mul(42857).div(100000);
    require(token.mint(Vault, restrictedTokens));
    ended = true;
    token.finishMinting();
    LogSaleClosed(issuedTokenSupply, restrictedTokens);
    return true;
  }
  
  function() external payable {
    createTokens(msg.sender);
  }
  
  function setEnd(bool _ended) public onlyOwner returns (bool) {
    ended = _ended;
    return ended;
  }
  
  function etherRaised() public constant returns (uint256) {
      return weiRaised.div(1000000000000000000);
  }
  
  function changeMinPay(uint256 _minPay) onlyOwner returns (bool) {
      minPay = _minPay;
      return true;
  }
  
  function getBalanceOf(address holder) returns (uint256 balance) {
      return token.balanceOf(holder);
  }
  
  function getTotalSupply() returns (uint256) {
      return token.totalSupply();
  }
  
  function startTrading(bool _startStop) onlyOwner {
    token.startTrading(_startStop);
  }
  
  function selfDestruct() onlyOwner returns (bool) {
      selfdestruct(Vault);
      return true;
  }
  
  function register(string key) {
    assert(bytes(key).length <= 64);
    keys[msg.sender] = key;
    LogRegister(msg.sender, key);
  }
  
  function authorizedCreateTokens(address recipient, uint tokens) public onlyAuthorized {
    require(tokens > 10000000000000000000 && tokens <= 20000000000000000000000); 
    require(token.mint(recipient, tokens));
    LogAuthCreate(recipient, tokens);
  }
}
