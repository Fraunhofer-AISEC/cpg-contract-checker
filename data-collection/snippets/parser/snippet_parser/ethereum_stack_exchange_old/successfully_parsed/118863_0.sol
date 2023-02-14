

pragma solidity 0.8.10;  
contract Types {  
      
        
        
        uint[6] data1;    
          
        
        
        function array_example() public returns (
        int[5] memory, uint[6] memory){  
                
            int[5] memory data 
            = [int(50), -63, 77, -28, 90];  
            data1 
            = [uint(10), 20, 30, 40, 50, 60];
                
            return (data, data1);  
      }  
    function add() public {
    
        
        for (uint256 i = 0; i < 5; i++) {
             s += a[i];
        }
        
    }
}