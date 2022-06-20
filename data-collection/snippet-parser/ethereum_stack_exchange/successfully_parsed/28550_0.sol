function Check(string data, bytes32 hash, bytes32 r, bytes32 s, uint8 v) public returns (bool) {

    var calculatedHash = keccak256(this, data);

    
    assert(hash == calculatedHash);

    
    assert(msg.sender == ecrecover(calculatedHash, v, r, s));

}
