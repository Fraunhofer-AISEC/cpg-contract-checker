pragma solidity 0.7.5;

import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Swap {

    address private constant QUICKSWAP_ROUTER_ADDRESS = 0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff;
    address private constant USDC_MUM_POLY_ADDRESS = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;

    IUniswapV2Router02 private quickSwapRouter = IUniswapV2Router02(QUICKSWAP_ROUTER_ADDRESS);

    function convertEthToUsdc() external payable {
        require(msg.value > 0, "Cannot handle 0 ETH");


        uint256 amountOutMin = 0;
        uint256 deadline = block.timestamp + 15;

        address[] memory path = new address[](2);
        path[0] = quickSwapRouter.WETH();
        path[1] = USDC_MUM_POLY_ADDRESS;


        quickSwapRouter.swapExactETHForTokens{value: msg.value}(
            amountOutMin,
            path,
            msg.sender,
            deadline
        );
    }

    function swapExactTokensForTokensProxy() external payable {
        require(msg.value > 0, "Cannot handle 0 ETH");

        ERC20(quickSwapRouter.WETH()).increaseAllowance(QUICKSWAP_ROUTER_ADDRESS, msg.value);

        address[] memory path = new address[](2);
        path[0] = quickSwapRouter.WETH();
        path[1] = USDC_MUM_POLY_ADDRESS;

        uint256 amountOutMin = 0;
        uint256 deadline = block.timestamp + 15;
        uint256 amountIn = msg.value;
        address to = msg.sender;

        swapExact(amountIn, amountOutMin, path, to, deadline);
    }

    function swapExact(uint256 amountIn, uint256 amountOutMin, 
        address[] memory path, address to, uint256 deadline) internal {
        quickSwapRouter.swapExactTokensForTokens(amountIn, amountOutMin, path, to, deadline);
    }
}
