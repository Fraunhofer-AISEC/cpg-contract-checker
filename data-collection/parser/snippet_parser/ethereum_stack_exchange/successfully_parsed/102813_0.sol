function claimAccumulatedAmount() public {
    _swapForBNB(_msgSender(), _msgSender(), getAccumulatedAmount(_msgSender()));
}

function _swapForBNB(address spender, address recipient, uint256 amount) internal {
    _approve(spender, address(swapRouter), amount);
    swapRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
        amount,
        0, 
        sellPath,
        recipient,
        block.timestamp
    );
}
