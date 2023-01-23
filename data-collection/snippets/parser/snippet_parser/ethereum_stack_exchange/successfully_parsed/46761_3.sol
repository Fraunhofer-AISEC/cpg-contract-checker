pragma solidity ^0.4.21;

contract Foo {
    function getRange(uint n) public pure returns(unit[] memory result) {
        uint j = 0; 
        for (uint i = 0; i < n; i++)
            if (someCondition(i))
                result[j] = i;
                j++;
        }
}
