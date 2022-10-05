    function priceOfEther() public view returns (uint256){
    uint256 maxTokenPrice = WEI_DECIMALS.div(100).mul(7); 
    uint256 minTokenPrice = WEI_DECIMALS.div(1000).mul(7); 
    uint256 minWeiPerToken = minTokenPrice.div(ethUSD);
    uint256 maxWeiPerToken = maxTokenPrice.div(ethUSD);
    uint256 increments = (maxWeiPerToken.sub(minWeiPerToken)).div(AVG_NUM_INVESTORS); 
    price = minWeiPerToken.add(increments.mul(count));
    if (price > maxWeiPerToken) {
        price = maxWeiPerToken;
    }
    assert(price != 0);        
    return price;
}
