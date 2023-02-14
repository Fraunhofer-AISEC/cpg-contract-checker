function parseBytes32_op2(bytes32 _data) pure public returns (bytes1 fist, bytes2 second, bytes10 third, bytes20 fourth) {

    first = bytes1(_data);
    second = bytes1(_data << 8);
    third = bytes10(_data << 8 * 2);
    fourth = bytes20(_data << 8 * 12);
}
