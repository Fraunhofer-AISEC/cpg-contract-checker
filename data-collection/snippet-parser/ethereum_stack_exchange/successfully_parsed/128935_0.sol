function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
    require(numTokens <= balances[owner]);
    require(numTokens <= allowed[owner][msg.sender]);

    balances[owner] = balances[owner]-numTokens;
    allowed[owner][msg.sender] = allowed[owner][msg.sender]-numTokens;
    balances[buyer] = balances[buyer]+numTokens;
    emit Transfer(owner, buyer, numTokens);
    return true;
}
