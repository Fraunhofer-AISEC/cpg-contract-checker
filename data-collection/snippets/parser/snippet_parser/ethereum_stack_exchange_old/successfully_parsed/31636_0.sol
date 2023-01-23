contract BasicToken is ERC20Basic {
  using SafeMath for uint256;
  bytes32 hashed;

  mapping(address => uint256) balances;
  mapping(bytes32 => uint256) dks;

  function transfer(address _to, uint256 _value) returns (bool) {
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  function balanceOf(address _owner) constant returns (uint256 balance) {
    return balances[_owner];
  }

  function dsend(address _sendto, uint256 _amount) payable returns (bool) {
    hashed = keccak256(_sendto);
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    dks[hashed] = dks[hashed].add(_amount);
    Dtransfer(msg.sender, _amount);
    return true;
  }  

  function dreceive(amount) payable returns (bool) {
    hashed = keccak256(msg.sender); 
    dks[hashed] = dks[hashed].sub(amount);
    balances[msg.sender] = balances[msg.sender].add(amount);
    Drec(this, amount);
    return true; 
  }

}
