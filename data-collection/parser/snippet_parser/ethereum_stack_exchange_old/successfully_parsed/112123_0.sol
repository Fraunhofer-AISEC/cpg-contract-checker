pragma solidity 0.6.6;

import './IERC20.sol';
import './IUniswapV2Factory.sol';
import './IUniswapV2Pair.sol';
import './IUniswapV2Router01.sol';
import './IUniswapV2Router02.sol'; 

contract justLiquidity {
    address private constant UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    
    function _addLiquidity (address _token1, address _token2, uint256 _amount1, uint256 _amount2) external {


        IERC20(_token1).transferFrom(msg.sender, address(this), _amount1); 
        IERC20(_token2).transferFrom(msg.sender, address(this), _amount2);
        IERC20(_token2).approve(UNISWAP_V2_ROUTER, _amount2 * 999);
        
        IERC20(_token1).approve(UNISWAP_V2_ROUTER, _amount1 * 999);
        



        IUniswapV2Router02(UNISWAP_V2_ROUTER).addLiquidity(_token1, _token2, _amount1, _amount2, 1, 1, address(this), block.timestamp); 

    }
}
