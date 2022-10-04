contract Bytes {

    function convert(bytes32 b) public pure returns(uint) {
        return uint(b);
    }
}
