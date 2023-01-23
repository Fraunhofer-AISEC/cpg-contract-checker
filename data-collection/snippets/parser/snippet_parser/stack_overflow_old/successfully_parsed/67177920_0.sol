pragma solidity ^0.6.6;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/token/ERC20/IERC20.sol";

contract Arbitrage {
    
    IUniswapV2Router02 public sushiRouter = IUniswapV2Router02(0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506);
    
    event test (uint timestamp, uint amountIn, uint amountOut, address[] path, uint allowance, address sender);
    
    function swapper(address token1, address token2) public  {
        address[] memory path = new address[](2);
        path[0] = token1;
        path[1] = token2;
        uint amountOut = 1 ether;
        uint amountIn = sushiRouter.getAmountsIn(
            amountOut,
            path
        )[0];
        
        
        
        IERC20(token1).approve(address(sushiRouter), amountIn);
        
        uint allowed = IERC20(token1).allowance(msg.sender, address(sushiRouter));
        
        emit test(now+90, amountIn, amountOut, path, allowed, msg.sender);

        sushiRouter.swapExactTokensForTokens(
            amountIn, 
            amountOut,
            path, 
            msg.sender, 
            now + 60
        );
    }
}
