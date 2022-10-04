contract Converter {
    function convert(uint[] calldata test) public pure returns(uint[] memory test1, uint[] memory test2) {
        test1 = test;
        assembly {
            mstore(test1, 1)
        }
        test2 = test;
    }
}
