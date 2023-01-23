contract Test {
    bool public success;
    bytes public data;
    function test (address target) public {
        (success, data) = address(target).call("0x1234");
    }
}
