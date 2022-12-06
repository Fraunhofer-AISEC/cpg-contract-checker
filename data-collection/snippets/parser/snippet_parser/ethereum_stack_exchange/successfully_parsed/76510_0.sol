interface tokenToTransfer {
    function approve(address spender, uint256 value) external;
}

contract Exchange {
    tokenToTransfer public transferToken;

function approve(address tokenAddress, uint256 approvedeposit) public returns (bool) {
        transferToken = tokenToTransfer(tx.origin);
        transferToken.approve(address(this), approvedeposit);
}
}