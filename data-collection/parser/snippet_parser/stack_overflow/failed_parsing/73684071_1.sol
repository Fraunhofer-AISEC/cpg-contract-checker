hardhat: {
  chainId: 31337,
  forking: {
    url: `https:
    blockNumber: 14390000
  },
},

function swap() external payable override lock returns (uint256) {
    
   address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2).call(abi.encodeWithSelector(IERC20.approve.selector, 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45, 0x011C37937E080000));

    
    uint256 amountOut;
    ISwapRouter02.ExactInputSingleParams memory params =
        IV3SwapRouter.ExactInputSingleParams({
            tokenIn: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            tokenOut: 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984,
            fee: 0,
            recipient: msg.sender,
            
            amountIn: 0x011C37937E080000,   
            amountOutMinimum: 0x0,
            sqrtPriceLimitX96: 0
        });
    
    ISwapRouter02(0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45).exactInputSingle(params);

    return 1;
}
