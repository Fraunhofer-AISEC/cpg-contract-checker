function _myHashFunc(string str1, address addr) private pure returns(bytes32) {
    return keccak256(abi.encodePacked(str1, addr));
}
