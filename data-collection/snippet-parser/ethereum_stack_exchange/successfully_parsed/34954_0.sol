contract Test {

    function myTest(uint a) private returns (bytes32) {

        bytes32 a = bytes32(a);
        return a;
    }

    bytes32 b = myTest(1234);

}
