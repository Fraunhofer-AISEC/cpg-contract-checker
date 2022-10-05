pragma solidity ^0.4.24;

contract A
{
    uint256[] public array0;
    uint256[] public array1;
    constructor () public
    {
        array0.push(123);
        array1.push(456);
    }
    function test() public
    {
        uint256[][] memory storageArrays = new uint256[][](2);
        storageArrays[0] = array0;
        storageArrays[1] = array1;

        storageArrays[0][0]++;
        storageArrays[1][0]--;
    }
}
