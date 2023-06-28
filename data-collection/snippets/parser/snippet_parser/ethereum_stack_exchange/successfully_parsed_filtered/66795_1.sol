pragma solidity ^0.5.1;

contract test {
    uint total;
    uint counter;

    function calcAverage( uint _newValue) public
    {
        total += _newValue;
        counter++;
    }

    function get() public view returns(uint)
    {
        return total / counter;
    }
}
