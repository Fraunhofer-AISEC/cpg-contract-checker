interface pancackswap_interface {


function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
external returns (uint[] memory amounts);
}

