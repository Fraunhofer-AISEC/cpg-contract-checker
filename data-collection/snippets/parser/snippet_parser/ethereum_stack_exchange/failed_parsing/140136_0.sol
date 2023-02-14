function test_bytes(bytes32 test) external pure returns(bytes3 idx,uint256 idx2)
    {   

        

        assembly{
            calldatacopy(0x0,33,36)
            idx := mload(0x0)  
            idx2 := mload(add(idx, 32))  
        }
