contract Random {
    uint nonce;


    function random() internal returns (uint) {
    uint random = uint(keccak256(now, msg.sender, nonce)) % 100;
    nonce++;
    return random;
    }

    function getRandom() external view returns (uint) {
        return random();
    }
}
