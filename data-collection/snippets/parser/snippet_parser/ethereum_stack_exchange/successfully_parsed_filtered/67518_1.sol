function random() private view returns (uint256) {
    return uint(keccak256(abi.encodePacked(block.difficulty, now, players)));
}
