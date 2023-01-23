function testVerify(address signer, bytes memory signature_rsv) external pure returns(bool, address) {
    bytes32 hashedMessage = keccak256(abi.encodePacked(signer));

    (uint8 v, bytes32 r, bytes32 s) = splitSignature(signature_rsv);

    address recov_signer = ecrecover(hashedMessage, v, r, s);

    return (recov_signer == signer, recov_signer);
}

function splitSignature(bytes memory sig)
    internal
    pure
    returns (uint8 v, bytes32 r, bytes32 s)
{
    require(sig.length == 65, "Signature length is wrong !");

    assembly {
        
        r := mload(add(sig, 32))
        
        s := mload(add(sig, 64))
        
        v := byte(0, mload(add(sig, 96)))
    }
    return (v, r, s);
}
