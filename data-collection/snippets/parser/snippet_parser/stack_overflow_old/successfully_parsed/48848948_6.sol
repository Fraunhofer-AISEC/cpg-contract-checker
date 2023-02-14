function random() private view returns (uint) {
    return uint(keccak256(block.difficulty, now));
} 
