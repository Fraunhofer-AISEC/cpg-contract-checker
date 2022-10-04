function get_sha() constant returns (address, bytes32) {
    return (msg.sender, sha3(msg.sender));
}
