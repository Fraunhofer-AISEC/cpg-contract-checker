
pragma solidity ^0.8.0;
pragma abicoder v2;

import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';

contract SwapExamples {
    
    
    
    
    

    ISwapRouter public immutable swapRouter;

    

    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant WETH = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6; 
    address public constant USDC = 0xEEa85fdf0b05D1E0107A61b4b4DB1f345854B952;

    
    uint24 public constant poolFee = 3000;
    uint256 public UsdOut;

    constructor(ISwapRouter _swapRouter) {
        swapRouter = _swapRouter;
    }

        
    
    
    
    

    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {
        

        

        
        TransferHelper.safeTransferFrom(WETH, msg.sender, address(this), amountIn); 

        
        TransferHelper.safeApprove(WETH, address(swapRouter), amountIn);

        
        
        ISwapRouter.ExactInputSingleParams memory params =
            ISwapRouter.ExactInputSingleParams({
                tokenIn: WETH,
                tokenOut: USDC,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        
        amountOut = swapRouter.exactInputSingle(params);
        UsdOut = amountOut;
    }
}
