
IERC20 UniToken = IERC20(UniTokenAddress)
IUniswapV2Router01 router = IUniswapV2Router01(UniswapRouterAddress) 


function TransferAndSwap(uint256 amount) public {

UniToken.transferFrom(msg.sender, address(this), amount) 

address[] memory path = new address[](2);
path[0] = address(UniToken);
path[1] = 

UniToken.approve(address(router), amount)

router.swapExactTokensForETH(
    amount,
    0, 
    path,
    address(this), 
    block.timestamp
);
}

fallback() external payable {}
