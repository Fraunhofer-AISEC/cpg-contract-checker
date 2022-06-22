pragma solidity 0.4.24;

contract Calculator{

    uint result=10;

    function Calculator() public
    {

    }

    function getResult() public view returns (uint)
    {
        return result;
    }

    function addition(uint num) public
    {
        result=result+num;

    }

    function sub(uint num) public
    {
        result = result - num;
    }

    function mult(uint num) public
    {
        result =result*num;
    }

    function div(uint num) public
    {
        result = result/num;
    }

    }
