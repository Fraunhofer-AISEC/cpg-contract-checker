function buyToken(uint amountToSpend, uint amountToBuy, address tokenToSpendAddress, address tokenToBuyAddress) public returns (uint[] memory amounts)  {
    require(address(this).balance > amountToSpend);
    uint256[] memory receivedTokens;
    address[] memory path = new address[](2);
    path[0] = tokenToSpendAddress;
    path[1] = tokenToBuyAddress;
    receivedTokens = _pancakeRouter.swapExactETHForTokens{value: amountToSpend}(amountToBuy,path,address(this),block.timestamp + 30); 
    return receivedTokens;
}
