uint256 public lastBought;
function buy(
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external {
    require(block.timestamp >= lastBought + 1 hours);
    IERC20(path[0]).approve(address(router), amountIn);
    router.swapExactTokensForETH(
           amountIn, 
           amountOutMin, 
           path, 
           to,     
           deadline
    );
    lastBought = block.timestamp;
  }
