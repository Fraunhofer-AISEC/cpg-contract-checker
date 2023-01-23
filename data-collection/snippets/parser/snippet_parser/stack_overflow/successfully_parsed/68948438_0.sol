function swapAndLiquify(uint256 tokens) private {
   
    uint256 half = tokens.div(2);
    uint256 otherHalf = tokens.sub(half);

    
    
    
    
    uint256 initialBalance = address(this).balance;

    
    swapTokensForEth(half); 

    
    uint256 newBalance = address(this).balance.sub(initialBalance);

    
    addLiquidity(otherHalf, newBalance);

    emit SwapAndLiquify(half, newBalance, otherHalf);
}
