function withdraw(address to, uint256 amountOfEth) external override onlyOwner {
    require(_balances[to].shares >= amountOfEth, "Burn exceeds balance");

    (uint256 amortizedLiability, uint256 withdrawAmount) = _getWithdrawAmount(to, amountOfEth);

    _balances[to].eth = _balances[to].eth.sub(amountOfEth);
    _balances[to].liability = _balances[to].liability.sub(amortizedLiability);
    _eth = _eth.sub(amountOfEth);
    _totalLiability = _totalLiability.sub(amortizedLiability);

    if (withdrawAmount > 0) {
        IERC20(_token).safeTransfer(to, withdrawAmount);
        emit FeeWithdrawn(_token, to, withdrawAmount, amountOfEth);
    }
}
