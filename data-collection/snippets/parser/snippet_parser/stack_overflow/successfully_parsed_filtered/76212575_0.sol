
pragma solidity 0.8.0;


import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract UniswapTrade {
    
    IUniswapV2Router02 public router;
    IUniswapV2Factory public factory;
    
    
    constructor(address routerAddress, address factoryAddress) {
        router = IUniswapV2Router02(routerAddress);
        factory = IUniswapV2Factory(factoryAddress);
    }
    
    
    function swapTokensForTokens(
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOutMin,
        address to,
        uint256 deadline
    ) external {
        
        address[] memory path = new address[](2);
        path[0] = tokenIn;
        path[1] = tokenOut;
        
        
        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        
        
        IERC20(tokenIn).approve(address(router), amountIn);
        
        
        router.swapExactTokensForTokens(
            amountIn,
            amountOutMin,
            path,
            to,
            deadline
        );
    }
}

