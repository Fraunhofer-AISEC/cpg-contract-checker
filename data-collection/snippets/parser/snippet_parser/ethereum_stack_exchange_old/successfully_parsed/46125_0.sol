pragma solidity ^0.4.18;

contract SimpleToken is StandardToken {

  string public constant name = "SimpleToken"; 
  string public constant symbol = "SIM"; 
  uint8 public constant decimals = 18; 

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

  
  function SimpleToken() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }

}
