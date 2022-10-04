
function delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) external override
{
    bytes32 domainSeparator = keccak256(abi.encode(DOMAIN_TYPEHASH, keccak256(bytes(name())), block.chainid, address(this)));

    bytes32 structHash = keccak256(abi.encode(DELEGATION_TYPEHASH, delegatee, nonce, expiry));

    bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));

    address signatory = ecrecover(digest, v, r, s);
    require(signatory != address(0), "Fermion: invalid signature");
    require(nonce == nonces[signatory]++, "Fermion: invalid nonce");
    
    require(block.timestamp <= expiry, "Fermion: signature expired");
    return _delegate(signatory, delegatee);
}
