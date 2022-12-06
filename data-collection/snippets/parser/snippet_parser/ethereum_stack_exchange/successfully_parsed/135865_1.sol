receive() external payable {
    buyTokens(msg.value);
}

function buyTokens(uint256 _amount) private {
    address[] memory path;
    path = new address[](2);
    path[0] = WBNB;
    path[1] = TOKEN;

    
    router.swapExactETHForTokens{ value: _amount }(
        0, 
        path, 
        address(this), 
        block.timestamp
    );
}
