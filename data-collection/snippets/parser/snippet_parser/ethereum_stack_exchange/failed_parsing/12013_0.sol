~pragma solidity ^0.4.9;
contract SimpleTest {
    int public count;

    function IncCounter()
    {
        count++;
    }

    function GetCounter() constant returns(int)
    {
        return count;
    }
}
