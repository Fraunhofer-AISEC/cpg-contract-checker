
pragma solidity >=0.8.0 < 0.9.0;

contract SimpleCalculator{
function addTwoNumbers(uint256 number1,uint256 number2) public view returns(uint256){
    uint256 addition = number1 + number2;
    return addition;
}
function subtractTwoNumbers(int number1,int256 number2) public view returns(int256){
    int256 subtraction = number1 - number2;
    return subtraction;
}
function divideTwoNumbers(uint256 number1,uint number2) public view returns(uint256){
    uint256 division = number1/number2;
    return division;
}
function multiplyTwoNumbers(uint256 number1, uint256 number2) public view returns(uint256){
    uint256 multiplication = number1*number2;
    return multiplication;
}
}
