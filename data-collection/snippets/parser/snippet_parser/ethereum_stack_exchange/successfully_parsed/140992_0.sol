
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";
import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";

contract ExampleSwap {
    address private constant SWAP_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    ISwapRouter immutable swapRouter = ISwapRouter(SWAP_ROUTER);

    function swapOnUniswap(address tokenA, address tokenB, uint amountIn, uint24 _poolFee, uint _amountOutMinimum, uint160 _sqrtPriceLimitX96) public {
       require(amountIn>0, "amountIn can't be zero");
       require(IERC20(tokenA).transferFrom(msg.sender, address(this), amountIn), "transferFrom failed.");
       require(IERC20(tokenA).approve(address(swapRouter), amountIn), "approve failed.");

       ISwapRouter.ExactInputSingleParams memory params =
           ISwapRouter.ExactInputSingleParams({
               tokenIn: tokenA,
               tokenOut: tokenB,
               fee: _poolFee,
               recipient: address(this),
               deadline: block.timestamp,
               amountIn: amountIn,
               amountOutMinimum: _amountOutMinimum,
               sqrtPriceLimitX96: _sqrtPriceLimitX96
           });

       uint amountOut = swapRouter.exactInputSingle(params);
   }
}
