function bytes2string(bytes32[] data) returns (string) {
    bytes memory r = new bytes(1);
    r[0] = bytes1(data[0]);
    return string(r);
}
