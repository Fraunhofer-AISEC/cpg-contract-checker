interface IUniswap {
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline) external payable  returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline) external returns (uint[] memory amounts);   
}

interface IERC20 {
     function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
     function approve(address spender, uint256 amount) external returns (bool);
     function allowance(address owner, address spender) external view returns (uint256);
}
