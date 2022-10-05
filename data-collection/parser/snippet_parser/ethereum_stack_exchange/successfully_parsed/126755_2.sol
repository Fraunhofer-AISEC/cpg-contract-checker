
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract NewToken is IERC20 {

  string public constant name = "NewToken";
  string public constant symbol = "NTKN";
  uint8 public constant decimals = 18;
  uint256 totalSupply_ = 10000000000000000000000000; 

  mapping(address => uint256) public balances;
  mapping(address => mapping (address => uint256)) allowed;

  
  
  constructor() { 
    balances[msg.sender] = totalSupply_;
  }

  function totalSupply() public override view returns (uint256) {
    return totalSupply_;
  }

  
  function balanceOf(address _address) public override view returns(uint256) {
    return balances[_address];
  }

  function transfer(address to, uint256 value) public override returns (bool) {
      require(value <= balances[msg.sender]);
      balances[msg.sender] = balances[msg.sender]-value;
      balances[to] = balances[to]+value;
      
      emit Transfer(msg.sender, to, value);
      return true;
  }

  function approve(address spender, uint256 value) public override returns (bool) {
      allowed[msg.sender][spender] = value;
      emit Approval(msg.sender, spender, value);
      return true;
  }

  function allowance(address owner, address spender) public override view returns (uint) {
      return allowed[owner][spender];
  }

  function transferFrom(address from, address to, uint256 value) public override returns (bool) {
      require(value <= balances[from]);
      require(value <= allowed[from][msg.sender]);

      balances[from] = balances[from]-value;
      allowed[from][msg.sender] = allowed[from][msg.sender]+value;
      balances[to] = balances[to]+value;
      emit Transfer(from, to, value);
      return true;
  }
}
