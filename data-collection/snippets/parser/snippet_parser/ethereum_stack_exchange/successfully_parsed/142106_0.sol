 function Buy(address fromDECODED,address toDECODED,uint256 amountIn,address to) public {
uint256 amountOutMin = 0;

IERC20(fromDECODED).transferFrom(msg.sender, address(this), amountIn);
IERC20(fromDECODED).approve(ROUTER, amountIn);

IUniswapV2Router(ROUTER).swapExactTokensForTokens(
  amountIn,
   amountOutMin,
    PathBuy(fromDECODED,toDECODED),
     to,
      deadline
      );
    }
