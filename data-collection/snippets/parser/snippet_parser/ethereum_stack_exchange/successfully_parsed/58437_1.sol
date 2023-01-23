





function transferFrom(address _from, address _to, uint tokens) public returns (bool success) {
    balances[_from] = balances[_from].sub(tokens);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(tokens);
    balances[_to] = balances[_to].add(tokens);
    Transfer(_from, _to, tokens);
    return true;
}
