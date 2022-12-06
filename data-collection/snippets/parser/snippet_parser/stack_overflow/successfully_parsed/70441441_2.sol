function uniV2ReceiveETH(address _token0, uint _amount0) public payable returns (uint[] memory amountsReceived) {
        require(_amount0 > 0, "Must provide tokens if we want tokens in return!");
        address[] memory path = new address[](2);
        path[0] = _token0;
        path[1] = WETH;

        IERC20 token;
        token = IERC20(_token0);

        if (token.balanceOf(address(this)) > 0) {
            _amount0 = token.balanceOf(address(this));
        }

        require(token.approve(address(uniV2Router), _amount0 + 10000), "approval failed");

        
        uint amountOutMin = UniswapV2Library.getAmountsOut(address(uniV2Factory), _amount0, path)[1];
        amountsReceived = uniV2Router.swapExactTokensForETH(_amount0, amountOutMin, path, address(this), deadline);
        uint endBalance = address(this).balance;

        
        emit Swap(msg.sender, _amount0, endBalance);
}
