  function swapTokenToEth(uint tokenAmount, uint amountOutMin) public {
    uint deadline = block.timestamp + 150;
    IERC20(token).transferFrom(msg.sender, address(this), tokenAmount);
    IERC20(token).approve(UNISWAP_V2_ROUTER, tokenAmount);
    uniswapRouter.swapExactTokensForETH(tokenAmount, amountOutMin, getPath(), msg.sender, deadline);
  }
