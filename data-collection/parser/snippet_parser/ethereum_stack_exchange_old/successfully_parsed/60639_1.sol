function __callback(bytes32 myid, string result) {
    require(msg.sender == oraclize_cbAddress());

    address originalSender = senderAddresses[myid];

    

}
