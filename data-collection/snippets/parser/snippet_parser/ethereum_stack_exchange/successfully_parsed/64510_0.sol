function _hmacsha256(bytes memory key, bytes memory message) internal pure returns (bytes32) {
    bytes32 keyl;
    bytes32 keyr;
    uint i;
    if (key.length > 64) {
        keyl = sha256(key);
    } else {
        for (i = 0; i < key.length && i < 32; i++)
            keyl |= bytes32(uint(key[i]) * 2 ** (8 * (31 - i)));
        for (i = 32; i < key.length && i < 64; i++)
            keyr |= bytes32(uint(key[i]) * 2 ** (8 * (63 - i)));
    }
    bytes32 threesix = 0x3636363636363636363636363636363636363636363636363636363636363636;
    bytes32 fivec = 0x5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
    return sha256(fivec ^ keyl, fivec ^ keyr, sha256(threesix ^ keyl, threesix ^ keyr, message));
}
