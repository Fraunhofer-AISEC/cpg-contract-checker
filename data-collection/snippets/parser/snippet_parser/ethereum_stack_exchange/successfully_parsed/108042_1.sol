 
    address[] memory path = new address[](3);
    path[0] = address(this);
    path[1] = pancakeswapV2Router.WETH();
    path[2] = _dividendRewardToken;

    _approve(address(this), address(pancakeswapV2Router), tokenAmount);

    
    pancakeswapV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
      tokenAmount,
      0, 
      path,
      recipient,
      block.timestamp
    );
