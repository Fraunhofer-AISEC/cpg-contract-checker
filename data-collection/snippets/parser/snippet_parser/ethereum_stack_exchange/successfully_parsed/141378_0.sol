
pragma solidity >=0.8.3;

contract RevertArray {

    function reverseArray(uint[] memory array) public pure returns(uint[] memory) {

    uint length = array.length;
    uint numberOfElements = length -1;
    uint[] memory reversed = new uint[](length);
    
    uint i = numberOfElements;
    uint j;

    while( j < length) {
        reversed[j] = array[i];
        
        
        if(i > 0) {
            i--;
            j++; 
        }
  
    } 

    return reversed;

    }


}
