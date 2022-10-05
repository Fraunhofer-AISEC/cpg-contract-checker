pragma solidity ^0.4.11;

contract Test2 {
    uint[2][] public a;

    function putX(uint x) public {
        a.push([x, block.number]);
    }

    function getA() public view returns (uint[2][]) {
        return a;
    }
}
