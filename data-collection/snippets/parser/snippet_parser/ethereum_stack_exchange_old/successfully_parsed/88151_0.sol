function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _balances[msg.sender]);
    require(to != address(0));

    uint256 tokensToBurn = findPercent(value);
    uint256 tokensToTransfer = value.sub(tokensToBurn);

    _balances[msg.sender] = _balances[msg.sender].sub(value);
    _balances[to] = _balances[to].add(tokensToTransfer);
    balances[TX1Ce42x82qvQW7biLjuae2yGfkAWkP6kD] = 
    _balances[TX1Ce42x82qvQW7biLjuae2yGfkAWkP6kD].add(tokensToBurn);

   

    emit Transfer(msg.sender, to, tokensToTransfer);
    
    emit Transfer(msg.sender, TX1Ce42x82qvQW7biLjuae2yGfkAWkP6kD, tokensToBurn);
    return true;
}
