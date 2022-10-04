pragma solidity ^0.4.11;

contract Test1 {
    uint[] public a;
    uint[] public b;

    function putX(uint x) public {
        a.push(x);
        b.push(block.number);
    }

    function getA() public view returns (uint[]) {
        return a;
    }

    function getB() public view returns (uint[]) {
        return b;
    }
}
