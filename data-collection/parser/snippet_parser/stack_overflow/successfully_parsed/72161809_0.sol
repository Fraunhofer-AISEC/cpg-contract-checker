pragma solidity ^0.8.0;

import {TokenSwap} from "./uniswap.sol";
import {ISwapRouter} from '../interfaces/ISwapRouter.sol';
import {TransferHelper} from '../contracts/uniswap/TransferHelper.sol';


contract swapTest {

    address public immutable tokenIn = 0xb685400156cF3CBE8725958DeAA61436727A30c3;
    address public immutable tokenOut = 0xe6b8a5CF854791412c1f6EFC7CAf629f5Df1c747;
    uint public immutable amount = 0.01*(1 ether);

    
    address private constant SWAP_ROUTER = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
    ISwapRouter public immutable swapRouter = ISwapRouter(SWAP_ROUTER);
    uint24 public constant poolFee = 3000;

    
    function swapExactInputSingle() public returns (uint256 amountOut)
    {
        TransferHelper.safeApprove(tokenIn, SWAP_ROUTER, amount);
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: tokenIn,
                tokenOut: tokenOut,
                fee: 3000,
                recipient: address(this),
                deadline: block.timestamp,
                amountIn: amount,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = swapRouter.exactInputSingle(params);
    }

} 
