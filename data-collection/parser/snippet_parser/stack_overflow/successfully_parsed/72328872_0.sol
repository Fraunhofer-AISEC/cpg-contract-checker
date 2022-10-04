
pragma solidity >=0.7.5;
pragma abicoder v2;

import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";
import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";
import "@uniswap/swap-router-contracts/contracts/interfaces/IV3SwapRouter.sol";

contract Swap {

    address private constant SWAP_ROUTER =
        0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address private constant SWAP_ROUTER_02 =
        0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;

    address private constant WETH = 0xc778417E063141139Fce010982780140Aa0cD5Ab; 
    address public constant DAI = 0xc7AD46e0b8a400Bb3C915120d284AafbA8fc4735; 

    ISwapRouter public immutable swapRouter = ISwapRouter(SWAP_ROUTER);
    IV3SwapRouter public immutable swapRouter02 = IV3SwapRouter(SWAP_ROUTER_02);

    function safeTransferWithApprove(uint256 amountIn, address routerAddress)
        internal
    {
        TransferHelper.safeTransferFrom(
            DAI,
            msg.sender,
            address(this),
            amountIn
        );

        TransferHelper.safeApprove(DAI, routerAddress, amountIn);
    }

    function swapExactInputSingle(uint256 amountIn)
        external
        returns (uint256 amountOut)
    {
        safeTransferWithApprove(amountIn, address(swapRouter));

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH,
                fee: 3000,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = swapRouter.exactInputSingle(params);
    }

    function swapExactInputSingle02(uint256 amountIn)
        external
        returns (uint256 amountOut)
    {
        safeTransferWithApprove(amountIn, address(swapRouter02));

        IV3SwapRouter.ExactInputSingleParams memory params = IV3SwapRouter
            .ExactInputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH,
                fee: 3000,
                recipient: msg.sender,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = swapRouter02.exactInputSingle(params);
    }
}
