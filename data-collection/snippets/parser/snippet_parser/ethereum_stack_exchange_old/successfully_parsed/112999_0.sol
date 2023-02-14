pragma solidity >=0.6.6;

import { SafeMath } from '@openzeppelin/contracts/math/SafeMath.sol';
import { IERC20 } from '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import { SafeERC20 } from '@openzeppelin/contracts/token/ERC20/SafeERC20.sol';
import { IUniswapV2Router02 } from './../interfaces/uniswap/v2/IUniswapV2Router02.sol';

contract UniswapV2SwapExample is Withdrawable {
using SafeERC20 for IERC20;
using SafeMath for uint256;


IUniswapV2Router02 uniswapV2Router; 

constructor(address _uniswapV2Router) public {
    uniswapV2Router = IUniswapV2Router02(_uniswapV2Router); 
}



function swapSingle(address tokenIn, uint amountIn, address tokenOut) internal returns (uint) {
    address[] memory path = new address[](2);
    path[0] = tokenIn;
    path[1] = tokenOut;

    return swap(tokenIn, amountIn, tokenOut, path); 
} 

function swap(address tokenIn, uint amountIn, address tokenOut, address[] memory path) internal returns (uint) {
    require(IERC20(tokenIn).balanceOf(address(this)) >= amountIn, "Not enough balance to swap"); 

    require(IERC20(tokenIn).approve(address(uniswapV2Router), amountIn), 'approve failed.');

    uint balanceBefore = IERC20(tokenOut).balanceOf(address(this));

    uint[] memory amounts; 
    if (tokenIn == address(uniswapV2Router.WETH())) {

        uniswapV2Router.swapExactETHForTokens{ value: amountIn }(0, path, address(this), block.timestamp); 
        
    }
    else if (tokenOut == address(uniswapV2Router.WETH())) {
        uniswapV2Router.swapExactTokensForETH(amountIn, 0, path, address(this), block.timestamp); 
        
    }
    else {
        uniswapV2Router.swapExactTokensForTokens(amountIn, 0, path, address(this), block.timestamp);
        
    }
    uint amountOut = IERC20(tokenOut).balanceOf(address(this)).sub(balanceBefore); 
    
    
    return amountOut; 
}


receive() payable external {}


function swapTest(address _assetIn, uint _amountIn, address _assetOut) public onlyOwner returns (uint) {
    return swapSingle(_assetIn, _amountIn, _assetOut); 
}



}
