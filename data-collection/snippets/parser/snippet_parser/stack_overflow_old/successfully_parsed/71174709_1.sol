function send( address[3] memory receivers ) external payable {
    for (uint i = 0; i < receivers.length; i++) {
      require(payable(receivers[i]).send(uint64(5)), "Transaction failed");
    }
}
