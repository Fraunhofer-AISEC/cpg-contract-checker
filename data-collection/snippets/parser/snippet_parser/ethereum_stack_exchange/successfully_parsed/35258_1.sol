function split3(bytes9 source) public pure returns(bytes3, bytes3, bytes3) {
    bytes3[3] memory x = [bytes3(0), 0, 0];

    assembly {
        mstore(x, source)
        mstore(add(x, 29), source)
        mstore(add(x, 58), source)
    }
    return (x[0], x[1], x[2]);
}
