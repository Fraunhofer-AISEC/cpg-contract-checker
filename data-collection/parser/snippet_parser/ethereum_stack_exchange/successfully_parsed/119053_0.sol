
pragma solidity ^0.8.0;

contract ComplexType {

    uint[100] public numbers;

    struct Number {
        uint number;
        uint index;
    }
    
    
    function push1(Number[] memory indexesToChange) external {

        for (uint i=0; i < indexesToChange.length; i++) {
            numbers[indexesToChange[i].index] += indexesToChange[i].number;
        }
    }

    
    function push2(Number[] memory indexesToChange) external {

        uint[100] memory _numbers = numbers;

        for (uint i=0; i < indexesToChange.length; i++) {
            _numbers[indexesToChange[i].index] += indexesToChange[i].number;
        }

        numbers = _numbers;
    }    
}
