

pragma solidity ^0.8.0; 
contract MultipleValues{
    function returnValues() public pure returns (uint, bool, uint8[3] memory) {
        return (23, true, [1,2,3]);
    }
}
