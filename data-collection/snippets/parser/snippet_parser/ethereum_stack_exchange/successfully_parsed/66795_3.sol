pragma solidity ^0.5.1;

contract test {
    uint average;
    uint counter;

    function calcAverage( uint _newValue) public
    {
        average = ((average * counter) + _newValue)/(counter + 1);
        counter++;
    }

    function get() public view returns(uint)
    {
        return average;
    }
}
