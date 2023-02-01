
pragma solidity >=0.5.0 <0.9.0;

contract C {
    
    
    
    uint[] x;

    
    function f(uint[] memory memoryArray) public {
        x = memoryArray; 
        uint[] storage y = x; 
        y[7]; 
        y.pop(); 
        delete x; 
        
        
        
        
        
        
        g(x); 
        h(x); 
    }

    function g(uint[] storage) internal pure {}
    function h(uint[] memory) public pure {}
}
