
pragma solidity ^0.7.3;

import "./IUniswap.sol";
import "./IERC20.sol";

contract Uniswap {

    
    address internal constant UNISWAP_ROUTER_ADDRESS =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    IUniswap uniswap;

    constructor() {
        uniswap = IUniswap(UNISWAP_ROUTER_ADDRESS);
    }

    
    function swapExactTokensForETH(
        address tokenIn,
        uint256 amountIn,
        uint256 amountOutMin
    ) external {
        
        _transferToken(tokenIn, msg.sender, address(this), amountIn);

        
        address[] memory path = new address[](2);
        path[0] = tokenIn;
        path[1] = uniswap.WETH();

        
        IERC20(tokenIn).approve(address(uniswap), amountIn);

        
        uint256 deadline = block.timestamp + 15;

        
        uniswap.swapExactTokensForETH(
            amountIn,
            amountOutMin,
            path,
            msg.sender,
            deadline
        );
    }

    function _transferToken(
        address token,
        address from,
        address to,
        uint256 amount
    ) internal {
        require(
            IERC20(token).allowance(from, to) >= amount,
            "Uniswap approval is missing"
        );
        IERC20(token).transferFrom(from, to, amount);
    }
  
}
