function A(uint[] array) public pure returns (uint[]) {
    B(*array);  
    return array;    
}


function B(uint[] *array) internal pure {
    
}
