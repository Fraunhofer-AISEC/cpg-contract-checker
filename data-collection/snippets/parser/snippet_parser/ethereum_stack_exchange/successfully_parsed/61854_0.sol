pragma solidity ^0.4.24;

library Safemath {
  function add(uint _a, uint _b) public pure returns (uint){
    uint sum = _a + _b;
    require(sum >= _a && sum >= _b);
    return sum;
  }

  function subtract(uint _a, uint _b) public pure returns (uint){
    require( _a >= _b );
    return _a - _b;
  }

  function multiply(uint _a, uint _b) public pure returns (uint){
    uint product = _a * _b;
    require(product/_a == _b);

    return product;
  }

  function divide(uint _a, uint _b) public pure returns (uint){
    require( _b != 0 );
    return _a / _b;
  }
}

library ERC20Transfer {
  using Safemath for uint;

  struct UserBalance{
    mapping(address => uint256) balance;
  }

  function transferTokens(UserBalance storage self, address _from, address _to, uint _amount) public returns(bool) {
    require(self.balance[_from] >= _amount);

    self.balance[_from] -= _amount;
    self.balance[_to] += _amount;
    
    

    return true;
  }
}


contract ERC20God {
  using Safemath for uint;

  ERC20Transfer.UserBalance userBalance;

  string public name;
  string public symbol;
  uint8 public decimals;
  uint256 public totalSupply;

  address public owner;

  event Transfer(address indexed _from, address indexed _to, uint256 amount);

  constructor(string _name, string _symbol, uint8 _decimals, uint256 _totalSupply) public {
    owner       = msg.sender;
    name        = _name;
    symbol      = _symbol;
    decimals    = _decimals;
    totalSupply = _totalSupply.multiply(10**uint(decimals));
    userBalance.balance[owner] = totalSupply;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  modifier notOwner {
    require(msg.sender != owner);
    _;
  }

  function withdrawalEth() public onlyOwner returns(bool) {
    owner.transfer(address(this).balance);
    return true;
  }

  function tokenSale() public payable notOwner returns(bool) {
    require(msg.value > 0);

    
    uint256 tokenAmount = ((msg.value / 1 ether).multiply(1000)).multiply(10**uint(decimals));

    ERC20Transfer.transferTokens(userBalance, owner, msg.sender, tokenAmount);
    emit Transfer(owner, msg.sender, tokenAmount);

    return true;
  }

  function transfer(address _to, uint256 _amount) public returns(bool) {
    uint adjustedAmount = _amount.multiply(10**uint(decimals));

    ERC20Transfer.transferTokens(userBalance, msg.sender, _to, adjustedAmount);
    emit Transfer(msg.sender, _to, adjustedAmount);

    return true;
  }

  function balanceOf(address _owner) public view returns(uint256) {
    return userBalance.balance[_owner];
  }
}
