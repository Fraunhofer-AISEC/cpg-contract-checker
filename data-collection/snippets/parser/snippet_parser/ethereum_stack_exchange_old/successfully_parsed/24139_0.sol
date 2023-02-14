contract Assertnil {
    bytes32 v;
    function test() constant returns (bool) {
        assert(v == "");
        return true;
    }
}
