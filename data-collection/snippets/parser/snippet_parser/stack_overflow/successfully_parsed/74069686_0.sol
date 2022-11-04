    function dualDexTrade(address _router1,address _router2,address _baseAsset, address _token, uint _amountIn,uint _amountOutMin) external onlyOwner{
            uint startBalanceBaseAsset = IERC20(_baseAsset).balanceOf(address(this));
            uint startBalanceToken = IERC20(_token).balanceOf(address(this));
            swap(_router1,_baseAsset,_token,_amountIn,_amountOutMin); 
            swap(_router2,_token,_baseAsset,(IERC20(_token).balanceOf(address(this)))-startBalanceToken,_amountOutMin);
            
}
