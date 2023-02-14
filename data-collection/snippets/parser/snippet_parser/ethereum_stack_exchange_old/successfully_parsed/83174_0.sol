uint256 constant HALF_CURVE_ORDER = uint256(0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0);

function verifySig(
    bytes32 hash,
    bytes32 r,
    bytes32 s,
    uint8 v
) public {
    require(
        uint256(s) <= HALF_CURVE_ORDER,
        "found malleable signature, please insert a low-s signature"
    );

    address signer = ecrecover(hash, v, r, s)
    
}
