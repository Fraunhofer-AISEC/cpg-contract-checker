contract ColdWarmGas {
    uint256 x = 1;  
    uint256 y = 2;  

    
    function test1() external view returns (uint256 a) {
        a = x;      
        a = a + x;  
    }

    
    function test2() external view returns (uint256 a) {
        a = x;      
        a = a + y;  
    }

    
    function test3() external view returns (uint256 a) {
        a = x;      
        a = a + y;  
        a = a + y;  
    }
}
