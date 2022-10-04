
pragma solidity ^0.4.21; 

contract CAT {
    event XYZ (uint Z ) ;
    uint[] x;  
    uint a ;

    function f(uint[] memoryArray) public {
        x = memoryArray; 
        uint[] storage y = x; 
        y.length = 2;
        a = y.length; 
        emit XYZ (a);
    }

    
    function getValue() external view returns(uint[]) {
        return x;
    }
    
}
