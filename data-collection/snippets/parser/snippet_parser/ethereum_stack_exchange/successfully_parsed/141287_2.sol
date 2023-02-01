
pragma solidity >=0.8.0 < 0.9.0;

contract SimpleCalculator{

    uint number1;
    uint number2;

    function setImputNumbers(uint firstNumber, uint secondNumber) public {
        number1 = firstNumber;
        number2 = secondNumber;
    }

    function addTwoNumbers() public view returns(uint256){
        uint256 addition = number1 + number2;
        return addition;
    }

    function subtractTwoNumbers() public view returns(int256){
        int256 subtraction = int(number1) - int(number2);
        return subtraction;
    }

    function divideTwoNumbers() public view returns(uint256){
        uint256 division = number1/number2;
        return division;
    }

    function multiplyTwoNumbers() public view returns(uint256){
        uint256 multiplication = number1*number2 ;
        return multiplication;
    }

}
