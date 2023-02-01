uint256 deadline = block.timestamp + 1800;
address[] path = [WETH, UBI]; 

InterfaceUniswapV2Router(UNISWAP_V2_ROUTER_ADDRESS).swapExactETHForTokens
{value: address(this).balance}(1, path, address(this), deadline);
