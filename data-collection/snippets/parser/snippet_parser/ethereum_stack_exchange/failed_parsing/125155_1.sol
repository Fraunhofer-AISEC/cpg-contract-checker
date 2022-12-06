    
    try uniswapV2Router.swapETHForExactTokens{ 
        value: amountToTrade 
    }(
        amountToTrade, 
        getPathForETHToToken(daiTokenAddress), 
        address(this), 
        deadline
    ){
    } catch {
        
    }
    
    
    uint256 tokenAmountInWEI = tokensOut.mul(1000000000000000000); 
    uint256 estimatedETH = getEstimatedETHForToken(tokensOut, daiTokenAddress)[0]; 
    
    
    dai.approve(address(uniswapV2Router), tokenAmountInWEI);
    dai.approve(address(sushiswapV1Router), tokenAmountInWEI);

    
    try sushiswapV1Router.swapExactTokensForETH (
        tokenAmountInWEI, 
        estimatedETH, 
        getPathForTokenToETH(daiTokenAddress), 
        address(this), 
        deadline
    ){
    } catch {
        
    }
}


function WithdrawBalance() public payable onlyOwner {
    
    
    msg.sender.call{ value: address(this).balance }("");
    
    
    dai.transfer(msg.sender, dai.balanceOf(address(this)));
}


function flashloan (
    address _flashAsset, 
    uint _flashAmount,
    address _daiTokenAddress,
    uint _amountToTrade,
    uint256 _tokensOut
    ) public onlyOwner {
        
    bytes memory data = "";

    daiTokenAddress = address(_daiTokenAddress);
    dai = IERC20(daiTokenAddress);
    
    amountToTrade = _amountToTrade; 
    tokensOut = _tokensOut; 

    
    ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
    lendingPool.flashLoan(address(this), _flashAsset, uint(_flashAmount), data);
}


function getPathForETHToToken(address ERC20Token) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = uniswapV2Router.WETH();
    path[1] = ERC20Token;

    return path;
}


 function getPathForTokenToETH(address ERC20Token) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = ERC20Token;
    path[1] = sushiswapV1Router.WETH();
    
    return path;
}


function getEstimatedETHForToken(uint _tokenAmount, address ERC20Token) public view returns (uint[] memory) {
    return uniswapV2Router.getAmountsOut(_tokenAmount, getPathForTokenToETH(ERC20Token));
}
