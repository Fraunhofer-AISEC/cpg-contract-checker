function VerifyMessage(bytes memory sig,string memory msg1, string memory amount, string memory nonce) public pure returns (address) {
    (uint8 _v, bytes32 _r, bytes32 _s) = splitSignature(sig);

    bytes memory prefix = "\x19Ethereum Signed Message:\n32";
    bytes32 prefixedHashMessage = keccak256(abi.encodePacked(prefix,msg1,amount,nonce));
    address signer = ecrecover(prefixedHashMessage, _v, _r, _s);
    return signer;
}
