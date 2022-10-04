function fx(bytes32 _left, uint32 _right) public returns (bytes32 hash) {
    hash = keccack256(_left + _right); 
}
