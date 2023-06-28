

import "./Interfaces/IUniswapV2Router02.sol";
import "./Interfaces/IUniswapV2Factory.sol";

import "./Interfaces/IERC20.sol";
import "./Interfaces/UniswapV2Library.sol";



pragma solidity >0.5.0 < 0.9.0;

contract SwappingDex{

    address public constant uniswapRouter = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public constant uniswapFactory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address public constant sushiSwapRouter = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address public constant sushiSwapFactory = 0xC0AEe478e3658e2610c5F7A4A2E1777cE9e4f2Ac;
    address public constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;


    function swappingIn2DEX(address tokenIn, address tokenOut, uint amount, address to)external payable{

        address pairOnUniswap;
        address pairOnSushi;
        pairOnUniswap = IUniswapV2Factory(uniswapFactory).getPair(tokenIn, tokenOut);
        pairOnSushi = IUniswapV2Factory(sushiSwapFactory).getPair(tokenIn, tokenOut);

        require(
            pairOnSushi != 0x0000000000000000000000000000000000000000 &&
            pairOnUniswap != 0x0000000000000000000000000000000000000000,
            "No Pair"
        );

        address[] memory path;
        path = new address[](2);
        path[0] = tokenIn;
        path[1] = tokenOut;

        uint[]memory amountOutUniswap = IUniswapV2Router02(uniswapRouter).getAmountsOut(amount, path);


        IERC20(tokenIn).transferFrom(msg.sender, address(this), amount);
        IERC20(tokenIn).approve(uniswapRouter, amount);

        IUniswapV2Router02(uniswapRouter).swapETHForExactTokens{value: msg.value}(
            amountOutUniswap[1],
            path,
            to,
            block.timestamp
        );
}
}