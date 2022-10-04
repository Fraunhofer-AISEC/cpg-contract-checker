function mint(uint256 _amount) external {
    address sender = _msgSender();

    require(_amount * cost >= IERC20(tokenAddress).balanceOf(sender));
    IERC20(tokenAddress).safeTransferFrom(sender, address(this), _amount * cost);
    _safeMint(_amount);
}
