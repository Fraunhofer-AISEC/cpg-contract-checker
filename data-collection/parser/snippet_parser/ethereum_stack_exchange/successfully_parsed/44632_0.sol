function dsign(bytes32 hash) public constant returns(bytes32){
    bytes memory prefix = "\x19Ethereum Signed Message:\n32";
    bytes32 prefixedHash = keccak256(prefix, hash);
    return prefixedHash;
}

function verify(bytes32 _message, uint8 _v, bytes32 _r, bytes32 _s) constant returns (address) {
    address signer = ecrecover(_message, _v, _r, _s);
    return signer;
}

function recovery(bytes32 _messagehash,uint8 _v,bytes32 _r,bytes32 _s) constant returns (address){
    address signer = ecrecover(_messagehash,_v,_r, _s);
    return signer;
}
