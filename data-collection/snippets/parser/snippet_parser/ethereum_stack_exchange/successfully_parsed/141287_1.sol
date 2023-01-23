
pragma solidity >=0.8.0 < 0.9.0;

struct Operations {
    uint256 sum;
    uint256 substraction;
    uint256 division;
    uint256 multiplication;
}

contract SimpleCalculator {

    function doAllOperations(uint256 number1,uint256 number2) public pure returns(Operations memory) {

        Operations memory operationsResult = Operations({
            sum: addTwoNumbers(number1, number2),
            substraction: subtractTwoNumbers(number1, number2),
            division: divideTwoNumbers(number1, number2),
            multiplication: multiplyTwoNumbers(number1, number2)
        });

        return operationsResult;

    }

    function addTwoNumbers(uint256 number1, uint256 number2) public pure returns(uint256) {
        uint256 addition = number1 + number2;
        return addition;
    }

    function subtractTwoNumbers(uint256 number1, uint256 number2) public pure returns(uint256) {
        uint256 subtraction = number1 - number2;
        return subtraction;
    }

    function divideTwoNumbers(uint256 number1, uint number2) public pure returns(uint256) {
        uint256 division = number1/number2;
        return division;
    }

    function multiplyTwoNumbers(uint256 number1, uint256 number2) public pure returns(uint256) {
        uint256 multiplication = number1*number2;
        return multiplication;
    }

}
