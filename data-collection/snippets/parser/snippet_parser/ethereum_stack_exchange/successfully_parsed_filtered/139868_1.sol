function _transfer(address to, uint256 amount) internal {
    bool callStatus;
    assembly {
        callStatus := call(gas(), to, amount, 0, 0, 0, 0)
    }
    if (!callStatus) revert TransferFailed();
}
