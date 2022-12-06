pragma solidity ^0.7.4;

contract Parent
{
    uint public number;
}

contract Child is Parent
{
    function setParentNumber(uint _number) public {
        number = _number;
    }
}
