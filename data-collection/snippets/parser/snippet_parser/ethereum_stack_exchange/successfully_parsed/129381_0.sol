pragma solidity ^0.8;
pragma abicoder v2;

import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';

contract SwapExamples {
    
    
    

    
    

    ISwapRouter public immutable swapRouter;

    

    address public constant DAI = 0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1;
    address public constant WETH9 = 0x4200000000000000000000000000000000000006;
    address public constant USDC = 0x4e62882864fB8CE54AFfcAf8D899A286762B011B;

    
    uint24 public constant poolFee = 3000;

    constructor(ISwapRouter _swapRouter) {
        swapRouter = _swapRouter;
    }

    
    
    
    
    
    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {
        

        
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountIn);

        
        TransferHelper.safeApprove(DAI, address(swapRouter), amountIn);

        
        
        ISwapRouter.ExactInputSingleParams memory params =
            ISwapRouter.ExactInputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        
        amountOut = swapRouter.exactInputSingle(params);
    }

    
    
    
    
    
    
    function swapExactOutputSingle(uint256 amountOut, uint256 amountInMaximum) external returns (uint256 amountIn) {
        
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountInMaximum);

        
        
        TransferHelper.safeApprove(DAI, address(swapRouter), amountInMaximum);

        ISwapRouter.ExactOutputSingleParams memory params =
            ISwapRouter.ExactOutputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: amountInMaximum,
                sqrtPriceLimitX96: 0
            });

        
        amountIn = swapRouter.exactOutputSingle(params);

        
        
        if (amountIn < amountInMaximum) {
            TransferHelper.safeApprove(DAI, address(swapRouter), 0);
            TransferHelper.safeTransfer(DAI, msg.sender, amountInMaximum - amountIn);
        }
    }
}
