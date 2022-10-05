pragma solidity ^0.5.0;

contract first {
    uint calculationResult;
    address public linkedContract;

    function calculate(uint firstNumber, uint secondNumber) public {
        calculationResult = firstNumber * secondNumber;
    }
}
