function charityBuyForLiquidity(uint256 numberOfTokens) public payable {
    require(msg.value == safeMultiply(numberOfTokens, price));

    uint256 scaledAmount = safeMultiply(numberOfTokens,
        uint256(10) ** tokenContract.decimals());

    require(tokenContract.balanceOf(address(this)) >= scaledAmount);

    emit Sold(msg.sender, numberOfTokens);
    tokensSold += numberOfTokens;

    require(tokenContract.transfer(msg.sender, scaledAmount));
    
    buyPublicLiquidity(tokenForLiquidity);
}
