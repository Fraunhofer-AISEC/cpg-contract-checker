pragma solidity ^0.4.21;

contract Foo {
    function getRange(uint n) public view returns(uint[]) {
        uint[] storage result;
        for (uint i = 0; i < n; i++)
            if (i> 1)
               result.push(i);
        return result;
    }
}
