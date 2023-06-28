
pragma solidity =0.8.6;
pragma abicoder v2;

import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';

contract SingleSwap {

    ISwapRouter public immutable swapRouter = ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);

    address public constant WMATIC = 0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889;
    address public constant USDC = 0xE097d6B3100777DC31B34dC2c58fB524C2e76921;

    uint24 public constant poolFee = 3000;

    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {

        TransferHelper.safeTransferFrom(WMATIC, msg.sender, address(this), amountIn);

        TransferHelper.safeApprove(WMATIC, address(swapRouter), amountIn);

        ISwapRouter.ExactInputSingleParams memory params =
            ISwapRouter.ExactInputSingleParams({
                tokenIn: WMATIC,
                tokenOut: USDC,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = swapRouter.exactInputSingle(params);
    }
}
