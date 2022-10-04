function parseBytes32_op1(bytes32 _data) pure public returns (bytes1 first, bytes1 second, bytes10 third, bytes20 fourth) {
    assembly {
        first := _data
        second := shl(8, _data)
        third := shl(add(8, 8), _data)
        fourth := shl(add(16, 80), _data)
    }
}
