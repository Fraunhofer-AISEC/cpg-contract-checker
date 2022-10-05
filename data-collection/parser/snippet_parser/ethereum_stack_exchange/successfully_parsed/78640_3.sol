pragma solidity ^0.6.0;

contract Tata
{
    uint256[] public testArray;

    function getLength() external view returns (uint256)
    {
        return testArray.length;
    }
    function setLength(uint256 newLength) external
    {
        assembly { sstore(testArray_slot, newLength) }
    }
}
