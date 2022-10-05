pragma solidity ^0.8.7;

contract Array {
    uint[10] public fixedArr; 
    uint[] public dynamicArr; 
    
    function addTofixedArray(uint i, uint element) public {
        fixedArr[i] = element;
    }

    function addToDynamicArray(uint element) public {
        
        
        dynamicArr.push(element);
    }

    function length() public view returns(uint[] memory) {
        
        uint[2] memory lengthArray;   
        lengthArray[0] = fixedArr.length; 
        lengthArray[1] = dynamicArr.length;
        return lengthArray;
    }

}
