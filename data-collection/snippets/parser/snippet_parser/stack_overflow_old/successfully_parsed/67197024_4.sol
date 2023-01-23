
pragma solidity ^0.6.6;

import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IERC20.sol";

contract SwapTokens {
    
    IUniswapV2Router02 public uniRouter = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    
    event test (uint timestamp, uint amountIn, uint amountOut, address[] path, uint allowance, address sender);
    
    function swapper(address token1, address token2) public  {
        address[] memory path = new address[](2);
        path[0] = token1;
        path[1] = token2;
        uint amountOut = 1 ether;
        uint amountIn = uniRouter.getAmountsIn(
            amountOut,
            path
        )[0];
                
        IERC20(token1).approve(address(uniRouter), amountIn);
        
        uint allowed = IERC20(token1).allowance(msg.sender, address(uniRouter));        
        
        emit test(now+90, amountIn, amountOut, path, allowed, msg.sender);

        uniRouter.swapExactTokensForTokens(
            amountIn, 
            amountOut,
            path, 
            msg.sender, 
            now + 120
        );
    }
}
