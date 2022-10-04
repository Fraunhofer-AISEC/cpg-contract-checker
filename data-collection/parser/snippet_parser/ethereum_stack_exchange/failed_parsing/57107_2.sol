mapping (address => uint256) private refundBalance;

modifier refundable () {
    uint256 gasBefore = gasleft ();
    _;
    uint256 toRefund = tx.gasprice * (gasleft () - gasBefore);
    if (!tx.origin.send (toRefund))
        refundBalance [tx.origin] += toRefund;
}

function withdraw () public {
    uint256 toTransfer = refundBalance [msg.sender];
    refundBalance [msg.sender] = 0;
    msg.sender.transfer (toTransfer);
}

function expensiveCleanupFunction () refundable internal {
    ... shuffle around some storage ...
}
