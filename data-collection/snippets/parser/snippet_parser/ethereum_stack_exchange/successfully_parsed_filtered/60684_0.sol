function random() internal returns (uint) {
    uint random = uint(keccak256(now, msg.sender, nonce)) % 1000;
    nonce++;
    return random;
}
