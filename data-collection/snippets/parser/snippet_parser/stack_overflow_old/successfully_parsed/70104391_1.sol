function random(uint _interval) internal returns (uint) {
    nonce++;
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, nonce))) % _interval;
}
