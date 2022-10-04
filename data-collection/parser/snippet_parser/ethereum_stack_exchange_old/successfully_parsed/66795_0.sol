pragma solidity ^0.4.24;

contract test{

uint average;
uint counter;

function calcAverage( uint _newValue) public
{
    average = ((average * counter) + _newValue)/(counter + 1);
}

function get() public view returns(uint)
{
    return average;
}
}
