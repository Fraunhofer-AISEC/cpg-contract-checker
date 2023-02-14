function swapTokensForEthAndSend(uint256 tokenAmount, address payable recipient) private {
    address[] memory path = new address[](2);
    path[0] = address(this); 
    path[1] = _pancakeswapV2Router.WETH();

     _approve(address(this), address(_pancakeswapV2Router), tokenAmount);

    _pancakeswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
        tokenAmount,
        0,
        path,
        recipient,
        block.timestamp.add(86400)
    );
}
