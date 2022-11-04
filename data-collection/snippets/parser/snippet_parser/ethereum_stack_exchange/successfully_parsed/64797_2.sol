 function _myHashFunc2(string str1, uint256 int1) private pure returns(bytes32) {
    return keccak256(abi.encodePacked(str1, int1));
}
