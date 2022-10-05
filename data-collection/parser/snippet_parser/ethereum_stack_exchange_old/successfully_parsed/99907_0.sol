struct Payment {
    uint256 amount;
    bytes32 salt;
    bytes32 authorClientHash;
    bytes32 payToHash;
    address author;
    address client;
    address payTo;
    bytes authorSig;
    bytes clientSig;
    bytes payToSig;
    bytes approvedSignerSig;
}

function batchPay(Payment[] calldata payments) external onlyApprovedSender nonReentrant { }
