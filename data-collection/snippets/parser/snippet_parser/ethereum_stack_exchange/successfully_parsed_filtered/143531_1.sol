interface IKyberswapRouter {
    struct ExactInputSingleParams {
        address tokenIn; 
        address tokenOut; 
        uint16 fee; 
        address recipient; 
        uint256 deadline; 
        uint256 amountIn; 
        uint256 minAmountOut; 
        uint160 limitSqrtP; 
    }

    function swapExactInputSingle(ExactInputSingleParams memory params) external payable;
}
