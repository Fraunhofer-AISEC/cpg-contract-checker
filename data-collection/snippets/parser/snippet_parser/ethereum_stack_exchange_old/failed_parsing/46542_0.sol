function transfer(address to, uint tokens) public returns (bool success) ;
     uint256 public max_contribution = 50 ether; 
    uint256 public min_contribution = 0.1 ether; 
    require (msg.value >= min_contribution);
    require (msg.value <= max_contribution);
    balances[msg.sender] = safeSub(balances[msg.sender], tokens);
    balances[to] = safeAdd(balances[to], tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;
}
