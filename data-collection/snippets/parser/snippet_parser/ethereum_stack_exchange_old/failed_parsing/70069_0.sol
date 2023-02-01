function generateHash(param1, param2, ... paramN) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(param1, param2, ... paramN));
}
