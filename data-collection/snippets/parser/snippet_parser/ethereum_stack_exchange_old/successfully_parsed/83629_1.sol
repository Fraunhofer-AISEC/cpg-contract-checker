pragma solidity >=0.5.0 <0.7.0;
contract deletefromarray{
uint[] array;
mapping(uint=>uint) indexOfValue;

function removeWithoutGap(uint _valueToDelete) public {
    uint index = indexOfValue[_valueToDelete];
        if (index >= array.length) return;

        if (array.length > 1) {
        array[index] = array[array.length-1];
        }
        array.length--; 
    }
}
