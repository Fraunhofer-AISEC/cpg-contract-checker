pragma solidity ^0.4.10;

contract Parent
{

    uint public value;

    function isValueOne() public constant returns (bool) {
        return (value == 1);
    }

}


contract Child is Parent
{

    function test() public {
        value = 1;
    }

    function verify() constant returns (bool) {
        require(isValueOne());
        return true;
    }
}
