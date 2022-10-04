event OnTransfer(
    address indexed to,
    address indexed from,
    string[] indexed indexedTransferIds,
    string[] transferIds,
    uint256 amount
);

function transfer(
    address to,
    uint256 amount,
    string[] memory transferId
) external {
    bool transfered = token.transfer(to, amount);

    require(transfered, "Transfer failed");

    emit OnTransfer(to, address(this), transferId, transferId, amount);
}
