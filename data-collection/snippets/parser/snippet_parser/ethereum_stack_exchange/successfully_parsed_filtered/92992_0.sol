pragma solidity >0.6.0;

contract abs{
    uint256[] public amounts;
    
    function contractParams(uint256 index, uint256 val) external{
        amounts[index] = amounts[index] + val;
    }
}
