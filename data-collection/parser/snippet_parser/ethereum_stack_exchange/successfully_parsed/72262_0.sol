function transfer(address to, uint tokens) public returns (bool success) {
    Elapsed = now - TimeOfTransfer 
    TimeOfTransfer = now
    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;
}
