
pragma solidity 0.8.7;

contract RevertAndAssert {

    address public owner = msg.sender;
    uint public age = 15;

    error FalseAge();

    function checkRevert(uint _x) public {
        age = age + 6;
        if (_x > 20) {
          revert FalseAge();
        }
    }
}
