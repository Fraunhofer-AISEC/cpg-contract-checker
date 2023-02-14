function random() private view returns (uint) {
    uint randomHash = uint(keccak256(block.difficulty, now));
    return randomHash % 1000;
} 
