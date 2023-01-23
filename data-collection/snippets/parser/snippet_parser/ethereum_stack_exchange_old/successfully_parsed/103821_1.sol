function() external payable {
    require(msg.sender != tx.origin, "OneSplit: do not send ETH directly");
}
