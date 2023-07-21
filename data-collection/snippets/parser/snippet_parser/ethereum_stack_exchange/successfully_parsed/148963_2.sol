import "./libraries/Path.sol"
contract Check {
    using Path for bytes;
    struct SwapCallbackData {
        bytes path; 
        address payer; 
    }
    function _swap(
    uint256 amountIn,
    address recipient,
    uint160 sqrtPriceLimitX96,
    SwapCallbackData memory data
    ) internal returns (uint256 amountOut) {
    
    
    (address tokenIn, address tokenOut, uint24 tickSpacing) = data
    .path
    .decodeFirstPool();
  }
}
