contract SimpleToken {

  using SafeMath for uint256;
  
  string public name;
  mapping (address => uint) public balances;

  
  constructor(string memory _name, address _creator, uint256 _initialSupply) public {
    name = _name;
    balances[_creator] = _initialSupply;
  }

  
  receive() external payable {
    balances[msg.sender] = msg.value.mul(10);
  }

  
  function transfer(address _to, uint _amount) public { 
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = _amount;
  }

  
  function destroy(address payable _to) public {
    selfdestruct(_to);
  }
}
