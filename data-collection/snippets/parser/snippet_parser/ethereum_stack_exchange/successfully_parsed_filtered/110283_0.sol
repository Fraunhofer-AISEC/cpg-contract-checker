pragma solidity >=0.6.5;
 
   

contract Types {  
    
    function test(uint32 first) public pure returns (uint128) {
        uint32 second = 1049;
        uint64 third = 1632141235;
        
        return uint128(first | second << 32 | third << 64);
    }
}
