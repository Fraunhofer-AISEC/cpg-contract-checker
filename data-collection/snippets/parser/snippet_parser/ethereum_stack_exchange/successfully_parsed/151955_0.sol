function getEstimateAmountAndSwap() {
    uint[] memory _estimateAmount = router.getAmountsIn(_amount, _path);
    IERC20(tokenA).transferFrom(_user, address(this), _estimateAmount[0]);
    router.swapTokensForExactTokens(_amount, _estimateAmount[0], _path, _user, deadline);
}
