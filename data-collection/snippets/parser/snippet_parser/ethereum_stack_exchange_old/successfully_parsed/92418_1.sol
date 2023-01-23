function generateBlindedBidBytes32(uint256 value, bool fake, bytes32 secret) public view returns (bytes32) {
    return keccak256(abi.encodePacked(value, fake, secret));
}
