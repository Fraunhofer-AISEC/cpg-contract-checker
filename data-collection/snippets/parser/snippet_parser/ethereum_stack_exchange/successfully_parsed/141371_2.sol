
pragma solidity >=0.5.0 <0.9.0;

contract RevertArray {

    function reverseArray(uint[] memory array) public pure returns(uint[] memory) {

    uint length = array.length;
    uint numberOfElements = length -1;
    uint[] memory reversed = new uint[](length);
    
    uint i = numberOfElements;
    uint j;

    while( j < numberOfElements) {
        reversed[j] = array[i];    
        i--;
        j++;
    } 

    reversed[j] = array[i];

    return reversed;

    }

}
