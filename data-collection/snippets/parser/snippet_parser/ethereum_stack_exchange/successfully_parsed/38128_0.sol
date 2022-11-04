function mint(address beneficiary) public payable {
    uint256 MTCToken = (msg.value/10000) * (10 ** uint256(18));
    uint256 teamToken = (MTCToken/100) * (5);
    balances[owner] += teamToken;
    balances[beneficiary] = balances[beneficiary] + (MTCToken - teamToken);
    totalSupply_ = totalSupply_ + (MTCToken);
}
