function encodePackedTest(address a, uint b, string c) public pure returns(bytes32, bytes32){
    return (keccak256(a, b, c), keccak256(abi.encodePacked(a, b, c)));
}
