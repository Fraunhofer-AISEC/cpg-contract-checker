pragma solidity ^0.5.0;

    contract TusharCoin {

  uint256 public totalSupply;  
  string public name;  
  string public symbol;  
  uint32 public decimals; 

    constructor () public {
  symbol  = "TUSHAR";  
  name = "TusharCoin";  
  decimals = 5;  
  totalSupply = 100000000000;
    }

    constructor() public { 
  owner = msg.sender;  
  balances[msg.sender] = totalSupply;
    }
    emit Transfer(0x0, msg.sender, totalSupply);  
 }
