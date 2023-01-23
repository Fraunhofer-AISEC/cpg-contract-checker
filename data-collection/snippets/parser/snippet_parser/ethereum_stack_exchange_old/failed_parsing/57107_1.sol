modifier refundable () {
    uint256 gasBefore = gasleft ();
    _;
    tx.origin.send (tx.gasprice * (gasleft () - gasBefore));
}

function expensiveCleanupFunction() refundable internal {
    ... shuffle around some storage ...
}
