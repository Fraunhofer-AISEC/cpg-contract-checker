function random() internal view returns (uint) {
    return uint(blockhash(block.number - 1));
}

function random() internal view returns (uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)))
}
