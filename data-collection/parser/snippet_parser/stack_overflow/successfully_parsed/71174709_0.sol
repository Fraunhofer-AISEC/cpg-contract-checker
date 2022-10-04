function send( address[3] memory receivers ) external payable {
    require(payable(receivers[0]).send(uint64(5)), "Transaction failed");
}
