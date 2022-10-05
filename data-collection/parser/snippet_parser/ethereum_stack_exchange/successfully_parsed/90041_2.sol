function depositERC20Token(string memory tokenName, uint256 amount) public {
    IERC20(contractAddressERC20[tokenName]).approve(address(this), amount);
    IERC20(contractAddressERC20[tokenName]).transferFrom(_msgSender(), address(this), amount);
    emit DepositERC20Token(tokenName, _msgSender(), amount);
}
