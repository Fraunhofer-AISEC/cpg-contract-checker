function genRandom() private view returns (uint) {
    uint rand = uint(keccak256(block.blockhash(block.number-1)));
    return uint(rand % (10 ** 20));
}
