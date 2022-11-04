function hashMultipleValues(uint256 inputNumber, address inputAddress) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(inputNumber, inputAddress));
}
