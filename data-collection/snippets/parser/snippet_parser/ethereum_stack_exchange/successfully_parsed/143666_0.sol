contract SwapExamples {
    ISwapRouter public constant swapRouter = ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);

    address public constant UNI = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;   
    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;   
    address public constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;  

    uint24 public constant poolFee = 3000;

    function swapExactInputMultihop(uint256 amountIn) external returns (uint256 amountOut) {
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);
        TransferHelper.safeApprove(WETH9, address(swapRouter), amountIn);

        ISwapRouter.ExactInputParams memory params =
            ISwapRouter.ExactInputParams({
                path: abi.encodePacked(WETH9, poolFee, UNI, poolFee, DAI),
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0
            });
        amountOut = swapRouter.exactInput(params); 
    }
}
