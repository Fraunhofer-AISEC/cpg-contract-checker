contract Test {

    function test() public pure returns (bytes memory, bytes memory) {
        int8 a = 1;
        uint16 b=2;
        return (abi.encode(a,b), abi.encodePacked(a,b));
    }
}
