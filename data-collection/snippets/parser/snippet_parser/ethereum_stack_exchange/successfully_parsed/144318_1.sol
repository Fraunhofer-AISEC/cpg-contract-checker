function dualDexTrade(address _router1, address _router2, address _token1, address _token2, uint256 _amount) external {
    uint startBalance = IERC20(_token1).balanceOf(address(this));
    uint token2InitialBalance = IERC20(_token2).balanceOf(address(this));
    swap(_router1, _token1, _token2, _amount);
    uint token2Balance = IERC20(_token2).balanceOf(address(this));
    uint tradeableAmount = token2Balance - token2InitialBalance;
    swap(_router2, _token2, _token1, tradeableAmount);
    uint endBalance = IERC20(_token1).balanceOf(address(this));
    require(endBalance > startBalance, "Trade Reverted, No Profit Made");
}
