pragma solidity ^0.4.20;

contract cntrct {
    uint public testVal;

    function runF() payable public
    {
        testVal += msg.value;
    }

    function reader() public view returns(uint)
    {
        return testVal;
    }
}
