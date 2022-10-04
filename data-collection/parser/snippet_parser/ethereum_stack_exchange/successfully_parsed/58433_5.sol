function getMessageHash(uint256 orderTotal, address tokenContract) public pure returns (bytes32) {
    bytes32 messageHash = keccak256(abi.encodePacked(orderTotal, tokenContract));
    returnmessageHash;
}
