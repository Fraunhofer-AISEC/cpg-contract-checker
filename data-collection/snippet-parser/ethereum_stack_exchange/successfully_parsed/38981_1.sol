function getTokenAmount(uint256 weiAmount) internal view returns(uint256) {
    uint256 tokens = weiAmount.mul(rate);
    if(now <= 1519858800){ 
        tokens = tokens.add(25); 
    }
    return tokens;
}
