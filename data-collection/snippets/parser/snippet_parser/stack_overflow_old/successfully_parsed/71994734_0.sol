

function depositETH(address _zkSyncAddress) external payable {
    require(_zkSyncAddress != SPECIAL_ACCOUNT_ADDRESS, "P");
    require(msg.value > 0, "M"); 
    requireActive();
    registerDeposit(0, SafeCast.toUint128(msg.value), _zkSyncAddress);
}
