function generateSalt() private view returns (bytes32) {
    return keccak256(abi.encodePacked(block.number, tx.gasprice, randomNumber));
}
