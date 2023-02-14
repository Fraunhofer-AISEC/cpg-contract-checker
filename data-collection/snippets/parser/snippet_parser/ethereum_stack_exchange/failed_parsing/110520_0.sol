

IBEP20(fromToken).safeTransferFrom(msg.sender, address(this), _amount);



function swap(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn,
        uint256 _amountOutMin,
        address _to
    ) private {
        
        
        IBEP20(_tokenIn).safeApprove(PANCAKESWAP_ROUTER, _amountIn);

        
        
        
        address[] memory path;
        if (_tokenIn == WBNB || _tokenOut == WBNB) {
            path = new address[](2);
            path[0] = _tokenIn;
            path[1] = _tokenOut;
        } else {
            path = new address[](3);
            path[0] = _tokenIn;
            path[1] = WBNB;
            path[2] = _tokenOut;
        }

        
        
        
        IPancakeRouter(PANCAKESWAP_ROUTER).swapExactTokensForTokens(
            _amountIn,
            _amountOutMin,
            path,
            _to,
            block.timestamp
        );
    }
