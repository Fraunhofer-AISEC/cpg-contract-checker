function tossCoin() private view returns (bool) {
    return ((uint(keccak256(block.difficulty, now, players.length)) % 2) == 0);
}
