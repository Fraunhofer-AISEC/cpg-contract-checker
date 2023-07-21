
pragma solidity ^0.8.19;

import "./interfaces/IERC20.sol";
import "./interfaces/IUniswapV2Router01.sol";
import "./interfaces/IUniswapV2Router02.sol";

contract Swaptoken { 
   
   IUniswapV2Router01 private constant uniSwapRouter   = IUniswapV2Router01(0xE59242....61564);
   IUniswapV2Router02 private constant sushiSwapRouter = IUniswapV2Router02(0x1b02dA....97506);

   
   address private constant BNT = 0xF35cCfbcE1228014F66809EDaFCDB836BFE388f5;
   address private constant DAI = 0xaD6D458402F60fD3Bd25163575031ACDce07538D;

   .
   .
   .
   .
}
