

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


interface IUniswapV2Router {
    function getAmountsOut(uint amountIn, address[] memory path) external view returns (uint[] memory amounts);
}

interface ISushiswapRouter {
    function getAmountsOut(uint amountIn, address[] memory path) external view returns (uint[] memory amounts);
}

contract ArbitrageBot {
    address public constant uniswapRouter = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public constant sushiswapRouter = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;

    function arb() external {
        address[] memory path = new address[](2);
        path[0] = address(0x11fE4B6AE13d2a6055C8D9cF65c55bac32B5d844); 
        path[1] = address(0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6); 

        uint uniswapAmount = IUniswapV2Router(uniswapRouter).getAmountsOut(1000, path)[1];
        uint sushiswapAmount = ISushiswapRouter(sushiswapRouter).getAmountsOut(1000, path)[1];

        if (uniswapAmount > sushiswapAmount) {
            
            uint256 amountIn = 1000;
            uint256 amountOutMin = sushiswapAmount;

            IERC20(path[0]).approve(sushiswapRouter, amountIn);

            ISushiswapRouter(sushiswapRouter).swapExactTokensForTokens(
                amountIn,
                amountOutMin,
                path,
                address(this),
                block.timestamp
            );

            IUniswapV2Router(uniswapRouter).swapTokensForExactTokens(
                amountOutMin,
                uniswapAmount,
                path,
                msg.sender,
                block.timestamp
            );
...
