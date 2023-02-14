pragma solidity >=0.4.17; 

contract MyCoin {

  mapping(address => uint256) balances; 
  mapping(address => mapping(address => uint256)) allowances; 

  
  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );

  
  address owner;
  uint256 unassignedTokens = 21000000; 

  
  constructor() public
  {
    owner = msg.sender;
    
    balances[owner] += (unassignedTokens / 2);
    unassignedTokens -= (unassignedTokens / 2);
  }

  function issue(address _to, uint256 _value) public returns (bool success)
  {
    if (msg.sender != owner) 
    {
      return false; 
    }
    if (unassignedTokens < _value)
    {
      return false; 
    }
    balances[_to] += _value;
    unassignedTokens -= _value;
  }

  function name() public view returns (string memory)
  {
    return "MyCoin";
  }

  function symbol() public view returns (string memory)
  {
    return "MY";
  }

  function decimals() public view returns (uint8)
  {
    return 18; 
  }

  function totalSupply() public view returns (uint256)
  {
    return 21000000;
  }

  function balanceOf(address _owner) public view returns (uint256 balance)
  {
    return balances[_owner];
  }

  function transfer(address _to, uint256 _value) public returns (bool success)
  {
    if (balances[msg.sender] < _value)
    {
      return false; 
    }
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    emit Transfer(msg.sender, _to, _value); 
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
  {
    if ((_from != msg.sender) || (_from != owner)) 
    {
      return false;
    }
    
    
    
    
    
    
    balances[_from] -= _value;
    balances[_to] += _value;
    allowances[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success)
  {
    
    allowances[_spender][msg.sender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256 remaining)
  {
    return allowances[_spender][_owner];
  }

}
