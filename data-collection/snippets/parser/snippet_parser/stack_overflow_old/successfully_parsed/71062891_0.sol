pragma solidity ^0.8.0;

contract Req {
    uint public year = 2022;
    uint public age = 5;
    function changeAge() internal {
        age++;
    }
    function checkingN(uint _x) public {
        year++;
        changeAge();
        require(_x == 5, "You entered wrong number");
    }


}
