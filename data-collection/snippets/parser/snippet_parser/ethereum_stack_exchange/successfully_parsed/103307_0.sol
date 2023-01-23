function verify(string memory _msg, bytes memory _sig) public pure returns (address) {
    bytes memory _msgHex = bytes(_msg);
    bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n", uint2str(_msgHex.length), _msgHex));
    (bytes32 _r, bytes32 _s, uint8 _v) = splitSignature(_sig);
    address signer = ecrecover(prefixedHash, _v, _r, _s);
    return signer;
}

function splitSignature(bytes memory sig) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
    require(sig.length == 65, "invalid signature length");
    assembly {
        r := mload(add(sig, 32))
        s := mload(add(sig, 64))
        v := byte(0, mload(add(sig, 96)))
    }
}
