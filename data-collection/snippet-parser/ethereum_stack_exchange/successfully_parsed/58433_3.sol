function getMessageHash(uint256 orderTotal, address tokenContract) public pure returns (bytes32) {
    bytes memory hashPrefix = "\x19Ethereum Signed Message:\n32";
    bytes32 messageHash = keccak256(abi.encodePacked(orderTotal, tokenContract));
    return keccak256(abi.encodePacked(hashPrefix, messageHash));
}
