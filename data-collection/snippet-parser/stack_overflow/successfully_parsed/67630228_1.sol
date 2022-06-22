function recoverAddressFromTypedData(
    Bid memory bid,
    uint8 v,
    bytes32 r,
    bytes32 s
) public view returns (address) {
    bytes32 digest = _hashTypedDataV4(hashBid(bid));
    address signer = ecrecover(digest, v, r, s);
    return signer;
}
