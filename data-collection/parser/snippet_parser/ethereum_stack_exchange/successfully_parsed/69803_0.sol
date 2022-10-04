pragma solidity >=0.4.22 <0.6.0;

contract owned {
  address public owner;
  constructor () public {
    owner=msg.sender;
  }

  modifier onlyOwner {
    require (msg.sender == owner);
    _;
  }
}

contract EdCoin is owned {
  string public name;
  string public symbol;
  uint8 public decimals = 18;
  uint256 public totalSupply;

  mapping (address => bool) public frozenAccount;
  mapping (address => uint256) public balanceOf;

  event Transfer (address indexed from, address indexed to, uint256 value);
  event FrozenFunds (address target, bool frozen);
  event Burn(address indexed from, uint256 value);

  constructor(
    uint256 initialSupply,
    string memory tokenName,
    string memory tokenSymbol
  ) public {
    totalSupply = initialSupply * 10 ** uint256(decimals);  
    balanceOf[msg.sender] = totalSupply;                
    name = tokenName;                                   
    symbol = tokenSymbol;                               
  }

  function _transfer (address _from, address _to, uint _value) internal {
    require(_to != address(0x0));
    require(!frozenAccount[_to]);
    require(!frozenAccount[_from]);
    require(balanceOf[_from] >= _value);
    require(balanceOf[_to] + _value >= balanceOf[_to]);
    uint previousBalances = balanceOf[_from] + balanceOf[_to];
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(_from, _to, _value);
    assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require (_to != address(0x0));                          
    require (balanceOf[_from] >= _value);
    require (balanceOf[_to] + _value >= balanceOf[_to]);
    require(!frozenAccount[_from]);
    require(!frozenAccount[_to]);                           
    _transfer(_from, _to, _value);
    return true;
  }

  function transferN (address _to, uint256 _value) public returns (bool success) {
    require (_to != address(0x0));  
    require(balanceOf[msg.sender] >= _value);

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;

    emit Transfer(msg.sender, _to, _value);

    return true;
  }

  function burn(uint256 _value) public returns (bool success) {
    require(balanceOf[msg.sender] >= _value);   
    balanceOf[msg.sender] -= _value;            
    totalSupply -= _value;                      
    emit Burn(msg.sender, _value);
    return true;
  }

  function burnFrom(address _from, uint256 _value) public returns (bool success) {
    require(balanceOf[_from] >= _value);                
    balanceOf[_from] -= _value;                         
    totalSupply -= _value;                              
    emit Burn(_from, _value);
    return true;
  }

  function freezeAccount(address target, bool freeze) public {
    frozenAccount[target] = freeze;
    emit FrozenFunds(target, freeze);
  }

  function distributeToken(address[] memory addresses, uint256[] memory _value) public returns (bool success) {
    for( uint256 i=1;i<addresses.length;i++){
      _transfer(addresses[0], addresses[i], _value[i]);
    }
    return true;
  }

  function mintToken(address target, uint256 mintedAmount) onlyOwner public {
    balanceOf[target] += mintedAmount;
    totalSupply += mintedAmount;
    emit Transfer(address(0), address(this), mintedAmount);
    emit Transfer(address(this), target, mintedAmount);
  }
} 
