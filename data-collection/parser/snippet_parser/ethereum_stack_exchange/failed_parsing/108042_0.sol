    function swapTokensForEth(uint256 tokenAmount) private {
    
    address[] memory path = new address[](2);
    path[0] = address(this);
    path[1] = uniswapV2Router.WETH();

    _approve(address(this), address(uniswapV2Router), tokenAmount);

    
    uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
        tokenAmount,
        0, 
        path,
        address(this),
        block.timestamp
    );
}

function swapAndSendDividends(uint256 tokens) private {
    swapTokensForEth(tokens);
    uint256 dividends = address(this).balance;

    (bool success,) = address(dividendTracker).call{value: dividends}("");
    if (success) {
        emit SentDividends(tokens, dividends);
    }
}

}
