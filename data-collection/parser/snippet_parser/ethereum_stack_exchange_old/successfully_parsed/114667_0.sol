pragma solidity ^0.8.0;                                                                                 
                                                                                                       
contract Test {                                                                                    
    function test() public pure returns (uint len, uint32[] memory) {                                   
        uint32[] memory res = new uint32[](10);                                                         
        assembly {                                                                                      
            len := mload(res)                                                                           
        }                                                                                               
        return (len, res);                                                                              
    }                                                                                                   
                                                                                                    
    function secondTest() public pure returns (uint len, uint32[] memory) {                             
        uint32[] memory res;                                                                         
        assembly {                                                                                      
            res := mload(0x40)                                                                          
            mstore(res, 10)                                                                             
            len := mload(res)                                                                           
        }                                                                                               
        return (len, res);                                                                              
    }                                                                                                
}
