struct SwapParameters {
      address router;
      address recipient;
      address tokenIn;
      address tokenOut;
      uint24 fee;
      uint256 amountIn;
      uint16 slippage;
      uint32 oracleSeconds;
    }

function swap(SwapParameters memory params) external auth(false) returns (uint256 amountOut) {...}
