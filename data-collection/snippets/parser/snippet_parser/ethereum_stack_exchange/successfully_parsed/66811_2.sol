pragma solidity ^0.5.0;

contract Test {

    uint public number = 10;

    function setNumber(uint _x) public returns (uint)
    {
        number = number+_x;

        return number + 5;
    }

    function GetNumber() public view returns (uint)
    {
        return number;
    }
}
