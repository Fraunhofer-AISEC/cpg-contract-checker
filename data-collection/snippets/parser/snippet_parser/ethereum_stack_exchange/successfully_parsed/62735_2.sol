function createTokens() payable public {
    if(isMinting == true){
       require(isMinting, "Not allowed");
       require(msg.value > 0, "No funds");
        uint256  tokens = msg.value.div(100000000000000).mul(RATE);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        _totalSupply = _totalSupply.add(tokens);
        owner.transfer(msg.value);
    }
    else{
        revert();
    }
}