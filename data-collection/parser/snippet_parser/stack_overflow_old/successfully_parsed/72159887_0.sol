
pragma solidity ^0.8.10;
pragma abicoder v2;

import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";
import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";
import "@uniswap/v3-periphery/contracts/interfaces/IQuoter.sol";


contract Swap {
    address private constant SWAP_ROUTER =
        0xE592427A0AEce92De3Edee1F18E0157C05861564;
    address private constant WETH = 0xc778417E063141139Fce010982780140Aa0cD5Ab;
    address public tokenAddress;

    address public immutable _owner;
    ISwapRouter public immutable swapRouter;

    constructor(address token) {
        _owner = msg.sender;
        swapRouter = ISwapRouter(SWAP_ROUTER);
        tokenAddress = token;
    }

    function swapExactInputSingle() external payable {
        require(msg.value > 0, "Must pass non 0 ETH amount");
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: WETH,
                tokenOut: tokenAddress,
                fee: 3000,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: msg.value,
                amountOutMinimum: 1,
                sqrtPriceLimitX96: 0
            });

        swapRouter.exactInputSingle{value: msg.value}(params);
    }

    receive() external payable {}
}

