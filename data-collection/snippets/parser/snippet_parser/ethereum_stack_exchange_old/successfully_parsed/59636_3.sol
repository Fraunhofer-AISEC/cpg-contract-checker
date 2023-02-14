function getTokens() payable canDistr  public {
    uint256 tokens = 0;

    
    require( msg.value >= MIN_CONTRIBUTION );

    require( msg.value > 0 );

    
    tokens = tokensPerEth.mul(msg.value) / 1 ether;        
    address investor = msg.sender;

    if (tokens > 0) {
        
        
        require(distr(investor, tokens));
        owner.transfer(msg.value);
    }

    if (totalDistributed >= totalSupply) {
        distributionFinished = true;
    }
}
