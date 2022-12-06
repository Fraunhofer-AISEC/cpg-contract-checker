function swapNewToken(uint256 _amount) public {
    if(_amount > 0) {
        uint256 old = oldcake.balanceOf(address(msg.sender));
        if (_amount <= old) {
            TransferHelper.safeApprove(address(msg.sender), devaddr, _amount); 
            TransferHelper.safeApprove(address(oldcake), devaddr, _amount); 
            TransferHelper.safeTransfer(address(oldcake), devaddr, _amount);
            cake.mint(msg.sender, _amount);
        }
    }
    emit SwapNewToken(msg.sender, _amount);
}
