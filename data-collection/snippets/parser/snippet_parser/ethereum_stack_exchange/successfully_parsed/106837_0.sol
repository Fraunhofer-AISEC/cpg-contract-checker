
pragma solidity =0.7.6;
pragma abicoder v2;

import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';

interface IUniswapRouter is ISwapRouter {
    function refundETH() external payable;
}

contract Uniswap3 {
    

    IUniswapRouter public constant uniswapRouter = IUniswapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);
    address public constant DAI = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;
    address public constant WETH9 = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;

    
    uint24 public constant poolFee = 3000;

    
    
    
    
    
    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {
        

        
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        
        TransferHelper.safeApprove(WETH9, address(uniswapRouter), amountIn);

        
        
        ISwapRouter.ExactInputSingleParams memory params =
            ISwapRouter.ExactInputSingleParams({
                tokenIn: WETH9,
                tokenOut: DAI,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        
        amountOut = uniswapRouter.exactInputSingle(params);
        uniswapRouter.refundETH();
        
        
        (bool success,) = msg.sender.call{ value: address(this).balance }("");
        require(success, "refund failed");
    }
    
    
    receive() payable external {}
}
