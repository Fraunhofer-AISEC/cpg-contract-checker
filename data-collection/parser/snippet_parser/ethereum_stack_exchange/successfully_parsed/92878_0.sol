  function swapTokensForEth(address token, uint amountIn, uint deadline) external payable {
    IERC20(token).transferFrom(msg.sender, address(this), amountIn);

    address[] memory path = new address[](2);
    path[0] = token;
    path[1] = uniswap.WETH();

    IERC20(token).approve(address(uniswap), amountIn);

    
    uint[] memory amountOutMin = getEstimatedTokenForETH(amountIn, path); 

    
    uniswap.swapExactTokensForETH(
      amountIn,
      amountOutMin[1],
      path,
      msg.sender,
      deadline
    );
  }

  function getEstimatedTokenForETH(uint amountIn , address[] memory path) public view returns (uint[] memory) {
      return uniswap.getAmountsOut(amountIn, path);
  }
