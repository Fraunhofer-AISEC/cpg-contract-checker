contract Bytes {

    function convert(bytes b) public pure returns(uint) {
        return uint(b);
    }
}
