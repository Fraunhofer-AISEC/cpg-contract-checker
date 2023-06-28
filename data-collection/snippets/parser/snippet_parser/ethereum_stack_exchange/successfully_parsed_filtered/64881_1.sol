pragma solidity ^0.5.0;

contract second {
    uint calculationResult;
    address public linkedContract;

    function changeContract(address newContract) public {
        linkedContract = newContract;
    }

    function delegatedCalculation(uint firstNumber, uint secondNumber) public {

    }
}
