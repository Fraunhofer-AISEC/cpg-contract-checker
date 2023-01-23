contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;
  uint public anotherUint = 10;

  constructor(uint _initialSupply, uint _anotherUint) {
    balances[msg.sender] = totalSupply = anotherUint = _initialSupply = _anotherUint;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}
