 function createTokens() payable
 {
    require(msg.value > 0);


    uint256 tokens = msg.value * RATE;  
    balances[msg.sender] = balances[msg.sender] + tokens; 
    balances[owner] = balances[owner] - tokens;           

    owner.transfer(msg.value);                            
    Transfer(owner, msg.sender, tokens);                  

   _totalSupply = _totalSupply - tokens ;
 }
