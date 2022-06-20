  contract ProxyChi {
     Uniswap uni = Uniswap(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    
     function simpleTradeCall(uint amtTkIn, uint amtTkOut, address[] memory path) public returns (uint[] memory amounts){
     return uni.swapExactTokensForTokens(amtTkIn, amtTkOut, path, msg.sender, now+120);
    }
 contract Uniswap{   
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}
