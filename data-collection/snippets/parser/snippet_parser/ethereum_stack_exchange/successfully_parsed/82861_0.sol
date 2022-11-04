function something(bytes32 hash) public returns (bool) {
    bool success;
    success = check(hash);
    emit LogSomething(msg.sender, hash, success);
    return success;
}
