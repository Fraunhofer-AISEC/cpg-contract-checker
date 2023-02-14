function secondTest() public pure returns (uint len, uint32[] memory) {                             
    uint32[] memory res;                                                                         
    assembly {                                                                                      
        res := mload(0x40)

        
        
        
        mstore(0x40, add(add(res, 0x20), mul(10, 0x20)))
        
        mstore(res, 10)
        len := mload(res)                                                                           
    }                                                                                               
    return (len, res);                                                                              
}    
