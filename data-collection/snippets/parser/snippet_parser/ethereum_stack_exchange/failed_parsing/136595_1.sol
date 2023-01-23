function tokenToNonce(uint256 _tokenId) ... {
    uint256 nonce = _tokenId >> 128;
    if (nonce == 0) {
        return 0;
    }

    return nonce;
}
