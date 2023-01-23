function thirdTest() public pure returns (uint len, uint32[] memory) {                              
    uint32[] memory res;                                                                            
    assembly {                                                                                      
        res := mload(0x40)                                                                          
        len := mload(res)                                                                           
    }                                                                                               
    return (len, res);                                                                           
}                                                                                                   
                                                                                                    
function fourthTest() public pure returns (uint32[] memory, uint32 len) {                           
    uint32[] memory res;                                                                            
    assembly {                                                                                      
        res := mload(0x40)                                                                          
        len := mload(res)                                                                           
    }                                                                                               
    return (res, len);                                                                              
}
