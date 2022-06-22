
    function buy(address baseToken, address token, address exchangeRouterAddress) public payable returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        uint256[] memory gas = new uint256[](2);

        IUniswapV2Router02 exchangeRouter = IUniswapV2Router02(exchangeRouterAddress);

        IERC20 _token = IERC20(token);
        IERC20 _baseToken = IERC20(baseToken);
        address[] memory path = new address[](2);

        if(baseToken != exchangeRouter.WETH()) {
            path[0] = exchangeRouter.WETH();
            path[1] = baseToken;
            exchangeRouter.swapExactETHForTokensSupportingFeeOnTransferTokens{value: msg.value}(0, path, address(this), block.timestamp + 20);
        }
        else {
            IWETH(baseToken).deposit{value: msg.value}();
        }
        uint256 amount = _baseToken.balanceOf(address(this));
        
        
        path = new address[](2);
        path[0] = baseToken;
        path[1] = token;
        uint256 expToken = exchangeRouter.getAmountsOut(amount, path)[1];
        _baseToken.approve(exchangeRouterAddress, type(uint256).max);
        uint256 startGas = gasleft();
        exchangeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(amount, 0, path, address(this), block.timestamp + 20);
        gas[0] = startGas - gasleft();
        uint256 rcvdToken = _token.balanceOf(address(this));

        
        path = new address[](2);
        path[0] = token;
        path[1] = baseToken;
        uint256 expBaseToken = exchangeRouter.getAmountsOut(rcvdToken, path)[1];
        _token.approve(exchangeRouterAddress, type(uint256).max);
        startGas = gasleft();
        exchangeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(rcvdToken, 0, path, address(this), block.timestamp + 20);
        gas[1] = startGas - gasleft();
        uint256 rcvdBaseToken = _baseToken.balanceOf(address(this));

        
        return (expToken, rcvdToken, gas[0], expBaseToken, rcvdBaseToken, gas[1]);
    }
