function payMint(address _minter, address _paymentToken, uint256 _amount) internal {
    require(tokenCost[_paymentToken] > 0, "Payment token not accepted");
    if(_paymentToken == address(0)) {
        require(msg.value >= tokenCost[_paymentToken], "Insufficient value to cover token price");
        (bool sent, ) = checkoutWallet.call{ value: msg.value }("");
        require(sent, "Failed to send native coin");
    } else {
        IERC20 token = IERC20(_paymentToken);
        SafeERC20.safeTransferFrom(
            token,
            _minter,
            checkoutWallet,
            tokenCost[_paymentToken] * _amount
        );
    }
}
