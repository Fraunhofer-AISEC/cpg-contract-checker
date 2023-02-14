contract A {
    function test1() public view returns(bool) {
        return false;
    }
}
contract B {
    function testCall(address addr, data) public view returns(bool) {
        return addr.call.value(0)(data);
    }
}
