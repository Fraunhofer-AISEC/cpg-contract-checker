contract UserBasic {
    bytes32 test;
    function getBytes() constant returns(bytes32) {
        return test;
    }
    function setBytes(bytes32 _bytes) {
        test = _bytes;
    }
}
