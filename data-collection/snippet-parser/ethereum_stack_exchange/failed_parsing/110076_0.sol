

contract MultiSwap {
    IUniswapV2Router02 router;
    IUniswapV2Factory factory;
    constructor(IUniswapV2Router02 _router, IUniswapV2Factory _factory) {
        router = _router;
        factory = _factory;
    }
    function multiswap(address[] path, uint256 inputAmount, uint256 slippagePercentForEach) external {
        IERC20(path[0]).transferFrom(msg.sender, address(this), inputAmount); 
        for(uint256 i, i < path.length - 1, i++) {
            address[] memory tempPath = new address[](2);
            tempPath[0] = path[i];
            tempPath[1] = path[i+1]; 
            uint256 amountIn = IERC20(path[i]).balanceOf(address(this)); 
            IUniswapV2Pair pair = factory.getPair(path[i], path[i+1]); 
            (uint256 reserve1, uint256 reserve2) = pair.getReserves(); 
            (uint256 reserveIn, uint256 reserveOut) = pair.token0() = path[i] ? (reserve1, reserve2) : (reserve2, reserve1); 
            uint256 expectedOutput = amountIn * reserveOut / reserveIn; 
            uint256 minimumOutput = expectedOutput - (expectedOutput * slippagePercentForEach / 100); 
            if (i == path.length - 2) { 
                router.swapExactTokensForTokensSupportingFeeOnTransferTokens( 
                    amountIn,
                    minimumOutput,
                    tempPath,
                    msg.sender,
                    block.timestamp;
                )
            }
            else {
                router.swapExactTokensForTokensSupportingFeeOnTransferTokens( 
                    amountIn,
                    minimumOutput,
                    tempPath,
                    address(this),
                    block.timestamp;
                )
            }
        }
    }
}
