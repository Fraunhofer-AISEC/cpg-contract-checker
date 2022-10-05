contract Assertnil {
    bytes32 v;
    function test() constant returns (bool) {
        bytes32 w;
        assert(v == w);
        return true;
    }
}
