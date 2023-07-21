pragma solidity ^0.8.0;

contract ArrayShift {
    function shiftArray(uint[] memory arr) public pure returns (uint[] memory) {
        uint arrayLength = arr.length;

        if (arrayLength > 1) {
            uint firstElement = arr[0];
            for (uint i = 0; i < arrayLength - 1; i++) {
                arr[i] = arr[i + 1];
            }
            arr[arrayLength - 1] = firstElement;
        }

        return arr;
    }
}
