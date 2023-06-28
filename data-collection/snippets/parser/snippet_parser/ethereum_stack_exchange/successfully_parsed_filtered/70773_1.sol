function fx(bytes32 _left, uint32 _right) public pure returns (bytes32 hash) {
    return keccak256(abi.encodePacked(_left,_right)); 
}
