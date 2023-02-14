contract X {
    function test_bytes(bytes32 test) external pure returns(bytes3 idx,uint256 idx2) {   
        

        assembly {
            idx := shl(sub(256, 24), test)
            idx2 := and(test, 0xffffff)
        }
    }
}
