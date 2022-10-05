function approveTransfer() external {
    ...
    approver.push(Approver(approver.length, msg.sender));
}

function ApproverList() external view returns(Approver[] memory) {
    return approver;
}
