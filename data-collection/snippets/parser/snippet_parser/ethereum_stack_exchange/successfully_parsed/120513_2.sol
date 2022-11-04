address private exchange = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;
bytes32 private typehash =  keccak256(abi.encodePacked('SOME VERY LONG STRING AS I NEED TO SEE IF ANYTHING IS BROKEN WITH IT'));   
address private tokenFrom = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;
address private tokenTo = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;
address private user = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;
uint256 private chainId = 42;
bool private enabled = true;
bytes32 private c1 =  keccak256(abi.encodePacked('X'));   
bytes32 private c2 =  keccak256(abi.encodePacked('Y'));   
bytes32 private c3 =  keccak256(abi.encodePacked('Z'));   


function hash() external returns (bytes memory) {
    return abi.encode(exchange, typehash, tokenFrom, tokenTo, user, chainId, enabled, c1, c2, c3);
}

function hash2() external returns (bytes memory) {
    bytes memory m1 =abi.encode(exchange, typehash, tokenFrom, tokenTo, user, chainId, enabled);
    bytes memory m2 = abi.encodePacked(c1, c2, c3);
    return bytes.concat(m1, m2);
}
