contract Test {
    function test() public pure returns (bytes32[]) {
        bytes32[] memory foo = new bytes32[](2);
        foo[0] = "hello";
        foo[1] = "goodbye";

        return foo;
    }
}
