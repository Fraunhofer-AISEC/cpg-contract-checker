pragma solidity ^0.4.21;

contract Foo {
    function getRange(uint n) public pure returns(uint[]) {
        uint[] memory result = new uint[](n);
        for (uint i = 0; i < n; i++)
            result[i] = i;
        return result;
    }
}
