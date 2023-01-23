


function buyTokens(uint256 numberOfTokens) public payable returns(bool success) {
    require((msg.value == safeMultiply(numberOfTokens, price)),"Amount of ether sent is not compatible with the amount of tokens");
    uint256 scaledAmount = safeMultiply(numberOfTokens, uint256(10) ** tokenContract.tokenDecimals());
    require(tokenContract.accountBalance(address(this)) >= scaledAmount, "Not enough tokens to sale");
    emit sold(msg.sender, numberOfTokens);
    tokensSold += numberOfTokens;
    require(tokenContract.transfer(msg.sender, scaledAmount), "Transaction Failed!");
    return true;
}
