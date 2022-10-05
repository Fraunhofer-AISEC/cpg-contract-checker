contract foo {
    function test() public payable returns (uint256) {
        return msg.value;
    }
}

contract bar is foo {
    function anotherTest() public payable returns (uint256) {
        return super.test.value(msg.value / 2)();
    }
}
