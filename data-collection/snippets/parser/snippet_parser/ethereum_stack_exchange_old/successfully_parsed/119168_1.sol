function buyToken(uint256 amountDaiTokens) external returns (bool) {
    uint256 amountTokenPurchased = calculateAmountTokensPurchased(
        amountDaiTokens
    );
    require(
        amountDaiTokens <= dai.balanceOf(msg.sender),
        "Buyer does not have enough tokens"
    );
    require(
        amountTokenPurchased <= calculateNumberOfTokenLeft(),
        "Not enough tokens"
    );
    dai.safeTransferFrom(msg.sender, address(this), amountDaiTokens);
    return true;
}

 
