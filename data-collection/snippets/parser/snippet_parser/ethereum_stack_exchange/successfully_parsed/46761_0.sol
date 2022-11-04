pragma solidity ^0.4.21;

contract Foo {
    function getRange(uint n) public pure returns(uint[]) {
        uint[] memory result;
        for (uint i = 0; i < n; i++)
            if (someCondition(i))
               result.push(i);
        return result;
    }
}
