function swapTokensForEth(uint tokenAmount) public {
    require(tokenAmount > 0, "Need to send some tokens");
    require(tradingOpen, "Trading is not open yet");

    
    require(balanceOf(msg.sender) >= tokenAmount, "Not enough tokens");
    require(allowance(msg.sender, address(uniswapV2Router)) >= tokenAmount, "Not enough allowance");

    address[] memory path = new address[](2);
    path[0] = address(this);
    path[1] = uniswapV2Router.WETH();

    
    uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
        tokenAmount,
        0, 
        path,
        msg.sender, 
        block.timestamp + 300 
    );
    }
