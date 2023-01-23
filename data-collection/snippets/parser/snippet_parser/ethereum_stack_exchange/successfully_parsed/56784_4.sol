contract MyToken is StandardToken {
  string public name;                   
  uint8 public decimals;                
  string public symbol;  

  constructor() public {  
    StandardToken.balances[msg.sender] = 1000000000000000000;
    StandardToken.totalSupply_ = 1000000000000000000;                        
    name = "My Token";                             
    decimals = 18; 
    symbol = "MY";      
  }
}
