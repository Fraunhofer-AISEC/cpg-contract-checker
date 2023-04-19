function _flashLoanCallBack(address sender, uint256, uint256, bytes calldata data) internal {
    (address flashLoanPool, address token1, address token2, address token3, address token4, address _router1, address _router2, address _router3, uint256 amount) = abi.decode(data, (address, address, address, address, address, address, address, address, uint256));
    require(sender == address(this) && msg.sender == flashLoanPool, "HANDLE_FLASH_NENIED");
    if (token4 == address(0x000000000000000000000000000000000000000F)) {
        if (token3 == address(0x000000000000000000000000000000000000000F)) {
            this.dualDexTrade(_router1, _router2, token1, token2, amount);}
        else {
            this.triDexTrade(_router1, _router2, _router3, token1, token2, token3, amount);
            }
    }else {
        this._instaTrade(_router1, token1, token2, token3, token4, amount);
}
    IERC20(token1).transfer(flashLoanPool, amount);
}
