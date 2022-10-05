function swapTokensWithSlippagePercent(address tokenToSellAddr, 
                                address ethAddr,
                                uint deadline,
                                uint percent) 
                                external {

    IBEP20 tokenContractObj = IBEP20(tokenToSellAddr);
    uint256 myBalance = tokenContractObj.balanceOf(address(this));
    tokenContractObj.approve(_pancakeSwapRouterAddress, myBalance);
    require(myBalance > 0);
  
    address[] memory path = new address[](2);
    path[0] = tokenToSellAddr; 
    path[1] = ethAddr;
  
    uint[] memory tokenAmountToSwap;
    uint[] memory amounts;        
    tokenAmountToSwap = _pancakeRouter.getAmountsOut(myBalance, path);
    uint toGet;  
    toGet = tokenAmountToSwap[1].div(100).mul(percent);      
    amounts = _pancakeRouter.swapExactTokensForETH(myBalance, toGet, path, address(this), deadline);

}
