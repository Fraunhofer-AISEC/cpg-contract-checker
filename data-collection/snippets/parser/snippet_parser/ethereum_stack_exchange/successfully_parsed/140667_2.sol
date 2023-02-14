function safeTrans(address to, uint amount) public {
    approve(address(this), amount);
    ERC20(this).safeTransferFrom(msg.sender, to, amount);
}
