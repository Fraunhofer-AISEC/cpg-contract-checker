modifier callerIsUser() {
    require(tx.origin == msg.sender, "The caller cannot be another contract");
    _;
}
