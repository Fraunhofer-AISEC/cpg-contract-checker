function createTokens() payable{

    require(
        msg.value > 0
        && _totalSupply < _cap
        && CROWDSALE_PAUSED <1
        );

        uint multiplier = 10 ** decimals;
        uint256 tokens = msg.value.mul(multiplier) / oneTokenInWei;

        balances[msg.sender] = balances[msg.sender].add(tokens);
        _totalSupply = _totalSupply.add(tokens);
        owner.transfer(msg.value);
}
